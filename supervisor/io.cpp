#include "io.h"

LiquidCrystal lcd(18, 17, 16, 15, 14, 19);

static const uint32_t QUARTZ_FREQUENCY = 16 * 1000 * 1000 ; // 16 MHz

static const byte MCP2515_SCK = 12 ; // SCK pin, SCK input of MCP2515
static const byte MCP2515_SI  = 11 ; // MOSI pin, SI input of MCP2515
static const byte MCP2515_SO  = 10 ; // MISO pin, SO output of MCP2515

static const byte CAN_CS  =  6 ; // CS input of MCP2515
static const byte CAN_INT =  5 ; // INT output of MCP2515

SPIClass mySPI (&sercom1, MCP2515_SO, MCP2515_SI, MCP2515_SCK, SPI_PAD_0_SCK_3, SERCOM_RX_PAD_2);

ACAN2515 can (CAN_CS, mySPI, CAN_INT);

//----------------------------------------Init---------------------------------------

void beginIO(void) {
  //--- Switch on builtin led
  pinMode (LED_BUILTIN, OUTPUT) ;
  digitalWrite (LED_BUILTIN, HIGH) ;

  //--- Configure LCD
  lcd.begin(20, 4); // 20 colonnes et 4 lignes lcd . setCursor (0 , 3);
  lcd.setCursor(0, 0);
  lcd.print("Ramirez");

  Serial.begin(9600);
  //--- Wait for serial (blink led at 10 Hz during waiting)
  while (!Serial) {
    delay (50) ;
    digitalWrite (LED_BUILTIN, !digitalRead (LED_BUILTIN)) ;
  }

  Serial1.begin (19200);
  //--- Wait for serial1 (blink led at 10 Hz during waiting)
  while (!Serial1) {
    delay (50) ;
    digitalWrite (LED_BUILTIN, !digitalRead (LED_BUILTIN)) ;
  }

  //--- Configure SPI
  mySPI.begin () ;

  //--- Define alternate pins for SPI
  pinPeripheral (MCP2515_SI, PIO_SERCOM);
  pinPeripheral (MCP2515_SCK, PIO_SERCOM);
  pinPeripheral (MCP2515_SO, PIO_SERCOM);

  //--- Can configuration
  Serial.println ("Configure ACAN2515") ;
  ACAN2515Settings settings (QUARTZ_FREQUENCY, 125 * 1000) ;
  //ACAN2515Settings settings (QUARTZ_FREQUENCY, 111111) ;
  #ifdef LOOPBACK
  settings.mRequestedMode = ACAN2515Settings::LoopBackMode ; // Select loopback mode
  #endif
  const ACAN2515Mask rxm0 = standard2515Mask (0x7FF, 0xFF, 0) ;
  const ACAN2515Mask rxm1 = standard2515Mask (0, 0xFF, 0) ;
  const ACAN2515AcceptanceFilter filters [] = {
    {standard2515Filter (PERIODICAL_DATA, ID_FEATHER, 0), receive0},
    {standard2515Filter (PERIODICAL_DATA, ID_FEATHER, 0), receive0},
    {standard2515Filter (0, ID_FEATHER, 0), receive1}
  } ;
  const uint32_t errorCode = can.begin (settings, [] { can.isr () ; }, rxm0, rxm1, filters, 3);
  if (errorCode == 0) {
    Serial.println ("") ;
    Serial.print ("Bit Rate prescaler: ") ;
    Serial.println (settings.mBitRatePrescaler) ;
    Serial.print ("Propagation Segment: ") ;
    Serial.println (settings.mPropagationSegment) ;
    Serial.print ("Phase segment 1: ") ;
    Serial.println (settings.mPhaseSegment1) ;
    Serial.print ("Phase segment 2: ") ;
    Serial.println (settings.mPhaseSegment2) ;
    Serial.print ("SJW:") ;
    Serial.println (settings.mSJW) ;
    Serial.print ("Triple Sampling: ") ;
    Serial.println (settings.mTripleSampling ? "yes" : "no") ;
    Serial.print ("Actual bit rate: ") ;
    Serial.print (settings.actualBitRate ()) ;
    Serial.println (" bit/s") ;
    Serial.print ("Exact bit rate ? ") ;
    Serial.println (settings.exactBitRate () ? "yes" : "no") ;
    Serial.print ("Sample point: ") ;
    Serial.print (settings.samplePointFromBitStart ()) ;
    Serial.println ("%") ;
    Serial.println ("") ;
  } else {
    Serial.print ("Configuration error 0x") ;
    Serial.println (errorCode, HEX) ;
  }
}

//———————————————————————————————————CAN————————————————————————————————————————

void readCAN(void) {
  CANMessage frame;

  if (can.available()) {
    can.receive (frame) ;
    Serial.print("Received, id = ") ;
    Serial.print(frame.id, HEX);
    Serial.print(", len = ");
    Serial.println(frame.len);

    Serial.print("reception, data:");
    for (int i = 0; i < 8; i++) {
      Serial.print(frame.data[i]);
    }
    Serial.println("");
  }
}

//——————————————————————————————————————————————————————————————————————————————

void sendCAN(uint8_t receiver_id, uint8_t sender_id, uint8_t frame_id, uint8_t data0, uint8_t data1, uint8_t data2, uint8_t data3) {
  CANMessage frame;
  frame.id = frame_id;

  frame.data[0] = receiver_id;
  frame.data[1] = sender_id;
  frame.data[2] = frame_id;
  frame.data[3] = 0;
  frame.data[4] = data0;
  frame.data[5] = data1;
  frame.data[6] = data2;
  frame.data[7] = data3;

  frame.len = CAN_LENGTH;

  if (can.tryToSend(frame)) {
    Serial.print("trame envoyée, frame.id: ");
    Serial.println(frame.id, HEX);
    Serial.print("data: ");
    for (int i = 0; i < 8; i++) {
      Serial.print(frame.data[i], HEX);
      Serial.print(";");
    }
    Serial.println("");
    Serial.println("");
  }
  else {
    Serial.print("erreur sur trame, data:");
    for (int i = 0; i < 8; i++) {
      Serial.print(frame.data[i]);
    }
    Serial.println("");
    Serial.println("");
  }
}

//——————————————————————————————————————————————————————————————————————————————

static void receive0 (const CANMessage & inMessage) {
  Serial.println ("Receive 0") ;
  Serial.print("inMessage.id: ");
  Serial.println(inMessage.id, HEX);
  Serial.print("inMessage.data[7]: ");
  Serial.println(inMessage.data[7], HEX);
  Serial.println("");

  if(inMessage.len == CAN_LENGTH){
    switch (inMessage.data[1]) {
      case ID_STM32_1:
        mqttClient.publish("arthur/STM32_1", "THERM/PERIODICAL_DATA: ");
        mqttClient.loop();
        break;
      case ID_STM32_2:
        if(inMessage.data[2] == CO2_DATA){
          mqttClient.publish("arthur/STM32_2", "CO2/PERIODICAL_DATA: ");
          mqttClient.loop();
        }else if(inMessage.data[2] == HUM_DATA){
          mqttClient.publish("arthur/STM32_2", "HUM/PERIODICAL_DATA: ");
          mqttClient.loop();
        }
        break;
      default:
        mqttClient.publish("arthur/PERIODICAL_DATA", "Unknown sender");
        mqttClient.loop();
        break;
    }
  }
  //mqttClient.publish("arthur/receive0", "Receive 0");
  mqttClient.loop();
  
}

//——————————————————————————————————————————————————————————————————————————————

static void receive1 (const CANMessage & inMessage) {
  /*Serial.println ("Receive 1") ;
  Serial.print("inMessage.id: ");
  Serial.println(inMessage.id, HEX);
  Serial.print("inMessage.data[7]: ");
  Serial.println(inMessage.data[7], HEX);
  Serial.println("");*/

  if(inMessage.len == CAN_LENGTH){
    switch (inMessage.data[1]) {
      case ID_STM32_1:
        if(inMessage.id == DATA_REQUEST){
          mqttClient.publish("arthur/STM32_1", "DATA_REQUEST accepted");
          mqttClient.loop();
        }else if(inMessage.id == ACTUATOR_COMMAND){
          mqttClient.publish("arthur/STM32_1", "ACTUATOR_COMMAND: ");
          mqttClient.loop();
        }else if(inMessage.id == PERIOD_CONFIGURATION){
          mqttClient.publish("arthur/STM32_1", "PERIOD_CONFIGURATION: ");
          mqttClient.loop();
        }else if(inMessage.id == BOARD_ID_CONFIGURATION){
          mqttClient.publish("arthur/STM32_1", "BOARD_ID_CONFIGURATION: ");
          mqttClient.loop();
        }else if(inMessage.id == READ_BOARD_ID){
          mqttClient.publish("arthur/STM32_1", "READ_BOARD_ID: ");
          mqttClient.loop();
        }
        break;
      case ID_STM32_2:
        if(inMessage.id == DATA_REQUEST){
          mqttClient.publish("arthur/STM32_2", "DATA_REQUEST accepted");
          mqttClient.loop();
        }else if(inMessage.id == ACTUATOR_COMMAND){
          mqttClient.publish("arthur/STM32_2", "ACTUATOR_COMMAND: ");
          mqttClient.loop();
        }else if(inMessage.id == PERIOD_CONFIGURATION){
          mqttClient.publish("arthur/STM32_2", "PERIOD_CONFIGURATION: ");
          mqttClient.loop();
        }else if(inMessage.id == BOARD_ID_CONFIGURATION){
          mqttClient.publish("arthur/STM32_2", "BOARD_ID_CONFIGURATION: ");
          mqttClient.loop();
        }else if(inMessage.id == READ_BOARD_ID){
          mqttClient.publish("arthur/STM32_2", "READ_BOARD_ID: ");
          mqttClient.loop();
        }
        break;
      case ID_STM32_3:
        if(inMessage.id == DATA_REQUEST){
          mqttClient.publish("arthur/STM32_3", "DATA_REQUEST accepted");
          mqttClient.loop();
        }else if(inMessage.id == ACTUATOR_COMMAND){
          mqttClient.publish("arthur/STM32_3", "ACTUATOR_COMMAND: ");
          mqttClient.loop();
        }else if(inMessage.id == PERIOD_CONFIGURATION){
          mqttClient.publish("arthur/STM32_3", "PERIOD_CONFIGURATION: ");
          mqttClient.loop();
        }else if(inMessage.id == BOARD_ID_CONFIGURATION){
          mqttClient.publish("arthur/STM32_3", "BOARD_ID_CONFIGURATION: ");
          mqttClient.loop();
        }else if(inMessage.id == READ_BOARD_ID){
          mqttClient.publish("arthur/STM32_3", "READ_BOARD_ID: ");
          mqttClient.loop();
        }
        break;
      case ID_BASYS3:
        if(inMessage.id == DATA_REQUEST){
          mqttClient.publish("arthur/BASYS3", "DATA_REQUEST: ");
          mqttClient.loop();
        }else if(inMessage.id == ACTUATOR_COMMAND){
          mqttClient.publish("arthur/BASYS3", "ACTUATOR_COMMAND: ");
          mqttClient.loop();
        }else if(inMessage.id == PERIOD_CONFIGURATION){
          mqttClient.publish("arthur/BASYS3", "PERIOD_CONFIGURATION: ");
          mqttClient.loop();
        }else if(inMessage.id == BOARD_ID_CONFIGURATION){
          mqttClient.publish("arthur/BASYS3", "BOARD_ID_CONFIGURATION: ");
          mqttClient.loop();
        }else if(inMessage.id == READ_BOARD_ID){
          mqttClient.publish("arthur/BASYS3", "READ_BOARD_ID: ");
          mqttClient.loop();
        }
        break;
    }
  }
  //mqttClient.publish("arthur/receive1", "Receive 1");
  mqttClient.loop();
}

//——————————————————————————————————————————————————————————————————————————————

void resetDataToSend(uint8_t dataToSend[8]){
  for(int i = 0; i < 8; i++){
    dataToSend[i] = 0x00;
  }
}

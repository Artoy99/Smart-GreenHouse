#include "io.h"
extern LiquidCrystal lcd;
#include <ACAN2515.h>
#include <wiring_private.h>

static const uint32_t QUARTZ_FREQUENCY = 16 * 1000 * 1000 ; // 16 MHz

static const byte MCP2515_SCK = 12 ; // SCK pin, SCK input of MCP2515
static const byte MCP2515_SI  = 11 ; // MOSI pin, SI input of MCP2515
static const byte MCP2515_SO  = 10 ; // MISO pin, SO output of MCP2515

SPIClass mySPI (&sercom1, MCP2515_SO, MCP2515_SI, MCP2515_SCK, SPI_PAD_0_SCK_3, SERCOM_RX_PAD_2);

static const byte CAN_CS  =  6 ; // CS input of MCP2515
static const byte CAN_INT =  5 ; // INT output of MCP2515

ACAN2515 can (CAN_CS, mySPI, CAN_INT) ;

bool valueButton[8] = {false, false, false, false, false, false, false, false};

uint8_t data[8] = {0,0,0,0,0,0,0,0};    //tableau de data pour l'envoi des frames sur le bus CAN

uint8_t valueEncoder = 0;

void beginIO(void){
  lcd.begin(20, 4); // 20 colonnes et 4 lignes lcd . setCursor (0 , 3);
  lcd.setCursor(2,0);
  lcd.print("Nombalay Ramirez");

  //--- Configure SPI
  mySPI.begin () ;
  //--- Define alternate pins for SPI
  pinPeripheral (MCP2515_SI, PIO_SERCOM);
  pinPeripheral (MCP2515_SCK, PIO_SERCOM);
  pinPeripheral (MCP2515_SO, PIO_SERCOM);
  Serial.begin(9600);
  Serial1.begin (19200);
  ACAN2515Settings settings (QUARTZ_FREQUENCY, 125 * 1000) ;
  //settings.mRequestedMode = ACAN2515Settings::LoopBackMode ; // Select loopback mode
  can.begin (settings, [] { can.isr () ; }) ;
}

byte encoderValue (void){
  readSerial();  
  // Gestion debordement
  if(valueEncoder > 63){
    valueEncoder = 0;
  }else if(valueEncoder < 0){
    valueEncoder = 63;
  }
  return valueEncoder;
}

/*  La fonction retourne true si la valeur du parametre
 *  est connue.
 *  Elle retourne false sinon.
*/ 
bool pushButton (const byte inButton){
  readSerial();
  if(inButton < 3 and inButton >= 0){
    //if(valueButton[inButton]){
    //  writeCAN(inButton);
    //}
    writeCAN(inButton);
    return valueButton[inButton];
  }else{
    return false;
  }
}

void readSerial(void){
  byte incomingByte;
  while(Serial1.available()){
    incomingByte = Serial1.read();

    for(int i=0; i<3; i++){
      valueButton[i] = incomingByte&(1<<i);
    }
    if(incomingByte&(1<<4)){
      valueEncoder++;
    }
    if(incomingByte&(1<<5)){
      valueEncoder--;
    }
  }
}

void writeCAN(byte const button){
  CANMessage frame ;
  frame.id = 0x542;
  frame.len = 3;
  updateDataWithButton(frame);
  if(can.tryToSend(frame)){
    //Serial.print("trame envoyée, appui sur bouton :");
    //Serial.println(button);
  }
  else{
    //Serial.print("erreur sur trame, appui sur bouton :");
    //Serial.println(button);
  }
}

void updateDataWithButton(CANMessage &frame){
  //Serial.print("nouvelle trame: ");
  for(byte i = 0; i < 8; i++){
    data[i] = 0;
    if(valueButton[i]){
      data[i] = 1;
    }
    frame.data[i] = data[i];
    //Serial.print(data[i]);
  }
  //Serial.println(" ");
}

void lookForCanMessage(void){
  CANMessage frame;
  
  if (can.available ()) {
    can.receive (frame) ;
    Serial.print("Received, id = ") ;
    Serial.print(frame.id, HEX);
    Serial.print(", len = ");
    Serial.println(frame.len);
    sendEncoderValue();
  }
}

void sendEncoderValue(void){
  CANMessage frame;
  frame.id = 0x544;
  frame.len = 6;

  for(int i=0; i<6; i++){
    if(valueEncoder & (1 << i)){
       frame.data[i] = 1;}
  }
  
  if(can.tryToSend(frame)){
    Serial.print("trame envoyée, valeur encodeur:");
    Serial.println(valueEncoder);
  }
  else{
    Serial.print("erreur sur trame, valeur encodeur:");
    Serial.println(valueEncoder);
  }
}

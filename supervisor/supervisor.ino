#include "io.h"

int hum = 0;
int temp = 0;
bool manual = false;

uint8_t dataToSend[8];

void setup(){
  beginIO();
  mqttSetup();
  
  lcd.setCursor(0, 1);
  lcd.print("Init done");
}


static uint32_t gBlinkLedDate = 0 ;
static uint32_t gSentFrameCount = 0 ;
static uint8_t gTransmitBufferIndex = 0 ;


void loop(){
  
  while(can.dispatchReceivedMessage())
  {}

  if(!manual){
    if(temp > 30){
      //envoie actionneur stop led
      sendCAN(ID_BASYS3, ID_FEATHER, ACTUATOR_COMMAND, 0x00, 0x00, 0x00, 0x00);
    }else if(temp < -25){
      //envoie actionneur start led
      sendCAN(ID_BASYS3, ID_FEATHER, ACTUATOR_COMMAND, 0x00, 0x00, 0x00, 0x01);
    }
    if(hum > 50){
      //envoie actionneur stop hum
      sendCAN(ID_STM32_3, ID_FEATHER, ACTUATOR_COMMAND, 0x00, 0x00, 0x00, 0x00);
    }else if(hum < -25){
      //envoie actionneur start hum
      sendCAN(ID_STM32_3, ID_FEATHER, ACTUATOR_COMMAND, 0x00, 0x00, 0x00, 0x01);
    }
  }

  if(dataToSend[0] == ID_FEATHER){
    Serial.println("feather data");
    reset(dataToSend);
  }

  
  mqttClient.loop();


  /*
  if (gBlinkLedDate < millis ()) {
    gBlinkLedDate += 5000 ;
    digitalWrite (LED_BUILTIN, !digitalRead (LED_BUILTIN)) ;
    switch (gSentFrameCount % 4) {
    case 0 :  // Does not match filter #0
      sendCAN(ID_BASYS3, ID_FEATHER, PERIODICAL_DATA, 0x00, 0x00, 0x00, gSentFrameCount);
      break ;
    case 1 :  // Matches filter #0
      sendCAN(ID_FEATHER, ID_FEATHER, PERIODICAL_DATA, 0x00, 0x00, 0x00, gSentFrameCount);
      break ;
    case 2 :  // Does not match any filter
      sendCAN(0x57, ID_FEATHER, 0x64, 0x00, 0x00, 0x00, gSentFrameCount);
      break ;
    case 3 :  // Matches filter #1
      sendCAN(ID_FEATHER, ID_FEATHER, 0x64, 0x00, 0x00, 0x00, gSentFrameCount);
      break ;
    }
    gSentFrameCount += 1 ;

  }*/
}

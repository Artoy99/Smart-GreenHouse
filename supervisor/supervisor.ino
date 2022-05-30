#include "io.h"

int hum = 0;
int temp = 0;
uint8_t manual = 0x00;

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
  //Serial.println(manual, HEX);

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
    //Serial.println("feather data");
    if(dataToSend[2] == SET_MANUAL){
      manual = dataToSend[4];
    }
    resetDataToSend(dataToSend);
  }else if(dataToSend[0] == ID_STM32_1 || dataToSend[0] == ID_STM32_3 || dataToSend[0] == ID_STM32_3 || dataToSend[0] == ID_BASYS3){
    //Serial.println("network data");
    sendCAN(dataToSend[0], ID_FEATHER, dataToSend[2], dataToSend[4], dataToSend[5], dataToSend[6], dataToSend[7]);
    
    resetDataToSend(dataToSend);
  }
  
  mqttClient.loop();


  
  /*if (gBlinkLedDate < millis ()) {
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
  /*if (gBlinkLedDate < millis ()) {
    gBlinkLedDate += 5000 ;
    digitalWrite (LED_BUILTIN, !digitalRead (LED_BUILTIN)) ;
    switch (gSentFrameCount % 4) {
    case 0 :  // Does not match filter #0
      sendCAN(ID_STM32_3, ID_FEATHER, PERIODICAL_DATA, 0x00, 0x00, 0x00, gSentFrameCount);
      break ;
    case 1 :  // Matches filter #0
      sendCAN(ID_STM32_3, ID_FEATHER, PERIODICAL_DATA, 0x00, 0x00, 0x00, gSentFrameCount);
      break ;
    case 2 :  // Does not match any filter
      sendCAN(ID_STM32_3, ID_FEATHER, 0x64, 0x00, 0x00, 0x00, gSentFrameCount);
      break ;
    case 3 :  // Matches filter #1
      sendCAN(ID_STM32_3, ID_FEATHER, 0x64, 0x00, 0x00, 0x00, gSentFrameCount);
      break ;
    }
    gSentFrameCount += 1 ;
  }*/

  delay(50);
}

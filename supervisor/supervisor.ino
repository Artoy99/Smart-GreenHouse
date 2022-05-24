#include "io.h"

void setup(){
  beginIO();
  //mqttSetup();
  
  lcd.setCursor(0, 1);
  lcd.print("Init done");
}


static uint32_t gBlinkLedDate = 0 ;
static uint32_t gSentFrameCount = 0 ;
static uint8_t gTransmitBufferIndex = 0 ;


void loop(){
  can.dispatchReceivedMessage();

  //CANMessage frame ;
  if (gBlinkLedDate < millis ()) {
    gBlinkLedDate += 5000 ;
    digitalWrite (LED_BUILTIN, !digitalRead (LED_BUILTIN)) ;
    //frame.idx = gTransmitBufferIndex ;
    //gTransmitBufferIndex = (gTransmitBufferIndex + 1) % 3 ;
    switch (gSentFrameCount % 4) {
    case 0 :  // Does not match filter #0
      sendCAN(ID_BASYS3, ID_FEATHER, PERIODICAL_DATA, 0x00, 0x00, 0x00, gSentFrameCount);
      //frame.id = PERIODICAL_DATA ;
      //frame.data [0] = ID_BASYS3 ;
      //frame.len = CAN_LENGTH ;
      break ;
    case 1 :  // Matches filter #0
      sendCAN(ID_FEATHER, ID_FEATHER, PERIODICAL_DATA, 0x00, 0x00, 0x00, gSentFrameCount);
      //frame.id = PERIODICAL_DATA ;
      //frame.data [0] = ID_FEATHER ;
      //frame.len = CAN_LENGTH ;
      break ;
    case 2 :  // Does not match any filter
      sendCAN(0x57, ID_FEATHER, 0x64, 0x00, 0x00, 0x00, gSentFrameCount);
      //frame.id = 0x564 ;
      //frame.data [0] = 0x57 ;
      //frame.len = 1 ;
      break ;
    case 3 :  // Matches filter #1
      sendCAN(ID_FEATHER, ID_FEATHER, 0x64, 0x00, 0x00, 0x00, gSentFrameCount);
      //frame.id = 0x564 ;
      //frame.data [0] = ID_FEATHER ;
      //frame.len = 1 ;
      break ;
    }
    gSentFrameCount += 1 ;
    /*const bool ok = can.tryToSend (frame) ;
    if (ok) {
      gSentFrameCount += 1 ;
    }
      Serial.print ("Sent: ") ;
      Serial.println (gSentFrameCount) ;
    }else{
      Serial.println ("Send failure") ;
    }*/
  }
}

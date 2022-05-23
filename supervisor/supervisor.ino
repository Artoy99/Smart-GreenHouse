#include "io.h"

void setup(){
  beginIO();
  mqttSetup();
}


static uint32_t gBlinkLedDate = 0 ;
static uint32_t gSentFrameCount = 0 ;
static uint8_t gTransmitBufferIndex = 0 ;


void loop(){
  can.dispatchReceivedMessage();

  CANMessage frame ;
  if (gBlinkLedDate < millis ()) {
    gBlinkLedDate += 2000 ;
    digitalWrite (LED_BUILTIN, !digitalRead (LED_BUILTIN)) ;
    frame.idx = gTransmitBufferIndex ;
    gTransmitBufferIndex = (gTransmitBufferIndex + 1) % 3 ;
    switch (gSentFrameCount % 4) {
    case 0 :  // Does not match filter #0
      frame.id = PERIODICAL_DATA ;
      frame.data [0] = ID_BASYS3 ;
      frame.len = CAN_LENGTH ;
      break ;
    case 1 :  // Matches filter #0
      frame.id = PERIODICAL_DATA ;
      frame.data [0] = ID_FEATHER ;
      frame.len = CAN_LENGTH ;
      break ;
    case 2 :  // Does not match any filter
      frame.id = 0x564 ;
      frame.data [0] = 0x57 ;
      frame.len = 1 ;
      break ;
    case 3 :  // Matches filter #1
      frame.id = 0x564 ;
      frame.data [0] = ID_FEATHER ;
      frame.len = 1 ;
      break ;
    }
    const bool ok = can.tryToSend (frame) ;
    if (ok) {
      gSentFrameCount += 1 ;
      Serial.print ("Sent: ") ;
      Serial.println (gSentFrameCount) ;
    }else{
      Serial.println ("Send failure") ;
    }
  }
}

#include "io.h"

LiquidCrystal lcd(18, 17, 16, 15, 14, 19);

void setup(){
  beginIO();
  mqttSetup();
}

void loop(){
  //sendCAN(ID_FEATHER, ID_FEATHER, DATA_REQUEST, 0x44);
  readCAN();
}

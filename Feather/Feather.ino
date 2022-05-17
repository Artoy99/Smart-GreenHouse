#include "io.h"

LiquidCrystal lcd(18, 17, 16, 15, 14, 19);

void setup() {
  beginIO();
}

void loop() {
  lcd.setCursor(2,2);
  lcd.print(pushButton(0));

  lcd.setCursor(4,2);
  lcd.print(pushButton(1));

  lcd.setCursor(6,2);
  lcd.print(pushButton(2));

  uint8_t encoder = encoderValue();
  lcd.setCursor(0,4);
  lcd.print("Valeur encodeur: ");
  lcd.print(encoder);
  if(encoder<10){
    lcd.setCursor(18,4);
    lcd.print(" ");
  }

  lookForCanMessage();
  sendEncoderValue();
  
  delay(100);
}

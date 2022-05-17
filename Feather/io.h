#pragma once
#include "tp_sysit_feather.h"
#include <LiquidCrystal.h>
#include <ACAN2515.h>

const byte BUTTON_P0 = 0 ;
const byte BUTTON_P1 = 1 ;
const byte BUTTON_P2 = 2 ;

void beginIO (void) ;

bool pushButton (const byte inButton) ;

void readSerial(void);

void writeCAN(byte const button);

void updateDataWithButton(CANMessage &frame);

byte encoderValue (void);

void lookForCanMessage(void);

void sendEncoderValue(void);

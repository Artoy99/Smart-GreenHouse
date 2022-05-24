#pragma once
#include "tp_sysit_feather.h"
#include <LiquidCrystal.h>
#include <ACAN2515.h>
#include <wiring_private.h>

#include "can_messages.h"

#include "mqtt.h"

#define LOOPBACK


const byte BUTTON_P0 = 0 ;
const byte BUTTON_P1 = 1 ;
const byte BUTTON_P2 = 2 ;

extern LiquidCrystal lcd;

extern SPIClass mySPI;

extern ACAN2515 can;


void beginIO (void) ;

void readCAN(void);

void sendCAN(uint8_t receiver_id, uint8_t sender_id, uint8_t frame_id, uint8_t data0, uint8_t data1, uint8_t data2, uint8_t data3);

static void receive0 (const CANMessage & inMessage);

static void receive1 (const CANMessage & inMessage);

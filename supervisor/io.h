#pragma once
#include "tp_sysit_feather.h"
#include <LiquidCrystal.h>
#include <ACAN2515.h>
#include <wiring_private.h>

#include "can_messages.h"

#include "mqtt.h"

const byte BUTTON_P0 = 0 ;
const byte BUTTON_P1 = 1 ;
const byte BUTTON_P2 = 2 ;

void beginIO (void) ;

void readCAN(void);

void sendCAN(uint8_t sender_id, uint8_t receiver_id, uint8_t code_message, uint8_t frame_id);

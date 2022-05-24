#ifndef CAN_MESSAGES
#define CAN_MESSAGES

//------------------ boards ID ------------------
#define ID_BROADCAST 0xFF
#define ID_FEATHER 0x11
#define ID_STM32_1 0x12
#define ID_STM32_2 0x13
#define ID_STM32_3 0x14
#define ID_BASYS3 0x15

//------------------ frame ID ------------------
#define DATA_REQUEST 0x11
#define PERIODICAL_DATA 0x12
#define ACTUATOR_COMMAND 0x13
#define PERIOD_CONFIGURATION 0x14
#define BOARD_ID_CONFIGURATION 0x15
#define READ_BOARD_ID 0x16

//------------------ function code ------------------
#define CAN_LENGTH 8
#define HUM_DATA 0X01
#define CO2_DATA 0x02

#endif

#ifndef CAN_MESSAGES
#define CAN_MESSAGES

//------------------ boards ID ------------------
#define ID_BROADCAST 0xFF
#define ID_FEATHER 0x11
#define ID_STM32-1 0x12
#define ID_STM32-2 0x13
#define ID_STM32-3 0x14
#define ID_BASYS3 0x15

//------------------ frame ID ------------------
#define DATA_REQUEST 0x111
#define PERIODICAL_DATA 0x112
#define ACTUATOR_COMMAND 0x113
#define PERIOD_CONFIGURATION 0x114
#define BOARD_ID_CONFIGURATION 0x115
#define READ_BOARD_ID 0x116

//------------------ function code ------------------
#define CAN_LENGTH 8

#endif

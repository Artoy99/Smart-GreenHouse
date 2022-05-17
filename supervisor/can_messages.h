#ifndef CAN_MESSAGES
#define CAN_MESSAGES

//------------------ boards ID ------------------
#define ID_BROADCAST 0xFF
#define ID_FEATHER 0x01
#define ID_STM32-1 0x02
#define ID_STM32-2 0x03
#define ID_STM32-3 0x04
#define ID_BASYS3 0x05

//------------------ frame ID ------------------
#define DATA_REQUEST 0x01
#define PERIODICAL_DATA 0x02
#define ACTUATOR_COMMAND 0x03
#define PERIOD_CONFIGURATION 0x04
#define BOARD_ID_CONFIGURATION 0x05
#define READ_BOARD_ID 0x06

//------------------ function code ------------------
#define CAN_LENGTH 8

#endif

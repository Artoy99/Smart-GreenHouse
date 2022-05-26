#ifndef MQTT_SECTION
#define MQTT_SECTION

#include <SPI.h>
#include <WiFi101.h>
#include <PubSubClient.h>

//#define MQTT_BROKER "10.3.141.1" // Addresse du broker MQTT ( IP or URL )
//#define MQTT_BROKER "192.168.43.1" // Addresse du broker MQTT ( IP or URL )
#define MQTT_BROKER "195.154.170.85" // Addresse du broker MQTT ( IP or URL )
#define MQTT_PORT 1883 // port 1883 pour la connexion non securisee

extern PubSubClient mqttClient;

extern uint8_t dataToSend[8];

void mqttSetup(void);

void printWiFiData(void);

void printCurrentNet(void);

void printMacAddress(byte mac[]);

void callback ( char *topic , byte *payload , unsigned int length );

void reconnect(void);

#endif

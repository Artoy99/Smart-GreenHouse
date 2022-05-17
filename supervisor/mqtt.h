#ifndef MQTT_SECTION
#define MQTT_SECTION

#include <SPI.h>
#include <WiFi101.h>
#include <PubSubClient.h>

void mqttSetup(void);

void printWiFiData(void);

void printCurrentNet(void);

void printMacAddress(byte mac[]);

void callback ( char *topic , byte *payload , unsigned int length );

void reconnect(void);

#endif

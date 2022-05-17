#include "mqtt.h"

#define MQTT_BROKER "10.3.141.1" // Addresse du broker MQTT ( IP or URL )
#define MQTT_PORT 1883 // port 1883 pour la connexion non securisee
WiFiClient WiFiclient; // instantciation d ’ un client WiFi non - SSL
PubSubClient client(WiFiclient); // Utilise le WiFi pour la communication MQTT
// Chaque client MQTT doit avoir un ID unique
String device_id = "FeatherM0-F8:F0:05:F1:F9:78" ; // Ajouter par exemple l ’ adresse MAC
#include "arduino_secrets.h" 
///////please enter your sensitive data in the Secret tab/arduino_secrets.h
char ssid[] = SECRET_SSID;        // your network SSID (name)
char pass[] = SECRET_PASS;    // your network password (use for WPA, or use as key for WEP)
int statusWIFI = WL_IDLE_STATUS;     // the WiFi radio's status

void mqttSetup(void){
  //--- MQTT configuration
  // Configure les broche pour Adafruit ATWINC1500 Feather
  WiFi.setPins (8 , 7 , 4 , 2);
  // check for the presence of the shield:
  if (WiFi.status() == WL_NO_SHIELD) {
    Serial.println("WiFi shield not present");
    // don't continue:
    while (true);
  }
  // attempt to connect to WiFi network:
  while (statusWIFI != WL_CONNECTED) {
    Serial.print("Attempting to connect to WPA SSID: ");
    Serial.println(ssid);
    // Connect to WPA/WPA2 network:
    statusWIFI = WiFi.begin(ssid, pass);

    // wait 5 seconds for connection:
    delay(5000);
  }
  // you're connected now, so print out the data:
  Serial.print("You're connected to the network");
  printCurrentNet();
  printWiFiData();

  client.setServer(MQTT_BROKER, MQTT_PORT) ; // parametres du broker
  client.setCallback(callback) ; // fonction d ’ appel pour traiter les messages
}

void printWiFiData() {
  // print your WiFi shield's IP address:
  IPAddress ip = WiFi.localIP();
  Serial.print("IP Address: ");
  Serial.println(ip);
  Serial.println(ip);

  // print your MAC address:
  byte mac[6];
  WiFi.macAddress(mac);
  Serial.print("MAC address: ");
  printMacAddress(mac);

}

void printCurrentNet() {
  // print the SSID of the network you're attached to:
  Serial.print("SSID: ");
  Serial.println(WiFi.SSID());

  // print the MAC address of the router you're attached to:
  byte bssid[6];
  WiFi.BSSID(bssid);
  Serial.print("BSSID: ");
  printMacAddress(bssid);

  // print the received signal strength:
  long rssi = WiFi.RSSI();
  Serial.print("signal strength (RSSI):");
  Serial.println(rssi);

  // print the encryption type:
  byte encryption = WiFi.encryptionType();
  Serial.print("Encryption Type:");
  Serial.println(encryption, HEX);
  Serial.println();
}

void printMacAddress(byte mac[]) {
  for (int i = 5; i >= 0; i--) {
    if (mac[i] < 16) {
      Serial.print("0");
    }
    Serial.print(mac[i], HEX);
    if (i > 0) {
      Serial.print(":");
    }
  }
  Serial.println();
}

void callback ( char *topic , byte *payload , unsigned int length ) {
  Serial.print( "Message arrived [ " );
  Serial.print(topic ) ;
  Serial.print( " ]: " ) ;
  for (int i=0; i<length; i++) {
    Serial.print((char)payload[i]);
  }
  Serial.println() ;
}

void reconnect() {
  // Loop until we're reconnected
  while (!client.connected()) {
    Serial.print("Attempting MQTT connection...");
    // Attempt to connect
    if (client.connect("arthurClient", "", "", "arthur/will", 0, true, "last will arthur")) {
      Serial.println("connected");
      // Once connected, publish an announcement...
      client.publish("arthur/a","hello world");
      // ... and resubscribe
      client.subscribe("arthur/hello");
      client.loop();
    }else{
      Serial.print("failed, rc=");
      Serial.print(client.state());
      Serial.println(" try again in 5 seconds");
      // Wait 5 seconds before retrying
      delay(5000);
    }
  }
}

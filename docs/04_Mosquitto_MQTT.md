# 📡 Mosquitto MQTT

## Overview

Mosquitto is the MQTT message broker used as the communication backbone between IoT devices, Node-RED, and Home Assistant.

Instead of allowing devices to communicate directly, all telemetry and control messages pass through the MQTT broker, providing a centralized, lightweight, and reliable communication system.

---

# Why MQTT?

MQTT is specifically designed for low-bandwidth and resource-constrained IoT devices.

Advantages include:

- Lightweight protocol
- Fast communication
- Low bandwidth usage
- Reliable message delivery
- Easy integration
- Wide IoT support

---

# MQTT Architecture

```
ESP32
   │
   ▼
Mosquitto MQTT Broker
   │
   ├────────► Node-RED
   │
   ├────────► Home Assistant
   │
   └────────► Other IoT Devices
```

---

# Install Mosquitto Container

Pull the latest image:

```bash
docker pull eclipse-mosquitto
```

Run the container:

```bash
docker run -d \
--name mosquitto \
--restart unless-stopped \
-p 1883:1883 \
-p 9001:9001 \
-v mosquitto_config:/mosquitto/config \
-v mosquitto_data:/mosquitto/data \
-v mosquitto_log:/mosquitto/log \
eclipse-mosquitto
```

---

# Configuration File

Create the configuration file:

```
mosquitto.conf
```

Example configuration:

```conf
listener 1883

allow_anonymous true

persistence true

persistence_location /mosquitto/data/

log_dest stdout
```

---

# Restart Container

```bash
docker restart mosquitto
```

---

# Verify Running Container

```bash
docker ps
```

Expected output:

```
mosquitto
STATUS: Up
PORT: 1883
```

---

# Default MQTT Port

| Port | Function |
|------|----------|
| 1883 | MQTT |
| 9001 | MQTT over WebSocket |

---

# Communication Flow

```
GPS Tracker
      │
      ▼
 MQTT Broker
      │
      ├────────► Home Assistant
      │
      ├────────► Node-RED
      │
      └────────► Dashboard
```

---

# Example Topics

```
home/livingroom/temperature

home/livingroom/humidity

gps/tracker/location

gps/tracker/status

watermeter/flow

helmet/sensor
```

---

# Security

For development, anonymous access may be enabled.

For production environments it is recommended to:

- Create MQTT users
- Enable password authentication
- Disable anonymous access
- Restrict firewall access
- Use encrypted connections when appropriate

---

# Advantages

- Extremely lightweight
- Fast communication
- Stable operation
- Low CPU usage
- Excellent Docker compatibility
- Works offline within the local network

---

# Expected Result

After completing this section:

- Mosquitto Broker is running.
- Port 1883 is active.
- ESP32 devices can publish data.
- Node-RED can subscribe to topics.
- Home Assistant can receive MQTT messages.

---

# Next Document

Continue reading:

**docs/05_NodeRED.md**

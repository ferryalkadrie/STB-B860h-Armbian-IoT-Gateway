# 🔴 Node-RED

## Overview

Node-RED is the automation engine of the STB Low-Power IoT Gateway.

It provides a visual programming environment that allows users to create automation flows by connecting functional nodes instead of writing large amounts of code.

Node-RED acts as the bridge between MQTT devices, Home Assistant, external APIs, databases, and other smart home services.

---

# Why Node-RED?

Node-RED simplifies automation development by providing:

- Visual programming
- Drag-and-drop editor
- MQTT integration
- Home Assistant integration
- HTTP API support
- Database connectivity
- Dashboard support
- JavaScript Function Nodes

---

# System Position

```
ESP32 / ESP8266
        │
        ▼
Mosquitto MQTT
        │
        ▼
     Node-RED
        │
        ├────────► Home Assistant
        │
        ├────────► HTTP API
        │
        ├────────► Telegram
        │
        ├────────► ThingSpeak
        │
        └────────► Other Services
```

---

# Install Node-RED

Pull the latest image:

```bash
docker pull nodered/node-red
```

Run the container:

```bash
docker run -d \
--name nodered \
--restart unless-stopped \
--network host \
-v node_red_data:/data \
nodered/node-red
```

---

# Verify Installation

List running containers:

```bash
docker ps
```

Expected output:

```
nodered
STATUS: Up
```

---

# Default Web Interface

Node-RED is accessible from:

```
http://STB_IP_ADDRESS:1880
```

Example:

```
http://192.168.1.10:1880
```

---

# Typical Automation Flow

```
MQTT Input
      │
      ▼
 Function
      │
      ▼
 Switch
      │
      ▼
 MQTT Output
```

---

# Example Use Cases

- Smart Lighting
- Water Pump Control
- GPS Monitoring
- Temperature Monitoring
- Water Meter Automation
- Smart Helmet Integration
- Telegram Notifications
- ThingSpeak Upload
- Data Logging

---

# Integration

Node-RED communicates directly with:

- Mosquitto MQTT
- Home Assistant
- ESP32
- ESP8266
- REST API
- HTTP Request
- Telegram Bot
- ThingSpeak

---

# Advantages

- Visual Programming
- Fast Development
- Modular Design
- Low Resource Usage
- Docker Compatible
- Easy Debugging
- Hundreds of Community Nodes

---

# Backup Flow

Export flows from:

```
Menu

↓

Export

↓

JSON File
```

The exported JSON can later be imported to restore the complete automation workflow.

---

# Expected Result

After completing this section:

- Node-RED is running.
- The web interface is accessible.
- MQTT communication is operational.
- Automation flows can be created.
- Home Assistant integration is available.

---

# Next Document

Continue reading:

**docs/06_Home_Assistant.md**

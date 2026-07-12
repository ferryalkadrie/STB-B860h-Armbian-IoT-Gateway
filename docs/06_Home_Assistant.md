# 🏡 Home Assistant

## Overview

Home Assistant is the central dashboard of the STB Low-Power IoT Gateway.

It provides a unified interface for monitoring, controlling, and automating all connected IoT devices within the local network.

By integrating with Mosquitto MQTT and Node-RED, Home Assistant becomes the main control center for the entire smart home system.

---

# Why Home Assistant?

Home Assistant offers several advantages:

- Open Source
- Local Control
- Privacy Focused
- Large Community
- Extensive Device Support
- Powerful Dashboard
- Automation Integration
- Mobile Application Support

---

# System Position

```
                 Home Assistant
                        ▲
                        │
                Node-RED Automation
                        ▲
                        │
               Mosquitto MQTT Broker
                        ▲
                        │
        ESP32 • ESP8266 • IoT Devices
```

---

# Install Home Assistant

Pull the latest image:

```bash
docker pull ghcr.io/home-assistant/home-assistant:stable
```

Run the container:

```bash
docker run -d \
--name homeassistant \
--restart unless-stopped \
--network host \
-v homeassistant_data:/config \
-e TZ=Asia/Jakarta \
ghcr.io/home-assistant/home-assistant:stable
```

---

# Verify Installation

Check the running container:

```bash
docker ps
```

Expected output:

```
homeassistant
STATUS: Up
```

---

# Access Home Assistant

Open a web browser and navigate to:

```
http://STB_IP_ADDRESS:8123
```

Example:

```
http://192.168.1.10:8123
```

The initial setup wizard will appear on the first launch.

---

# Integration

Home Assistant integrates with:

- Mosquitto MQTT
- Node-RED
- ESP32
- ESP8266
- Zigbee Gateway (Optional)
- IP Cameras
- Smart Switches
- Sensors
- REST API

---

# Dashboard Features

Typical dashboard components include:

- Temperature
- Humidity
- GPS Location
- Water Meter
- Smart Lighting
- Smart Relay
- Motion Sensors
- Camera Status
- Device Health

---

# Automation Workflow

```
Sensor
   │
   ▼
MQTT Broker
   │
   ▼
Node-RED
   │
   ▼
Home Assistant
   │
   ▼
Dashboard
```

---

# Backup Configuration

Home Assistant provides built-in backup functionality.

Recommended backup schedule:

- Weekly Full Backup
- Before System Updates
- Before Configuration Changes

Store backup files outside the STB whenever possible.

---

# Advantages

- Fully Local Operation
- Responsive Dashboard
- Mobile Access
- Easy Device Management
- Hundreds of Integrations
- Docker Compatible
- Low Resource Usage

---

# Expected Result

After completing this section:

- Home Assistant is running successfully.
- The dashboard is accessible via web browser.
- MQTT devices can be discovered.
- Node-RED automation can interact with Home Assistant.
- Local smart home management is fully operational.

---

# Next Document

Continue reading:

**docs/07_ZeroTier.md**

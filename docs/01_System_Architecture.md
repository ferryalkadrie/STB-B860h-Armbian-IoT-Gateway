# 🏗️ System Architecture

## Overview

The STB Low-Power IoT Gateway is designed as the central hub of a smart home ecosystem. Instead of relying on cloud services for every operation, the system prioritizes local communication to improve reliability, reduce latency, and continue operating even when the internet is unavailable.

The Android TV Box (STB) runs Armbian Linux as the host operating system. Docker is used to isolate each service into independent containers, simplifying deployment, maintenance, and future upgrades.

---

# Design Objectives

The architecture is designed with the following objectives:

- Continuous 24/7 operation
- Low power consumption
- Offline-first smart home automation
- Modular Docker services
- Easy maintenance and backup
- Secure remote access
- Local network reliability

---

# System Architecture

```
                    Internet
                        │
              (Optional WISP Connection)
                        │
                        ▼
                 +----------------+
                 |     Router     |
                 +----------------+
                        │
        ┌───────────────┴───────────────┐
        │                               │
        ▼                               ▼
  Local IoT Devices                 STB Server
                                        │
                          +-------------------------+
                          |     Armbian Linux       |
                          +-------------------------+
                                        │
                                  Docker Engine
                                        │
       ┌──────────────┬──────────────┬──────────────┐
       ▼              ▼              ▼
 Mosquitto MQTT   Node-RED   Home Assistant
       │
       ▼
ESP32 • ESP8266 • Sensors • Smart Devices
```

---

# Software Stack

| Layer | Component |
|--------|-----------|
| Hardware | Android TV Box (STB) |
| Operating System | Armbian Linux |
| Container Platform | Docker Engine |
| Message Broker | Mosquitto MQTT |
| Automation | Node-RED |
| Dashboard | Home Assistant |
| Remote Access | ZeroTier |

---

# Communication Flow

```
ESP32 / ESP8266
        │
        ▼
Mosquitto MQTT
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

# Offline Operation

The gateway is designed to continue operating without internet access.

Available services include:

- MQTT communication
- Home Assistant dashboard
- Node-RED automation
- Local device control
- Local monitoring

Only internet-dependent features become unavailable.

---

# Online Operation

When connected to the internet, additional services become available:

- ZeroTier Remote Access
- NTP Time Synchronization
- Docker Image Updates
- Home Assistant Updates
- Remote Monitoring
- Cloud Integration (Optional)

---

# Docker Services

Each application runs inside its own Docker container.

Advantages include:

- Independent updates
- Better security
- Easy backup
- Easy migration
- Service isolation
- Simplified maintenance

---

# Why Docker?

Docker allows every service to operate independently.

For example:

- Restarting Node-RED does not interrupt MQTT.
- Updating Home Assistant does not affect Mosquitto.
- Containers can be backed up individually.

This significantly improves system stability.

---

# Advantages

- Low Power Consumption
- Silent Operation
- Modular Architecture
- Easy Maintenance
- Secure Remote Access
- Offline Automation
- Open Source Software
- Expandable Design

---

# Next Document

Continue reading:

**docs/02_Install_Armbian.md**

# ❓ Frequently Asked Questions (FAQ)

## Overview

This section answers common questions about the STB Low-Power IoT Gateway project.

---

# General

## What is this project?

This project transforms an Android TV Box (STB) into a low-power Linux server capable of running Home Assistant, Node-RED, Mosquitto MQTT, and ZeroTier using Docker containers.

---

## Why use an STB instead of a Raspberry Pi?

Advantages include:

- Lower cost
- Low power consumption
- Readily available hardware
- Good performance for home automation
- Suitable for 24/7 operation

---

## Does the STB still run Android?

No.

Android is replaced by Armbian Linux, allowing the device to operate as a dedicated server.

---

## Docker

## Why use Docker?

Docker isolates each application into its own container.

Benefits include:

- Easy updates
- Simplified maintenance
- Better reliability
- Independent services
- Easy backup and migration

---

## Home Assistant

## Can Home Assistant work without internet?

Yes.

Home Assistant continues operating over the local network.

Only cloud-based features become unavailable.

---

## Can Home Assistant communicate with ESP32?

Yes.

Communication is performed through the Mosquitto MQTT broker.

---

## MQTT

## Why use MQTT?

MQTT is lightweight, fast, and designed specifically for IoT communication.

It minimizes bandwidth usage while providing reliable message delivery.

---

## Node-RED

## Is programming experience required?

No.

Node-RED provides a visual programming interface using drag-and-drop nodes.

Advanced users may also use JavaScript Function nodes when needed.

---

## ZeroTier

## Why use ZeroTier?

ZeroTier enables secure remote access without:

- Public IP
- Port forwarding
- Dynamic DNS

It works well even when the ISP uses Carrier-Grade NAT (CGNAT).

---

## Internet

## Does the system require internet access?

No.

The gateway follows an **Offline-First** design.

Local services continue operating without internet.

Internet is only required for:

- System updates
- Docker image downloads
- ZeroTier
- NTP synchronization
- Optional cloud services

---

## Backup

## How often should backups be created?

Recommended schedule:

| Component | Frequency |
|-----------|-----------|
| Home Assistant | Weekly |
| Node-RED | Weekly |
| Mosquitto | Monthly |
| Docker Compose | After Changes |
| System Configuration | Monthly |

---

## Security

## Is this project secure?

Yes, when basic security practices are followed.

Recommendations:

- Use strong passwords.
- Keep the system updated.
- Restrict SSH access.
- Disable anonymous MQTT access in production.
- Authorize only trusted ZeroTier devices.

---

## Performance

## Can the STB run continuously?

Yes.

The system is designed for continuous 24/7 operation with low power consumption.

---

## Can more Docker containers be added?

Yes.

Examples include:

- InfluxDB
- Grafana
- Portainer
- MariaDB
- PostgreSQL
- Zigbee2MQTT
- ESPHome
- Frigate (depending on hardware capability)

---

## Future Development

Possible future improvements include:

- Automatic backup scripts
- Docker Compose deployment
- HTTPS support
- Reverse Proxy
- AI-powered automation
- Energy monitoring
- Zigbee integration
- Matter support

---

# Project Philosophy

The primary goal of this project is to build a smart home gateway that is:

- Reliable
- Low Power
- Modular
- Secure
- Offline First
- Easy to Maintain
- Open Source
- Expandable

The system prioritizes local operation while using internet connectivity only when additional services are required.

---

# Thank You

Thank you for reading this documentation.

We hope this repository helps makers, students, hobbyists, and developers build reliable, low-power smart home systems using affordable hardware.

---

<p align="center">

**Happy Building! 🚀**

</p>

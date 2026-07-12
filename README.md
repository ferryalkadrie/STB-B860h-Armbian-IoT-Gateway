# 🚀 STB Low-Power IoT Gateway (Hybrid Local & WISP)

<p align="center">
  <img src="https://img.shields.io/badge/OS-Armbian%20Linux-darkgreen?style=for-the-badge&logo=linux" alt="Armbian Linux">
  <img src="https://img.shields.io/badge/Container-Docker-blue?style=for-the-badge&logo=docker" alt="Docker">
  <img src="https://img.shields.io/badge/MQTT-Mosquitto-orange?style=for-the-badge&logo=eclipsemosquitto" alt="Mosquitto">
  <img src="https://img.shields.io/badge/Automation-Node--RED-red?style=for-the-badge&logo=nodered" alt="Node-RED">
</p>

<p align="center">
<b>Transforming a Used STB into a Reliable IoT Gateway using Armbian, Docker, MQTT, Node-RED, Home Assistant and ZeroTier.</b>
</p>

---

# 📖 Overview

This project transforms a **ZTE B860H Set-Top Box** into a **Low-Power IoT Gateway** capable of running:

- Home Assistant
- Node-RED
- Mosquitto MQTT
- ZeroTier Remote Access

The gateway is designed using a **Hybrid Network Architecture**, where local IoT communication remains completely offline while internet access is only used for NTP synchronization, software updates and remote access.

---

# 🌐 Hybrid Network Architecture

### Local Network

- Router D-Link
- ESP32 / ESP8266
- MQTT Broker
- Node-RED
- Home Assistant

All sensor communication remains inside the local LAN.

### Internet Network

Internet is provided through **WISP Mode** only for:

- NTP Time Synchronization
- Docker Image Updates
- ZeroTier Remote SSH Access

---

# 🏗️ System Architecture

| Component | Location | Function |
|------------|----------|----------|
| Armbian Linux | Host OS | Main Operating System |
| Docker Engine | Host OS | Container Platform |
| Mosquitto MQTT | Docker | Local MQTT Broker |
| Node-RED | Docker | Automation Engine |
| Home Assistant | Docker | Smart Home Dashboard |
| ZeroTier | Host OS | Secure Remote Access |

---

# 📦 Prerequisites

Before starting, prepare:

- ZTE B860H STB
- Rooted Device
- Installed Armbian
- Ethernet Cable
- D-Link Router
- Internet Connection (WISP)
- SSH Client

---

# 🛠 Step 1 — Update Armbian

```bash
sudo apt update
sudo apt upgrade -y
sudo reboot
```

---

# 🐳 Step 2 — Install Docker

```bash
sudo apt install -y docker.io docker-compose

sudo systemctl enable --now docker

sudo usermod -aG docker $USER
```

Reboot the system.

```bash
sudo reboot
```

Verify installation.

```bash
docker --version

docker-compose --version
```

---

# 📂 Step 3 — Create Project Directory

```bash
mkdir -p ~/stb-iot-gateway

cd ~/stb-iot-gateway
```

---

# 📡 Step 4 — Configure Mosquitto

Create folders.

```bash
mkdir -p mosquitto/config

mkdir -p mosquitto/data

mkdir -p mosquitto/log
```

Create configuration file.

```bash
nano mosquitto/config/mosquitto.conf
```

Paste:

```text
listener 1883
allow_anonymous true
```

Save:

CTRL + X

Y

ENTER

---

# 🐳 Step 5 — Create Docker Compose

```bash
nano docker-compose.yml
```

Paste:

```yaml
version: '3.8'

services:

  mosquitto:
    image: eclipse-mosquitto:latest
    container_name: mosquitto
    ports:
      - "1883:1883"
    volumes:
      - ./mosquitto/config/mosquitto.conf:/mosquitto/config/mosquitto.conf
      - ./mosquitto/data:/mosquitto/data
      - ./mosquitto/log:/mosquitto/log
    restart: unless-stopped

  nodered:
    image: nodered/node-red:latest
    container_name: nodered
    ports:
      - "1880:1880"
    volumes:
      - ./node_red_data:/data
    restart: unless-stopped

  homeassistant:
    image: ghcr.io/home-assistant/home-assistant:stable
    container_name: homeassistant
    network_mode: host
    restart: unless-stopped
    volumes:
      - ./config:/config
      - /etc/localtime:/etc/localtime:ro
```

---

# ▶ Step 6 — Start Docker Containers

```bash
docker-compose up -d
```

Check status.

```bash
docker ps
```

---

# 🌍 Step 7 — Enable NTP

```bash
sudo timedatectl set-ntp true

sudo systemctl restart systemd-timesyncd
```

Verify.

```bash
timedatectl status
```

Expected:

```
System clock synchronized: yes
```

---

# 🌐 Step 8 — Install ZeroTier

```bash
curl -s https://install.zerotier.com | sudo bash

sudo systemctl enable --now zerotier-one
```

Join your network.

```bash
sudo zerotier-cli join YOUR_NETWORK_ID
```

Check status.

```bash
sudo zerotier-cli listnetworks
```

---

# ⚙ System Optimization

Disable Wi-Fi Power Saving

```bash
sudo iwconfig wlan0 power off
```

Limit System Logs

```bash
sudo nano /etc/systemd/journald.conf
```

Change:

```text
SystemMaxUse=50M
```

Monitor Temperature

```bash
armbianmonitor -m
```

---

# 🔧 Troubleshooting

Docker Containers

```bash
docker ps

docker-compose ps
```

MQTT Logs

```bash
docker logs mosquitto
```

Node-RED Logs

```bash
docker logs nodered
```

Home Assistant Logs

```bash
docker logs homeassistant
```

ZeroTier Status

```bash
sudo zerotier-cli listnetworks
```

---

# 🔐 Reset Home Assistant Password

```bash
cd ~/stb-iot-gateway/config/.storage

rm auth

rm auth_provider.homeassistant

docker restart homeassistant
```

---

# 📁 Project Structure

```
STB-Low-Power-IoT-Gateway/

README.md

docs/

docker/

scripts/

images/

config/

node_red_data/

mosquitto/
```

---

# 🛡 .gitignore

```text
config/

node_red_data/

mosquitto/data/

mosquitto/log/

.storage/

*.log
```

---

# 📄 License

MIT License

---

<p align="center">
Developed as an experimental low-power IoT gateway using a recycled Set-Top Box running Armbian and Docker.
</p>

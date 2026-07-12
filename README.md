# 🚀 STB Low-Power IoT Gateway (Hybrid Local & WISP)

<p align="center">
  <img src="https://img.shields.io/badge/OS-Armbian%20Linux-darkgreen?style=for-the-badge&logo=linux" alt="Armbian">
  <img src="https://img.shields.io/badge/Container-Docker-blue?style=for-the-badge&logo=docker" alt="Docker">
  <img src="https://img.shields.io/badge/MQTT-Mosquitto-orange?style=for-the-badge&logo=eclipsemosquitto" alt="Mosquitto">
  <img src="https://img.shields.io/badge/Home%20Assistant-Core-41BDF5?style=for-the-badge&logo=homeassistant" alt="Home Assistant">
  <img src="https://img.shields.io/badge/Automation-Node--RED-red?style=for-the-badge&logo=nodered" alt="Node-RED">
  <img src="https://img.shields.io/badge/Remote-ZeroTier-6C2DC7?style=for-the-badge" alt="ZeroTier">
</p>

<p align="center">
<b>Transforming a Used ZTE B860H Set-Top Box into a Low-Power IoT Gateway using Armbian, Docker, Home Assistant, Node-RED, MQTT and ZeroTier.</b>
</p>

---

# 📷 Prototype

<p align="center">
  <img src="images/prototype.jpg" width="800">
</p>

Prototype Version 1

**Hardware**

- ZTE B860H
- D-Link Router
- Ethernet Cable
- WISP Internet

---

# 🏗️ System Architecture

<p align="center">
  <img src="images/architecture.png" width="900">
</p>

---

# 🌐 Network Topology

<p align="center">
  <img src="images/network_topology.png" width="900">
</p>

---

# 📖 Project Overview

This project transforms a used **ZTE B860H Set-Top Box** into a complete **Low-Power IoT Gateway** running **Armbian Linux**.

Unlike a standard Linux server, this project is optimized for:

- Low power consumption
- 24/7 operation
- Local MQTT communication
- Offline-first Smart Home
- Remote management through ZeroTier
- Easy deployment using Docker

The gateway is designed to separate **local IoT communication** from **internet connectivity**, improving reliability and reducing unnecessary internet traffic.

---

# ✨ Features

- ✅ Armbian Linux
- ✅ Docker Engine
- ✅ Docker Compose
- ✅ Mosquitto MQTT
- ✅ Node-RED
- ✅ Home Assistant
- ✅ ZeroTier Remote Access
- ✅ Hybrid Local + WISP Network
- ✅ Offline MQTT Communication
- ✅ Automatic NTP Synchronization
- ✅ Backup & Restore
- ✅ Easy Maintenance
- ✅ Open Source Documentation

---

# 🎯 Project Goals

The main objective of this project is to build a reliable IoT Gateway capable of operating continuously with minimal maintenance.

Key objectives include:

- Reliable local MQTT communication
- Offline Smart Home automation
- Secure remote management
- Low hardware cost
- Low electrical power consumption
- Easy recovery after system failure
- Modular Docker deployment

---

# 📦 Hardware Requirements

| Hardware | Description |
|-----------|-------------|
| ZTE B860H | Main Device |
| D-Link Router | Local Network |
| Ethernet Cable | STB Connection |
| USB Flash Drive | Armbian Installation |
| Internet Connection | WISP |
| Laptop / PC | SSH Configuration |

---

# 💻 Software Requirements

| Software | Purpose |
|-----------|----------|
| Armbian | Operating System |
| Docker Engine | Container Runtime |
| Docker Compose | Container Management |
| Home Assistant | Smart Home Dashboard |
| Node-RED | Automation |
| Mosquitto MQTT | Local MQTT Broker |
| ZeroTier | Remote Access |

---

# 🌐 Hybrid Network Architecture

This project uses a **Hybrid Network Architecture**.

## Local Network (Offline)

ESP32

↓

MQTT

↓

Node-RED

↓

Home Assistant

↓

Dashboard

No internet is required for local communication.

---

## Internet Network

Internet is only used for:

- NTP Time Synchronization
- Docker Image Updates
- ZeroTier Remote Access
- SSH Remote Management

Sensor communication always remains inside the local network.

---

# 📂 Project Structure

```
STB-Low-Power-IoT-Gateway/

│

├── README.md

├── docs/

├── docker/

├── scripts/

├── images/

├── config/

├── node_red_data/

└── mosquitto/
```

---

# 📑 Installation Guide

This guide is divided into the following sections:

1. Prerequisites
2. Root ZTE B860H
3. Install Armbian
4. System Update
5. Docker Installation
6. Mosquitto MQTT
7. Node-RED
8. Home Assistant
9. ZeroTier
10. Network Configuration
11. Backup & Restore
12. Troubleshooting

---

# ⚠ Important Notes

- Root access is required before installing Armbian.
- Use a stable power supply during installation.
- Backup important data before modifying the system.
- This guide assumes basic Linux knowledge.
- Docker is used for all application services except ZeroTier.
- ZeroTier is installed directly on the Armbian host.

---

# 🚀 Step 1 — Prerequisites

Before starting, make sure you have:

- Rooted ZTE B860H
- Installed Armbian
- SSH Access
- Internet Connection
- D-Link Router
- Ethernet Cable
- Basic Linux knowledge

The next section explains how to prepare the STB before installing Armbian.

---

# 🔓 Step 2 — Root ZTE B860H

> **Important**
>
> The ZTE B860H must be rooted before installing Armbian.
> The rooting procedure depends on the firmware version installed on your device.

Before proceeding, ensure that:

- Root access has been successfully obtained.
- The bootloader is ready for Armbian installation.
- The device can boot from external media (if required).

After rooting is complete, continue with the Armbian installation.

---

# 💾 Step 3 — Install Armbian

Prepare:

- USB Flash Drive or SD Card
- Armbian Image
- Balena Etcher (or similar flashing software)

Flash the Armbian image to your storage device.

Insert the storage device into the STB.

Power on the STB.

Wait until the first boot process is complete.

---

# 🔑 Step 4 — First Login

Connect to the STB using SSH.

Example:

```bash
ssh root@YOUR_STB_IP
```

Default login:

```text
Username : root

Password : 1234
```

During the first login Armbian will ask you to:

- Change the root password.
- Create a new user.
- Configure basic system settings.

Complete all requested steps before continuing.

---

# 🌍 Step 5 — Check Internet Connection

Verify network connectivity.

```bash
ping google.com
```

Expected output:

```text
64 bytes from google.com ...
```

Stop the test.

```text
CTRL + C
```

If there is no internet connection:

- Check the Ethernet cable.
- Verify the D-Link router.
- Ensure WISP mode is connected.

---

# 🔄 Step 6 — Update Armbian

Refresh package information.

```bash
sudo apt update
```

Upgrade installed packages.

```bash
sudo apt upgrade -y
```

Remove unused packages.

```bash
sudo apt autoremove -y
```

Clean package cache.

```bash
sudo apt clean
```

Restart the system.

```bash
sudo reboot
```

---

# 🖥 Step 7 — Verify System Information

Check operating system.

```bash
cat /etc/os-release
```

Check kernel version.

```bash
uname -a
```

Check CPU information.

```bash
lscpu
```

Check memory usage.

```bash
free -h
```

Check disk usage.

```bash
df -h
```

---

# 🌐 Step 8 — Configure Time Zone

Display available time zones.

```bash
timedatectl list-timezones
```

Set your time zone.

Example:

```bash
sudo timedatectl set-timezone Asia/Jakarta
```

Verify configuration.

```bash
timedatectl
```

---

# ⏰ Step 9 — Enable NTP

Enable automatic time synchronization.

```bash
sudo timedatectl set-ntp true
```

Restart the time service.

```bash
sudo systemctl restart systemd-timesyncd
```

Verify synchronization.

```bash
timedatectl status
```

Expected output:

```text
System clock synchronized: yes
```

---

# 🔥 Step 10 — Install Basic Utilities

Install useful packages.

```bash
sudo apt install -y \
curl \
wget \
nano \
git \
htop \
net-tools \
unzip \
zip \
ca-certificates \
software-properties-common
```

Verify installation.

```bash
git --version

curl --version

wget --version
```

---

# 🧹 Step 11 — System Maintenance

Update package database.

```bash
sudo apt update
```

Upgrade packages.

```bash
sudo apt upgrade -y
```

Remove unused packages.

```bash
sudo apt autoremove -y
```

Clean cache.

```bash
sudo apt clean
```

---

# ✅ Step 12 — Ready for Docker Installation

Your Armbian system is now prepared for:

- Docker Engine
- Docker Compose
- Mosquitto MQTT
- Node-RED
- Home Assistant
- ZeroTier

Continue to the next section for Docker installation.

---

# 🐳 Step 13 — Install Docker Engine

Docker allows applications to run inside isolated containers, making deployment easier and improving system stability.

Update package repository.

```bash
sudo apt update
```

Install Docker Engine and Docker Compose.

```bash
sudo apt install -y docker.io docker-compose
```

Enable Docker service.

```bash
sudo systemctl enable docker
```

Start Docker.

```bash
sudo systemctl start docker
```

Check Docker status.

```bash
sudo systemctl status docker
```

Expected output:

```text
Active: active (running)
```

Exit status screen.

```text
Press Q
```

---

# 👤 Step 14 — Add Current User to Docker Group

Run:

```bash
sudo usermod -aG docker $USER
```

Apply the new group.

```bash
newgrp docker
```

Or simply reboot.

```bash
sudo reboot
```

---

# ✅ Step 15 — Verify Docker Installation

Check Docker version.

```bash
docker --version
```

Check Docker Compose version.

```bash
docker-compose --version
```

Example output.

```text
Docker version 24.x.x

docker-compose version 1.xx.x
```

---

# 🧪 Step 16 — Test Docker

Run the official Hello World container.

```bash
docker run hello-world
```

If successful, Docker is working correctly.

---

# 📁 Step 17 — Create Project Directory

Create the main project folder.

```bash
mkdir -p ~/stb-iot-gateway
```

Enter the project directory.

```bash
cd ~/stb-iot-gateway
```

Verify.

```bash
pwd
```

Expected output.

```text
/home/username/stb-iot-gateway
```

---

# 📂 Step 18 — Create Project Structure

Create all required folders.

```bash
mkdir -p \
mosquitto/config \
mosquitto/data \
mosquitto/log \
node_red_data \
config \
backup \
scripts
```

Check folder structure.

```bash
tree
```

If the **tree** command is not installed.

```bash
sudo apt install tree -y
```

Run again.

```bash
tree
```

---

# 🛰 Step 19 — Configure Mosquitto MQTT

Create configuration file.

```bash
nano mosquitto/config/mosquitto.conf
```

Paste the following configuration.

```text
listener 1883

allow_anonymous true

persistence true

persistence_location /mosquitto/data/

log_dest stdout
```

Save.

```text
CTRL + X

Y

ENTER
```

Verify.

```bash
cat mosquitto/config/mosquitto.conf
```

---

# 📝 Step 20 — Create Docker Compose File

Create the compose file.

```bash
nano docker-compose.yml
```

The next section will contain the complete Docker Compose configuration including:

- Mosquitto MQTT
- Node-RED
- Home Assistant

---

# 📋 Project Directory

Your project should now look like this.

```text
stb-iot-gateway/

├── docker-compose.yml
├── backup/
├── config/
├── node_red_data/
├── scripts/
└── mosquitto/
    ├── config/
    │   └── mosquitto.conf
    ├── data/
    └── log/
```

---

# ✅ Docker Installation Complete

Docker is now installed successfully.

The next step is creating the complete **docker-compose.yml** file and deploying:

- Eclipse Mosquitto
- Node-RED
- Home Assistant

Continue to **Part 4**.

---

# 🐳 Step 21 — Configure Docker Compose

Open the Docker Compose file.

```bash
nano docker-compose.yml
```

Paste the following configuration.

```yaml
version: "3.8"

services:

  mosquitto:
    image: eclipse-mosquitto:latest
    container_name: mosquitto

    restart: unless-stopped

    ports:
      - "1883:1883"

    volumes:
      - ./mosquitto/config/mosquitto.conf:/mosquitto/config/mosquitto.conf
      - ./mosquitto/data:/mosquitto/data
      - ./mosquitto/log:/mosquitto/log



  nodered:
    image: nodered/node-red:latest
    container_name: nodered

    restart: unless-stopped

    ports:
      - "1880:1880"

    volumes:
      - ./node_red_data:/data



  homeassistant:
    image: ghcr.io/home-assistant/home-assistant:stable
    container_name: homeassistant

    restart: unless-stopped

    network_mode: host

    volumes:
      - ./config:/config
      - /etc/localtime:/etc/localtime:ro
```

Save the file.

```
CTRL + X

Y

ENTER
```

---

# ▶ Step 22 — Download Docker Images

Pull all required images.

```bash
docker-compose pull
```

This command downloads:

- Eclipse Mosquitto
- Node-RED
- Home Assistant

Wait until every image finishes downloading.

---

# 🚀 Step 23 — Start All Containers

Run all services.

```bash
docker-compose up -d
```

Docker will automatically create and start every container.

---

# 🔎 Step 24 — Verify Running Containers

Check running containers.

```bash
docker ps
```

Expected output.

```text
mosquitto

nodered

homeassistant
```

To display every container.

```bash
docker ps -a
```

---

# 📜 Step 25 — View Container Logs

Mosquitto

```bash
docker logs mosquitto
```

Node-RED

```bash
docker logs nodered
```

Home Assistant

```bash
docker logs homeassistant
```

Live logs.

```bash
docker logs -f homeassistant
```

Exit live log.

```
CTRL + C
```

---

# 🌐 Step 26 — Access Web Interfaces

Node-RED

```
http://STB_IP:1880
```

Mosquitto

No web interface.

Home Assistant

```
http://STB_IP:8123
```

Wait several minutes during the first startup.

---

# 🔄 Step 27 — Restart Containers

Restart all services.

```bash
docker-compose restart
```

Restart one container.

```bash
docker restart mosquitto

docker restart nodered

docker restart homeassistant
```

---

# ⏹ Step 28 — Stop Containers

Stop all services.

```bash
docker-compose stop
```

Stop one service.

```bash
docker stop mosquitto
```

---

# ▶ Step 29 — Start Containers Again

```bash
docker-compose start
```

---

# 🗑 Step 30 — Remove Containers

Stop and remove containers.

```bash
docker-compose down
```

Remove unused Docker resources.

```bash
docker system prune -a
```

> **Warning**
>
> This command removes unused Docker images and containers.

---

# 📊 Step 31 — Monitor Docker Resources

Container usage.

```bash
docker stats
```

Running containers.

```bash
docker ps
```

Docker images.

```bash
docker images
```

Volumes.

```bash
docker volume ls
```

Networks.

```bash
docker network ls
```

---

# ✅ Docker Deployment Complete

Your STB is now running:

- ✅ Home Assistant
- ✅ Node-RED
- ✅ Mosquitto MQTT

The next step is configuring Home Assistant for the first startup and connecting MQTT to the automation system.

---

# 🏠 Step 32 — First Time Home Assistant Setup

Open your browser.

```
http://YOUR_STB_IP:8123
```

The first startup may take **5–15 minutes**.

When the setup page appears:

- Create Administrator Account
- Set Username
- Set Password
- Select Country
- Select Time Zone
- Finish the onboarding process

---

# ⚙ Step 33 — Verify Home Assistant

Open:

```
Settings

↓

System

↓

Repairs
```

There should be no critical errors.

Check system information.

```
Settings

↓

System

↓

Hardware
```

Verify:

- CPU
- Memory
- Disk
- Operating System

---

# 📡 Step 34 — Configure Mosquitto MQTT

Open:

```
Settings

↓

Devices & Services

↓

Add Integration
```

Search:

```
MQTT
```

Choose:

```
MQTT
```

---

# 🔌 Step 35 — MQTT Connection Settings

Enter:

| Parameter | Value |
|------------|--------|
| Broker | localhost |
| Port | 1883 |
| Username | Leave Empty |
| Password | Leave Empty |

Click

```
Submit
```

If everything is correct, Home Assistant will connect to Mosquitto.

---

# ✅ Step 36 — Verify MQTT Connection

Go to

```
Settings

↓

Devices & Services

↓

MQTT
```

Status should display

```
Connected
```

---

# 📨 Step 37 — Test MQTT Publish

Open Terminal.

Publish a message.

```bash
docker exec mosquitto \
mosquitto_pub \
-h localhost \
-t test/topic \
-m "Hello MQTT"
```

If there are no errors, the broker is working correctly.

---

# 📥 Step 38 — Test MQTT Subscribe

Open another terminal.

```bash
docker exec mosquitto \
mosquitto_sub \
-h localhost \
-t test/topic
```

Open another terminal again.

Publish.

```bash
docker exec mosquitto \
mosquitto_pub \
-h localhost \
-t test/topic \
-m "ESP32 Connected"
```

Expected output.

```
ESP32 Connected
```

---

# 🌍 Step 39 — Enable MQTT Discovery

Open Home Assistant.

Go to

```
Settings

↓

Devices & Services

↓

MQTT

↓

Configure
```

Enable

```
MQTT Discovery
```

Click

```
Save
```

MQTT Discovery allows Home Assistant to detect compatible IoT devices automatically.

---

# 🤖 Step 40 — Install Node-RED Add-on (Docker Version)

Since Node-RED is already running inside Docker, simply open:

```
http://YOUR_STB_IP:1880
```

Verify that the editor loads correctly.

Expected page:

```
Node-RED Flow Editor
```

---

# 🔗 Step 41 — Connect Node-RED to MQTT

Inside Node-RED.

Drag:

```
mqtt in
```

Double-click.

Server

```
localhost
```

Port

```
1883
```

Topic

```
test/topic
```

Click

```
Done
```

Press

```
Deploy
```

---

# 📊 Step 42 — Test MQTT Flow

Publish another message.

```bash
docker exec mosquitto \
mosquitto_pub \
-h localhost \
-t test/topic \
-m "Node-RED Online"
```

If everything works correctly,

Node-RED will receive the MQTT message immediately.

---

# 📱 Step 43 — Verify Home Assistant Dashboard

Open

```
http://YOUR_STB_IP:8123
```

Verify:

- Dashboard loads
- MQTT Integration Connected
- No System Errors
- Node-RED Running
- Mosquitto Running

---

# ✅ Home Assistant Configuration Complete

Your Smart Home Gateway is now capable of:

- Running Home Assistant
- Running Node-RED
- Running Mosquitto MQTT
- Receiving MQTT messages
- Managing local IoT devices

The next section will configure ZeroTier Remote Access and Hybrid LAN + WISP networking.

---

# 🌐 Step 44 — Install ZeroTier

ZeroTier provides secure remote access to your STB from anywhere without exposing your router to the internet.

Update package information.

```bash
sudo apt update
```

Install ZeroTier.

```bash
curl -s https://install.zerotier.com | sudo bash
```

Enable the service.

```bash
sudo systemctl enable zerotier-one
```

Start the service.

```bash
sudo systemctl start zerotier-one
```

Verify service status.

```bash
sudo systemctl status zerotier-one
```

Expected output:

```text
Active: active (running)
```

Exit the status screen.

```
Press Q
```

---

# 🔑 Step 45 — Join Your ZeroTier Network

Display your Node ID.

```bash
sudo zerotier-cli info
```

Example:

```text
200 info <Node_ID> ONLINE
```

Join your network.

```bash
sudo zerotier-cli join YOUR_NETWORK_ID
```

Example:

```bash
sudo zerotier-cli join 0123456789abcdef
```

---

# ✅ Step 46 — Authorize Device

Open the ZeroTier Central web dashboard.

Find the new device.

Authorize the device.

After authorization, verify the connection.

```bash
sudo zerotier-cli listnetworks
```

Expected:

```text
OK
```

STATUS

```text
ONLINE
```

---

# 🌍 Step 47 — Verify ZeroTier IP

Display assigned IP address.

```bash
ip addr
```

Look for the ZeroTier interface.

Example.

```text
ztxxxxxxxx
```

You should see a private ZeroTier IP.

Example.

```text
192.168.xxx.xxx
```

---

# 🔒 Step 48 — Test Remote SSH

From another computer connected to the same ZeroTier network.

```bash
ssh username@ZEROTIER_IP
```

Example.

```bash
ssh bro@192.168.191.20
```

If successful,

remote SSH is ready.

---

# 🌐 Step 49 — Configure Hybrid Network

Project topology.

```
Internet

↓

Main WiFi

↓

D-Link Router (WISP)

↓

LAN Cable

↓

ZTE B860H

↓

Docker

↓

Mosquitto

↓

Node-RED

↓

Home Assistant
```

ESP32 devices connect only to the D-Link local network.

Internet is used only for:

- ZeroTier
- NTP
- Docker Updates

---

# 🌍 Step 50 — Configure Static IP (Optional)

Edit network configuration.

```bash
sudo nano /etc/network/interfaces
```

Or use NetworkManager depending on your Armbian version.

Verify IP.

```bash
ip addr
```

Verify gateway.

```bash
ip route
```

Verify DNS.

```bash
cat /etc/resolv.conf
```

---

# ⏰ Step 51 — Verify Internet Time

Check current status.

```bash
timedatectl status
```

Expected.

```text
System clock synchronized: yes
```

Current year should be correct.

No more 1970 date.

---

# 📡 Step 52 — Test Internet

Ping Google DNS.

```bash
ping 8.8.8.8
```

Ping domain.

```bash
ping google.com
```

Stop.

```
CTRL + C
```

---

# 🔄 Step 53 — Update Docker Images

Pull latest images.

```bash
docker-compose pull
```

Restart containers.

```bash
docker-compose up -d
```

Check running containers.

```bash
docker ps
```

---

# 📊 Step 54 — Monitor System

CPU and Memory.

```bash
htop
```

Disk usage.

```bash
df -h
```

Memory usage.

```bash
free -h
```

Temperature.

```bash
armbianmonitor -m
```

---

# 🛡 Step 55 — Automatic Startup

Verify Docker.

```bash
sudo systemctl is-enabled docker
```

Verify ZeroTier.

```bash
sudo systemctl is-enabled zerotier-one
```

Expected.

```text
enabled
```

Both services will automatically start after every reboot.

---

# ✅ Hybrid Network Configuration Complete

Your STB is now capable of:

- Offline MQTT Communication
- Home Assistant Automation
- Node-RED Automation
- ZeroTier Remote Access
- Automatic NTP Synchronization
- Hybrid Local + Internet Network
- 24/7 Continuous Operation

The next section covers Backup, Restore, System Optimization, and Troubleshooting.

---

# 💾 Step 56 — Backup Docker Project

Creating regular backups is highly recommended before updating Docker images or modifying the system.

Create a backup directory.

```bash
mkdir -p ~/backup
```

Create a compressed backup.

```bash
tar -czvf ~/backup/stb-iot-gateway_$(date +%Y%m%d).tar.gz ~/stb-iot-gateway
```

Verify backup.

```bash
ls -lh ~/backup
```

Example output.

```text
stb-iot-gateway_20260712.tar.gz
```

---

# ♻ Step 57 — Restore Backup

Stop all Docker containers.

```bash
cd ~/stb-iot-gateway

docker-compose down
```

Extract backup.

```bash
tar -xzvf ~/backup/stb-iot-gateway_YYYYMMDD.tar.gz -C ~/
```

Start Docker again.

```bash
cd ~/stb-iot-gateway

docker-compose up -d
```

Verify.

```bash
docker ps
```

---

# 🔄 Step 58 — Update Docker Images

Download the latest Docker images.

```bash
docker-compose pull
```

Recreate containers.

```bash
docker-compose up -d
```

Remove unused images.

```bash
docker image prune -a
```

---

# 🧹 Step 59 — Clean Docker Resources

Remove unused containers.

```bash
docker container prune
```

Remove unused volumes.

```bash
docker volume prune
```

Remove unused networks.

```bash
docker network prune
```

Remove everything unused.

```bash
docker system prune -a
```

---

# 📈 Step 60 — Monitor Docker

Display running containers.

```bash
docker ps
```

Display all containers.

```bash
docker ps -a
```

Display Docker images.

```bash
docker images
```

Display Docker volumes.

```bash
docker volume ls
```

Display Docker networks.

```bash
docker network ls
```

---

# ⚡ Step 61 — Optimize Armbian

Update package database.

```bash
sudo apt update
```

Upgrade packages.

```bash
sudo apt upgrade -y
```

Remove unused packages.

```bash
sudo apt autoremove -y
```

Clean package cache.

```bash
sudo apt clean
```

---

# 🌡 Step 62 — Monitor System Health

CPU usage.

```bash
top
```

Interactive monitor.

```bash
htop
```

Memory.

```bash
free -h
```

Disk.

```bash
df -h
```

Temperature.

```bash
armbianmonitor -m
```

---

# 📝 Step 63 — Check System Logs

System log.

```bash
journalctl -xe
```

Docker service.

```bash
sudo journalctl -u docker
```

ZeroTier service.

```bash
sudo journalctl -u zerotier-one
```

Home Assistant.

```bash
docker logs homeassistant
```

Node-RED.

```bash
docker logs nodered
```

Mosquitto.

```bash
docker logs mosquitto
```

---

# 🚀 Step 64 — Auto Start Verification

Docker.

```bash
systemctl is-enabled docker
```

ZeroTier.

```bash
systemctl is-enabled zerotier-one
```

Both should display.

```text
enabled
```

---

# 📦 Step 65 — Backup Script

Create backup script.

```bash
nano ~/stb-iot-gateway/scripts/backup.sh
```

Paste.

```bash
#!/bin/bash

BACKUP_DIR=~/backup

mkdir -p $BACKUP_DIR

tar -czvf $BACKUP_DIR/stb-iot-gateway_$(date +%Y%m%d).tar.gz ~/stb-iot-gateway
```

Save.

```
CTRL + X

Y

ENTER
```

Make executable.

```bash
chmod +x ~/stb-iot-gateway/scripts/backup.sh
```

Run.

```bash
~/stb-iot-gateway/scripts/backup.sh
```

---

# 🔄 Step 66 — Update Script

Create update script.

```bash
nano ~/stb-iot-gateway/scripts/update.sh
```

Paste.

```bash
#!/bin/bash

cd ~/stb-iot-gateway

docker-compose pull

docker-compose up -d

docker image prune -f
```

Save.

Make executable.

```bash
chmod +x ~/stb-iot-gateway/scripts/update.sh
```

Run.

```bash
~/stb-iot-gateway/scripts/update.sh
```

---

# ✅ Backup & Maintenance Complete

Your STB IoT Gateway now supports:

- Scheduled Backup
- Restore
- Docker Update
- Automatic Maintenance
- System Monitoring
- Health Checking

Continue to **Part 8** for Troubleshooting, FAQ, and Final Notes.
---

# 🔧 Step 67 — Troubleshooting

## Docker Service Not Running

Check Docker status.

```bash
sudo systemctl status docker
```

Restart Docker.

```bash
sudo systemctl restart docker
```

Enable Docker at boot.

```bash
sudo systemctl enable docker
```

---

## Home Assistant Cannot Be Accessed

Check container status.

```bash
docker ps
```

View logs.

```bash
docker logs homeassistant
```

Restart.

```bash
docker restart homeassistant
```

Wait several minutes during the first startup.

---

## Node-RED Cannot Be Accessed

Check logs.

```bash
docker logs nodered
```

Restart.

```bash
docker restart nodered
```

Open.

```
http://YOUR_STB_IP:1880
```

---

## MQTT Connection Failed

Check Mosquitto logs.

```bash
docker logs mosquitto
```

Restart broker.

```bash
docker restart mosquitto
```

Verify port.

```bash
netstat -tulpn | grep 1883
```

---

## ZeroTier Offline

Check service.

```bash
sudo systemctl status zerotier-one
```

Restart.

```bash
sudo systemctl restart zerotier-one
```

Verify network.

```bash
sudo zerotier-cli listnetworks
```

---

## No Internet Connection

Check IP Address.

```bash
ip addr
```

Check Gateway.

```bash
ip route
```

Check DNS.

```bash
cat /etc/resolv.conf
```

Test Internet.

```bash
ping 8.8.8.8
```

---

## System Time Incorrect

Enable NTP.

```bash
sudo timedatectl set-ntp true
```

Restart time service.

```bash
sudo systemctl restart systemd-timesyncd
```

Verify.

```bash
timedatectl status
```

---

# ❓ Frequently Asked Questions

### Can MQTT work without Internet?

**Yes.**

MQTT communication is fully local inside the D-Link router.

---

### Does Home Assistant require Internet?

Only for:

- Initial updates
- Integrations
- NTP synchronization

Daily automation works completely offline.

---

### Why use Docker?

Docker makes every application independent.

Benefits:

- Easy update
- Easy backup
- Easy restore
- Better stability

---

### Why ZeroTier?

ZeroTier allows secure remote access without opening router ports or configuring port forwarding.

---

### Why Use Armbian?

Armbian is lightweight and optimized for ARM devices such as the ZTE B860H.

---

# 🔒 Security Recommendations

- Change all default passwords.
- Keep Armbian updated.
- Backup your project regularly.
- Never expose MQTT directly to the Internet.
- Protect SSH access with strong passwords or SSH keys.
- Store sensitive credentials outside public repositories.

---

# 🚀 Future Improvements

Possible future enhancements:

- ESP32 sensor integration
- GPS Tracker integration
- OTA firmware updates
- InfluxDB
- Grafana Dashboard
- Zigbee2MQTT
- ESPHome
- WireGuard VPN
- Automatic backup to NAS
- UPS power monitoring

---

# 📁 Repository Structure

```
STB-Low-Power-IoT-Gateway/

├── README.md
├── docs/
├── docker/
├── scripts/
├── images/
├── config/
├── node_red_data/
├── mosquitto/
└── .gitignore
```

---

# 📜 License

MIT License

Feel free to modify and improve this project for educational and personal use.

---

# 🙏 Acknowledgements

Special thanks to:

- Armbian Project
- Docker
- Home Assistant
- Eclipse Mosquitto
- Node-RED
- ZeroTier
- Open Source Community

---

# ⭐ Support

If this project helps you, consider giving it a ⭐ on GitHub.

It motivates future development and improvements.

---

# 📬 Contact

Feel free to open an Issue or Pull Request for bug reports, suggestions, or improvements.

---

<p align="center">

<b>Built with passion using a recycled ZTE B860H Set-Top Box, Armbian Linux, Docker, Home Assistant, Node-RED, Mosquitto MQTT, and ZeroTier.</b>

<br><br>

⭐ Thank you for visiting this project!

</p>

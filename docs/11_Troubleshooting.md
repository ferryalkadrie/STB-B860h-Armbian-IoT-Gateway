# 🛠️ Troubleshooting

## Overview

This section provides solutions to common issues that may occur while operating the STB Low-Power IoT Gateway.

The goal is to quickly identify problems and restore normal operation with minimal downtime.

---

# Docker Container Not Running

## Symptoms

- Container stops unexpectedly.
- Service cannot be accessed.
- Docker reports container exited.

## Solution

Check running containers:

```bash
docker ps -a
```

View container logs:

```bash
docker logs <container_name>
```

Restart the container:

```bash
docker restart <container_name>
```

---

# Home Assistant Cannot Be Accessed

## Symptoms

- Web interface does not load.
- Browser timeout.
- Connection refused.

## Solution

Verify the container:

```bash
docker ps
```

Check logs:

```bash
docker logs homeassistant
```

Verify port 8123:

```bash
sudo ss -tulpn | grep 8123
```

---

# Node-RED Not Accessible

## Symptoms

- Cannot open port 1880.
- Flow editor unavailable.

## Solution

Restart Node-RED:

```bash
docker restart nodered
```

Check logs:

```bash
docker logs nodered
```

Verify port:

```bash
sudo ss -tulpn | grep 1880
```

---

# MQTT Connection Failed

## Symptoms

- ESP32 cannot publish data.
- Home Assistant cannot receive MQTT messages.

## Solution

Verify Mosquitto:

```bash
docker logs mosquitto
```

Restart service:

```bash
docker restart mosquitto
```

Verify port:

```bash
sudo ss -tulpn | grep 1883
```

---

# ZeroTier Offline

## Symptoms

- Remote access unavailable.
- Virtual IP not assigned.

## Solution

Check service status:

```bash
sudo systemctl status zerotier-one
```

Restart ZeroTier:

```bash
sudo systemctl restart zerotier-one
```

Verify network:

```bash
sudo zerotier-cli listnetworks
```

---

# No Internet Connection

## Symptoms

- Unable to update packages.
- ZeroTier disconnected.
- NTP synchronization fails.

## Solution

Test network:

```bash
ping 8.8.8.8
```

Test DNS:

```bash
ping google.com
```

Verify router connection.

---

# Incorrect System Time

## Symptoms

- Wrong timestamps.
- Scheduled automations fail.

## Solution

Check current time:

```bash
timedatectl
```

Enable NTP:

```bash
sudo timedatectl set-ntp true
```

Set timezone:

```bash
sudo timedatectl set-timezone Asia/Jakarta
```

---

# High CPU Usage

## Symptoms

- Slow dashboard.
- Delayed automation.

## Solution

Check CPU usage:

```bash
top
```

or

```bash
htop
```

Identify processes consuming excessive resources.

---

# Low Disk Space

Check storage:

```bash
df -h
```

Remove unused Docker images:

```bash
docker image prune
```

Remove stopped containers:

```bash
docker container prune
```

---

# Memory Usage

Check RAM:

```bash
free -h
```

Restart heavy services if necessary.

---

# Useful Diagnostic Commands

System information:

```bash
uname -a
```

Docker status:

```bash
docker ps
```

Running services:

```bash
systemctl --type=service --state=running
```

Disk usage:

```bash
df -h
```

Memory usage:

```bash
free -h
```

CPU usage:

```bash
top
```

---

# Preventive Maintenance

To keep the system stable:

- Update Armbian regularly.
- Update Docker images.
- Backup configurations before changes.
- Monitor available disk space.
- Check system logs periodically.
- Restart services only when necessary.

---

# Expected Result

After following this troubleshooting guide:

- Docker services should be running normally.
- Home Assistant should be accessible.
- Node-RED should function correctly.
- MQTT communication should be restored.
- ZeroTier should reconnect successfully.
- The STB should operate reliably as the IoT Gateway.

---

# Next Document

Continue reading:

**docs/12_FAQ.md**

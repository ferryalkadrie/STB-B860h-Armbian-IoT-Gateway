# 💾 Backup & Restore

## Overview

Regular backups are essential to ensure the reliability and recoverability of the STB Low-Power IoT Gateway.

This document explains how to back up and restore Docker containers, Home Assistant, Node-RED, MQTT configuration, and important system files.

---

# Why Backup?

A backup allows the system to be quickly restored in case of:

- Storage failure
- System corruption
- Hardware replacement
- Configuration errors
- Accidental file deletion

Regular backups reduce downtime and protect important configurations.

---

# Backup Strategy

Recommended backup schedule:

| Item | Frequency |
|------|-----------|
| Home Assistant | Weekly |
| Node-RED Flows | Weekly |
| MQTT Configuration | Monthly |
| Docker Compose Files | After Changes |
| Armbian Configuration | Monthly |

---

# Backup Docker Volumes

Create a backup directory:

```bash
mkdir -p ~/backup
```

---

# Backup Home Assistant

Example:

```bash
docker stop homeassistant

tar -czf ~/backup/homeassistant_backup.tar.gz \
/var/lib/docker/volumes/homeassistant_data

docker start homeassistant
```

---

# Backup Node-RED

```bash
docker stop nodered

tar -czf ~/backup/nodered_backup.tar.gz \
/var/lib/docker/volumes/node_red_data

docker start nodered
```

---

# Backup Mosquitto

```bash
docker stop mosquitto

tar -czf ~/backup/mosquitto_backup.tar.gz \
/var/lib/docker/volumes/mosquitto_data

docker start mosquitto
```

---

# Backup Docker Compose

If using Docker Compose:

```bash
cp docker-compose.yml ~/backup/
```

---

# Backup Configuration Files

Recommended files:

```
docker-compose.yml

mosquitto.conf

configuration.yaml

flows.json

.env
```

---

# Restore Procedure

Stop the container:

```bash
docker stop homeassistant
```

Extract backup:

```bash
tar -xzf homeassistant_backup.tar.gz -C /
```

Restart:

```bash
docker start homeassistant
```

Repeat the same procedure for Node-RED and Mosquitto.

---

# Verify Backup

Check archive contents:

```bash
tar -tf homeassistant_backup.tar.gz
```

Verify Docker volumes:

```bash
docker volume ls
```

---

# Recommended Storage

Store backups in multiple locations:

- External Hard Drive
- USB Flash Drive
- NAS Server
- Cloud Storage (Optional)

Do not store the only backup on the same STB.

---

# Best Practices

- Test backups periodically.
- Keep multiple backup versions.
- Backup before major updates.
- Label backup files with dates.
- Verify backup integrity after creation.

---

# Expected Result

After completing this section:

- Critical data is backed up safely.
- Docker volumes can be restored.
- Home Assistant configuration is recoverable.
- Node-RED flows are protected.
- MQTT configuration can be restored quickly.

---

# Next Document

Continue reading:

**docs/11_Troubleshooting.md**

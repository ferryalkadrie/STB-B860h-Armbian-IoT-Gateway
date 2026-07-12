# 🌍 Internet Connection & NTP Configuration

## Overview

The STB Low-Power IoT Gateway is designed using an **Offline-First** approach.

The local network remains fully operational without internet access, while the internet connection is only used for selected services such as system updates, remote access, and time synchronization.

---

# Offline-First Design

The gateway prioritizes local communication.

```
                 Internet
                     │
          (Optional WISP Connection)
                     │
              +--------------+
              |    Router    |
              +--------------+
                     │
      ┌──────────────┴──────────────┐
      │                             │
      ▼                             ▼
 Local IoT Network             STB Gateway
```

If the internet connection is lost, all local automation continues to operate.

---

# Internet Usage

The internet connection is used only for:

- Operating System Updates
- Docker Image Updates
- Home Assistant Updates
- ZeroTier Remote Access
- NTP Time Synchronization
- Optional Cloud Services

---

# Services That Continue Offline

The following services remain available without internet:

| Service | Status |
|----------|--------|
| Home Assistant | ✅ Available |
| Node-RED | ✅ Available |
| Mosquitto MQTT | ✅ Available |
| ESP32 Communication | ✅ Available |
| Local Dashboard | ✅ Available |
| Local Automation | ✅ Available |

---

# Services That Require Internet

| Service | Status |
|----------|--------|
| ZeroTier | 🌐 Internet Required |
| System Update | 🌐 Internet Required |
| Docker Pull | 🌐 Internet Required |
| NTP Time Sync | 🌐 Internet Required |
| Cloud Integration | 🌐 Internet Required |

---

# NTP Time Synchronization

Accurate system time is essential for:

- Scheduled Automation
- Logging
- Home Assistant History
- SSL Certificates
- Event Timestamp

---

# Verify Current Time

Check the current system time:

```bash
timedatectl
```

Example output:

```
Local time: ...
Time zone: Asia/Jakarta
NTP service: active
System clock synchronized: yes
```

---

# Configure Time Zone

Example:

```bash
sudo timedatectl set-timezone Asia/Jakarta
```

---

# Enable NTP

Enable automatic synchronization:

```bash
sudo timedatectl set-ntp true
```

Verify status:

```bash
timedatectl
```

---

# Test Internet Connectivity

Ping Google DNS:

```bash
ping 8.8.8.8
```

Test DNS resolution:

```bash
ping google.com
```

---

# Recommended Configuration

- Keep internet optional.
- Prioritize LAN communication.
- Synchronize time automatically.
- Update the system periodically.
- Avoid unnecessary cloud dependencies.

---

# Expected Result

After completing this section:

- Internet connectivity is available when needed.
- The system time is synchronized automatically.
- Local automation continues even if the internet connection is lost.
- Remote services function normally when internet access is available.

---

# Next Document

Continue reading:

**docs/10_Backup_Restore.md**

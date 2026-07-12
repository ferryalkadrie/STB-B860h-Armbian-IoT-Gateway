# 🌐 ZeroTier Remote Access

## Overview

ZeroTier enables secure remote access to the STB IoT Gateway without requiring a public IP address or complex port forwarding.

By creating a virtual private network (VPN), the STB can be accessed from anywhere while remaining protected behind the local network.

This makes it ideal for monitoring and maintaining the system remotely.

---

# Why ZeroTier?

Many Internet Service Providers (ISPs) use Carrier-Grade NAT (CGNAT), preventing direct inbound connections.

ZeroTier solves this problem by creating a secure peer-to-peer virtual network.

Advantages include:

- No Port Forwarding Required
- Works Behind CGNAT
- End-to-End Encryption
- Cross-Platform Support
- Easy Deployment
- Secure Remote Access

---

# Network Architecture

```
          Laptop / Smartphone
                    │
             ZeroTier Network
                    │
                    ▼
          +-------------------+
          |   STB IoT Gateway |
          +-------------------+
                    │
             Docker Containers
                    │
      ┌─────────────┼─────────────┐
      ▼             ▼             ▼
 Mosquitto      Node-RED    Home Assistant
```

---

# Install ZeroTier

Run the installation script:

```bash
curl -s https://install.zerotier.com | sudo bash
```

---

# Join Network

Join your ZeroTier network:

```bash
sudo zerotier-cli join YOUR_NETWORK_ID
```

Replace:

```
YOUR_NETWORK_ID
```

with your own ZeroTier network ID.

---

# Verify Status

Check service status:

```bash
sudo systemctl status zerotier-one
```

Check node information:

```bash
sudo zerotier-cli info
```

List joined networks:

```bash
sudo zerotier-cli listnetworks
```

---

# Network Authorization

After joining, authorize the STB from the ZeroTier Central dashboard.

Once authorized, the device will receive a virtual IP address.

---

# Remote Access

After authorization, the following services can be accessed remotely:

| Service | Default Port |
|----------|-------------:|
| SSH | 22 |
| Node-RED | 1880 |
| Home Assistant | 8123 |
| MQTT | 1883 |

---

# Advantages

- Secure Remote Management
- Encrypted Communication
- No Public IP Required
- No Dynamic DNS Needed
- Easy Multi-Device Access
- Low Latency

---

# Security Recommendations

For better security:

- Use strong passwords.
- Keep the operating system updated.
- Limit SSH access when appropriate.
- Authorize only trusted devices in the ZeroTier network.
- Regularly review connected devices.

---

# Expected Result

After completing this section:

- ZeroTier is installed.
- The STB successfully joins the virtual network.
- The device receives a virtual IP address.
- Remote management is available from authorized devices.

---

# Next Document

Continue reading:

**docs/08_LAN_Configuration.md**

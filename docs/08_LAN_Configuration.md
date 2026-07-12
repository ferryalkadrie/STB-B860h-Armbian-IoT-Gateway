# 🌐 LAN Network Configuration

## Overview

The Local Area Network (LAN) is the foundation of the STB Low-Power IoT Gateway.

All IoT devices communicate through the local network, allowing automation and monitoring to continue even when the internet connection is unavailable.

The STB functions as the central server, while the router provides local connectivity between devices.

---

# Network Topology

```
                   Internet (Optional)
                           │
                     WISP Connection
                           │
                           ▼
                    +--------------+
                    |    Router    |
                    +--------------+
                           │
        ┌──────────────────┼──────────────────┐
        │                  │                  │
        ▼                  ▼                  ▼
   STB IoT Server      ESP32 Devices     Other Clients
        │                  │                  │
        └──────────────────┼──────────────────┘
                           ▼
                     Local LAN Network
```

---

# LAN Design

The network is designed using a simple star topology.

All devices communicate through the router.

Recommended configuration:

- Static IP for the STB
- DHCP for IoT devices
- Gigabit Ethernet (if available)
- Reliable power supply for the router

---

# Static IP Address

Assign a fixed IP address to the STB.

Example:

| Device | IP Address |
|---------|------------|
| Router | 192.168.1.1 |
| STB Server | 192.168.1.10 |
| ESP32 Devices | DHCP |
| Laptop | DHCP |
| Smartphone | DHCP |

Using a static IP ensures the server is always reachable at the same address.

---

# Local Services

The following services are available on the LAN:

| Service | Port |
|----------|-----:|
| SSH | 22 |
| MQTT | 1883 |
| Node-RED | 1880 |
| Home Assistant | 8123 |

---

# Communication Flow

```
ESP32
   │
   ▼
Router
   │
   ▼
STB Server
   │
   ├────────► MQTT
   ├────────► Node-RED
   └────────► Home Assistant
```

---

# Offline Operation

If the internet connection is lost:

- MQTT continues operating.
- Home Assistant remains accessible.
- Node-RED automations continue running.
- Local dashboards remain available.
- ESP32 devices continue communicating normally.

Only cloud-based services become unavailable.

---

# Recommended Router Settings

- Enable DHCP
- Reserve a Static IP for the STB
- Disable unnecessary services
- Use WPA2 or WPA3 security
- Configure a strong Wi-Fi password

---

# Best Practices

- Keep all IoT devices on the same subnet.
- Avoid changing the STB IP address.
- Use Ethernet for the STB whenever possible.
- Maintain a stable power source for the router.
- Label devices with meaningful hostnames.

---

# Expected Result

After completing this section:

- All IoT devices can communicate over the LAN.
- The STB is accessible using a static IP.
- Home Assistant, Node-RED, and MQTT operate normally.
- Local automation continues even without internet access.

---

# Next Document

Continue reading:

**docs/09_Internet_and_NTP.md**

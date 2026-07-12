# 💻 Install Armbian

## Overview

This section explains how to replace the factory Android operating system with Armbian Linux.

Armbian provides a lightweight, stable, and efficient Linux environment that transforms the Android TV Box into a dedicated IoT Gateway Server.

---

# Requirements

Before starting, prepare the following:

- Supported Android TV Box (STB)
- USB Flash Drive or microSD Card
- Linux or Windows PC
- USB Keyboard
- HDMI Monitor
- Stable Power Supply

---

# Software Required

| Software | Purpose |
|----------|----------|
| Armbian Image | Operating System |
| Balena Etcher | Flash Image |
| Device Tree (.dtb) | Hardware Compatibility |
| SSH Client | Remote Access |

---

# Installation Steps

## Step 1

Download the appropriate Armbian image compatible with your STB chipset.

---

## Step 2

Write the image to a USB Flash Drive or microSD Card using Balena Etcher.

---

## Step 3

Copy the correct Device Tree Blob (.dtb) if required by your hardware.

Using the correct Device Tree ensures proper hardware initialization.

---

## Step 4

Insert the boot media into the STB.

---

## Step 5

Enter the bootloader or recovery mode.

Depending on the STB model, this may require:

- Recovery button
- Mask ROM mode
- USB Burning mode

---

## Step 6

Boot Armbian for the first time.

The system will automatically resize the filesystem and perform initial configuration.

---

## Step 7

Create a new Linux user account and configure a secure password.

---

## Step 8

Update all installed packages.

```bash
sudo apt update
sudo apt upgrade -y
```

---

# Verify Installation

Check the Linux version:

```bash
uname -a
```

Check CPU information:

```bash
lscpu
```

Check available storage:

```bash
df -h
```

Check memory usage:

```bash
free -h
```

---

# Recommended Configuration

- Enable SSH
- Set correct timezone
- Configure hostname
- Enable automatic time synchronization
- Update all packages

---

# Advantages of Armbian

- Lightweight
- Stable
- Low Memory Usage
- Long-Term Support
- Docker Compatible
- Excellent Network Performance

---

# Expected Result

After completing this section, the Android TV Box should boot directly into Armbian Linux and be ready for Docker installation.

---

# Next Document

Continue reading:

**docs/03_Docker_Installation.md**

# 🐳 Docker Installation

## Overview

Docker is the foundation of the STB IoT Gateway.

Instead of installing applications directly on the operating system, each service runs inside an isolated Docker container. This approach improves stability, simplifies maintenance, and makes future upgrades much easier.

---

# Why Docker?

Docker provides several important advantages:

- Service isolation
- Easy deployment
- Simplified updates
- Better reliability
- Easy backup
- Lower maintenance effort

Each service operates independently without interfering with the others.

---

# Install Docker Engine

Update the package list:

```bash
sudo apt update
```

Install Docker Engine:

```bash
sudo apt install docker.io docker-compose -y
```

---

# Enable Docker Service

Start Docker automatically during system boot:

```bash
sudo systemctl enable docker
sudo systemctl start docker
```

Verify Docker status:

```bash
sudo systemctl status docker
```

---

# Verify Installation

Check Docker version:

```bash
docker --version
```

Check Docker Compose:

```bash
docker compose version
```

or

```bash
docker-compose --version
```

Depending on the installed version.

---

# Test Docker

Run a simple container:

```bash
sudo docker run hello-world
```

If the installation is successful, Docker will display a confirmation message.

---

# Add User to Docker Group

To avoid typing `sudo` every time:

```bash
sudo usermod -aG docker $USER
```

Log out and log back in to apply the changes.

---

# Verify Running Containers

List active containers:

```bash
docker ps
```

List all containers:

```bash
docker ps -a
```

---

# Verify Docker Images

```bash
docker images
```

---

# Docker Network

Most services in this project communicate through the Docker Host Network.

Advantages include:

- Faster communication
- Easier configuration
- Better compatibility with Home Assistant
- Improved local device discovery

---

# Planned Containers

The STB will host the following containers:

| Container | Function |
|-----------|----------|
| Mosquitto MQTT | Message Broker |
| Node-RED | Automation Engine |
| Home Assistant | Smart Home Dashboard |

Additional containers may be added in future versions.

---

# Recommended Maintenance

Update Docker periodically:

```bash
sudo apt update
sudo apt upgrade -y
```

Remove unused images:

```bash
docker image prune
```

Remove stopped containers:

```bash
docker container prune
```

---

# Expected Result

After completing this section, Docker Engine should be fully operational and ready to host the IoT services.

---

# Next Document

Continue reading:

**docs/04_Mosquitto_MQTT.md**

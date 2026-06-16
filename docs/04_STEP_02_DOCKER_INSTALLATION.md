# Step 02 – Docker Installation

## Purpose

Install Docker Engine and Docker Compose on a clean Ubuntu server to provide the container runtime required by the GREATER ecosystem.

This step establishes the foundation for deploying all GREATER services as isolated and reproducible containers.

---

## Why This Step Is Required

The GREATER ecosystem is fully containerized.

All major services are deployed using Docker, including:

* PHP Middleware
* MySQL Database
* NGINX Reverse Proxy
* Mosquitto MQTT Broker
* Node-RED Workspaces
* phpMyAdmin
* Monitoring Services

Without Docker, the GREATER ecosystem cannot be deployed.

---

## Input Files

None.

---

## Output Files

None.

Docker packages and services are installed on the Ubuntu server.

---

## Commands Used

### Update Ubuntu

```bash
sudo apt update

sudo apt upgrade -y
```

### Install Required Dependencies

```bash
sudo apt install -y \
ca-certificates \
curl \
gnupg \
lsb-release
```

### Create Docker Keyring Directory

```bash
sudo install -m 0755 -d /etc/apt/keyrings
```

### Download Docker GPG Key

```bash
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | \
sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
```

### Configure Docker Repository

```bash
echo \
"deb [arch=$(dpkg --print-architecture) \
signed-by=/etc/apt/keyrings/docker.gpg] \
https://download.docker.com/linux/ubuntu \
$(. /etc/os-release && echo $VERSION_CODENAME) stable" | \
sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
```

### Refresh Package Index

```bash
sudo apt update
```

### Install Docker Engine

```bash
sudo apt install -y \
docker-ce \
docker-ce-cli \
containerd.io \
docker-buildx-plugin \
docker-compose-plugin
```

---

## Verify Installation

### Docker Version

```bash
docker --version
```

Example:

```text
Docker version 28.x.x
```

### Docker Compose Version

```bash
docker compose version
```

Example:

```text
Docker Compose version v2.x.x
```

---

## Verify Docker Service

```bash
sudo systemctl status docker
```

Expected:

```text
active (running)
```

---

## Hello World Validation

Run:

```bash
sudo docker run hello-world
```

Expected:

```text
Hello from Docker!
This message shows that your installation appears to be working correctly.
```

---

## Configure Docker for Current User

Add current user to Docker group:

```bash
sudo usermod -aG docker $USER
```

Apply group membership:

```bash
newgrp docker
```

Verify:

```bash
docker ps
```

No sudo should be required.

---

## Expected Results

Docker Engine installed successfully.

Docker Compose installed successfully.

Docker service running.

Hello World container executed successfully.

Current user can execute Docker commands.

---

## Validation Procedure

Verify:

```bash
docker --version

docker compose version

docker ps

sudo systemctl status docker
```

Run:

```bash
docker run hello-world
```

Confirm successful execution.

---

## Troubleshooting Notes

### Docker Service Not Running

```bash
sudo systemctl start docker

sudo systemctl enable docker
```

---

### Docker Command Not Found

```bash
sudo apt update

sudo apt install docker-ce docker-ce-cli
```

---

### Permission Denied

```bash
sudo usermod -aG docker $USER

newgrp docker
```

---

### Verify Installed Packages

```bash
dpkg -l | grep docker
```

---

## Commands Executed During Validation

```bash
sudo apt update

sudo apt upgrade -y

sudo apt install -y \
ca-certificates \
curl \
gnupg \
lsb-release

sudo install -m 0755 -d /etc/apt/keyrings

curl -fsSL https://download.docker.com/linux/ubuntu/gpg | \
sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg

sudo apt update

sudo apt install -y \
docker-ce \
docker-ce-cli \
containerd.io \
docker-buildx-plugin \
docker-compose-plugin

docker --version

docker compose version

sudo systemctl status docker

sudo docker run hello-world

sudo usermod -aG docker $USER

newgrp docker

docker ps
```

---

## Final Status

| Activity    | Status    |
| ----------- | --------- |
| Designed    | Completed |
| Implemented | Pending   |
| Tested      | Pending   |
| Validated   | Pending   |
| Frozen      | Pending   |

---

## Conclusion

Docker Engine and Docker Compose were successfully installed and validated on Ubuntu 24.04.

Validation confirmed:

- Docker Engine operational
- Docker Compose operational
- Docker service active
- Container execution successful
- User added to docker group
- GREATER development environment ready

This step is considered completed and frozen.

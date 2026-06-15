#!/bin/bash

set -e

REPORT_FILE="logs/prerequisites_report.txt"

mkdir -p logs

echo "======================================"
echo " GREATER Installer - Prerequisites"
echo "======================================"

echo "GREATER Prerequisites Report" > "$REPORT_FILE"
echo "Generated on: $(date)" >> "$REPORT_FILE"
echo "Hostname: $(hostname)" >> "$REPORT_FILE"
echo "--------------------------------------" >> "$REPORT_FILE"

STATUS="READY"

check_command() {
    local CMD="$1"

    if command -v "$CMD" >/dev/null 2>&1; then
        echo "$CMD: OK"
        echo "$CMD: OK" >> "$REPORT_FILE"
    else
        echo "$CMD: MISSING"
        echo "$CMD: MISSING" >> "$REPORT_FILE"
        STATUS="BLOCKED"
    fi
}

echo ""
echo "[1] Checking Ubuntu version..."

if command -v lsb_release >/dev/null 2>&1; then
    UBUNTU_VERSION=$(lsb_release -rs)
else
    UBUNTU_VERSION="UNKNOWN"
fi

echo "Ubuntu version: $UBUNTU_VERSION"
echo "Ubuntu version: $UBUNTU_VERSION" >> "$REPORT_FILE"

echo ""
echo "[2] Checking system resources..."

CPU_CORES=$(nproc)
RAM_GB=$(free -g | awk '/^Mem:/ {print $2}')
DISK_GB=$(df -BG / | awk 'NR==2 {gsub("G","",$4); print $4}')

echo "CPU cores: $CPU_CORES"
echo "RAM: ${RAM_GB} GB"
echo "Available disk: ${DISK_GB} GB"

echo "CPU cores: $CPU_CORES" >> "$REPORT_FILE"
echo "RAM: ${RAM_GB} GB" >> "$REPORT_FILE"
echo "Available disk: ${DISK_GB} GB" >> "$REPORT_FILE"

if [[ "$CPU_CORES" -lt 2 ]]; then
    echo "WARNING: CPU cores below minimum requirement."
    echo "WARNING: CPU cores below minimum requirement." >> "$REPORT_FILE"
    STATUS="BLOCKED"
fi

if [[ "$RAM_GB" -lt 4 ]]; then
    echo "WARNING: RAM below minimum requirement."
    echo "WARNING: RAM below minimum requirement." >> "$REPORT_FILE"
    STATUS="BLOCKED"
fi

if [[ "$DISK_GB" -lt 50 ]]; then
    echo "WARNING: Available disk below minimum requirement."
    echo "WARNING: Available disk below minimum requirement." >> "$REPORT_FILE"
    STATUS="BLOCKED"
fi

echo ""
echo "[3] Checking required commands..."

check_command curl
check_command wget
check_command git
check_command unzip
check_command zip
check_command jq
check_command openssl
check_command lsb_release
check_command gpg

echo ""
echo "[4] Checking Docker..."

if command -v docker >/dev/null 2>&1; then
    DOCKER_VERSION=$(docker --version)
    echo "Docker: OK"
    echo "$DOCKER_VERSION"
    echo "Docker: OK" >> "$REPORT_FILE"
    echo "$DOCKER_VERSION" >> "$REPORT_FILE"
else
    echo "Docker: MISSING"
    echo "Docker: MISSING" >> "$REPORT_FILE"
    STATUS="BLOCKED"
fi

echo ""
echo "[5] Checking Docker Compose..."

if command -v docker >/dev/null 2>&1 && docker compose version >/dev/null 2>&1; then
    COMPOSE_VERSION=$(docker compose version)
    echo "Docker Compose: OK"
    echo "$COMPOSE_VERSION"
    echo "Docker Compose: OK" >> "$REPORT_FILE"
    echo "$COMPOSE_VERSION" >> "$REPORT_FILE"
else
    echo "Docker Compose: MISSING"
    echo "Docker Compose: MISSING" >> "$REPORT_FILE"
    STATUS="BLOCKED"
fi

echo ""
echo "[6] Checking Docker service..."

if systemctl is-active --quiet docker; then
    echo "Docker service: ACTIVE"
    echo "Docker service: ACTIVE" >> "$REPORT_FILE"
else
    echo "Docker service: NOT ACTIVE"
    echo "Docker service: NOT ACTIVE" >> "$REPORT_FILE"
    STATUS="BLOCKED"
fi

echo ""
echo "[7] Testing Docker execution..."

if command -v docker >/dev/null 2>&1 && docker run --rm hello-world >/dev/null 2>&1; then
    echo "Docker test: OK"
    echo "Docker test: OK" >> "$REPORT_FILE"
else
    echo "Docker test: FAILED"
    echo "Docker test: FAILED" >> "$REPORT_FILE"
    STATUS="BLOCKED"
fi

echo ""
echo "[8] Checking required ports..."

check_port() {
    local PORT="$1"
    local NAME="$2"

    if ss -tuln | grep -q ":$PORT "; then
        echo "Port $PORT ($NAME): IN USE"
        echo "Port $PORT ($NAME): IN USE" >> "$REPORT_FILE"
        STATUS="BLOCKED"
    else
        echo "Port $PORT ($NAME): FREE"
        echo "Port $PORT ($NAME): FREE" >> "$REPORT_FILE"
    fi
}

check_port 80 "HTTP"
check_port 443 "HTTPS"
check_port 1883 "MQTT"
check_port 3306 "MySQL"

echo ""
echo "--------------------------------------" >> "$REPORT_FILE"

if [[ "$STATUS" == "READY" ]]; then
    echo "======================================"
    echo " SERVER READY FOR GREATER INSTALLATION"
    echo "======================================"
    echo "Status: READY FOR GREATER INSTALLATION" >> "$REPORT_FILE"
else
    echo "======================================"
    echo " INSTALLATION BLOCKED"
    echo "======================================"
    echo "Status: INSTALLATION BLOCKED" >> "$REPORT_FILE"
fi

echo ""
echo "Report saved to: $REPORT_FILE"

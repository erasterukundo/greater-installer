# GREATER Installer

## Introduction

The GREATER Ecosystem is a cloud-based, open-source, multi-tenant IoT platform developed within the GREATER project to support distributed Living Labs operating across multiple institutions and geographical locations.

The ecosystem was designed to address challenges associated with deploying IoT services in resource-constrained environments, including high infrastructure costs, vendor lock-in, limited customization, and difficulties in supporting multiple Living Labs from a single platform.

The GREATER Installer provides an automated deployment framework capable of transforming a clean Ubuntu server into a fully operational GREATER Ecosystem.

---

## Main Features

- Multi-Living-Lab Management
- Open-Source Architecture
- Multi-Tenant Design
- Role-Based Access Control (RBAC)
- JWT Authentication
- MQTT and HTTPS API Integration
- Node-RED Service Creation
- Monitoring and Observability
- Automated Deployment
- Replicable Infrastructure

---

## Repository Structure

```text
docs/
installer/
docker/
mysql/
nginx/
nodered/
php/
monitoring/
config/

# Documentation Structure

Each module must contain:

- Purpose
- Why the module is required
- Input files
- Output files
- Commands used
- Complete source code
- Expected results
- Validation procedure
- Troubleshooting notes
- Final status

# Step 0 – Clean Server Validation

## Purpose

Verify that development begins from a clean Ubuntu server before installing dependencies or creating the GREATER ecosystem.

## Expected Initial State

- Ubuntu installed
- Docker not installed
- Docker Compose not installed
- No GREATER containers
- No GREATER databases
- No GREATER deployment files

## Validation Commands

```bash
lsb_release -a
docker --version
docker compose version
docker ps -a
backup/
logs/

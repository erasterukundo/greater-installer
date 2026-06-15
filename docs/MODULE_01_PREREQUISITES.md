# Module 01 – Prerequisites Validation Script

## Purpose

Module 01 validates that a target Ubuntu server satisfies all minimum requirements required for deploying the GREATER Ecosystem.

The module performs automated checks before any configuration generation or service deployment is attempted.

The objective is to prevent installation failures caused by unsupported operating systems, insufficient resources, missing dependencies, Docker issues, or occupied network ports.

---

## Why This Module is Required

Deploying the GREATER Ecosystem on an incompatible server can result in deployment errors, unstable services, security risks, and unexpected behavior.

This module ensures that:

- The operating system is supported.
- Hardware resources are sufficient.
- Required software is installed.
- Docker is available and operational.
- Required network ports are available.
- Installation can proceed safely.

---

## Functional Requirements

The module shall verify:

### Operating System

- Ubuntu installation detected
- Ubuntu version supported
- Ubuntu 22.04 LTS or newer

### Hardware Resources

- CPU cores
- RAM capacity
- Available disk space

### Software Dependencies

- Docker Engine
- Docker Compose

### Docker Validation

- Docker daemon running
- Docker hello-world test successful

### Network Validation

Required ports available:

- 80 (HTTP)
- 443 (HTTPS)
- 1883 (MQTT)
- 3306 (MySQL)

### Reporting

Generate a detailed validation report.

---

## Input Files

None.

---

## Output Files

Generated:

```text
logs/prerequisites_report.txt

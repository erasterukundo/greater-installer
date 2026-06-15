# Step 00 – Clean Server Validation

## Purpose

Verify that installer development starts from a clean Ubuntu server before installing Docker, Docker Compose, or any GREATER ecosystem components.

This step establishes a reproducible baseline environment for all future installer testing and validation activities.

---

## Why This Step Is Required

A clean environment guarantees that installer validation is reproducible and that no previous configurations affect deployment results.

Without this verification:

* Existing Docker installations may interfere with testing.
* Existing containers may occupy required ports.
* Previous GREATER installations may affect validation results.
* Documentation may become difficult to reproduce on another server.

---

## Input Files

None.

---

## Output Files

None.

---

## Commands Used

### Verify Current Location

```bash
pwd
```

### List Existing Files and Folders

```bash
ls
```

### Check Docker Installation

```bash
docker --version
```

### Check Docker Compose

```bash
docker compose version
```

### Check Existing Containers

```bash
docker ps -a
```

### Stop Docker Service

```bash
sudo systemctl stop docker
```

### Remove Docker Packages

```bash
sudo apt remove -y \
docker-ce \
docker-ce-cli \
containerd.io \
docker-buildx-plugin \
docker-compose-plugin
```

### Remove Unused Packages

```bash
sudo apt autoremove -y
```

### Verify Docker Removal

```bash
docker --version
```

Expected result:

```text
-bash: /usr/bin/docker: No such file or directory
```

---

## Example Output

### Current User Home Directory

```text
/home/greaterproject
```

### Existing Container Before Removal

```text
CONTAINER ID   IMAGE         STATUS
3ff05037e17d   hello-world   Exited (0)
```

### Docker Removed Successfully

```text
Removing docker-ce...
Removing docker-ce-cli...
Removing containerd.io...
Removing docker-compose-plugin...
```

### Final Verification

```text
-bash: /usr/bin/docker: No such file or directory
```

---

## Expected Results

The server should satisfy all of the following conditions:

* Docker removed
* Docker Compose removed
* No running containers
* No GREATER containers
* No previous deployment dependencies
* Clean Ubuntu environment available

---

## Validation Procedure

### Docker Validation

```bash
docker --version
```

Expected result:

```text
-bash: /usr/bin/docker: No such file or directory
```

### Container Validation

```bash
docker ps -a
```

Expected result:

```text
docker: command not found
```

### Server Validation

```bash
pwd
```

Expected result:

```text
/home/greaterproject
```

---

## Troubleshooting Notes

### Docker Service Refused to Stop

Observed message:

```text
Stopping 'docker.service', but its triggering units are still active:
docker.socket
```

Explanation:

This is normal behavior and does not prevent package removal.

### Docker Command Still Exists After Removal

Verify location:

```bash
which docker
```

If Docker still exists:

```bash
sudo apt purge -y docker-ce docker-ce-cli containerd.io
```

---

## Final Status

| Activity    | Status    |
| ----------- | --------- |
| Designed    | Completed |
| Implemented | Completed |
| Tested      | Completed |
| Validated   | Completed |
| Frozen      | Completed |

---

## Conclusion

The Ubuntu server was successfully cleaned and validated.

Docker, Docker Compose, and previous test containers were removed.

The server is now ready for:

* Step 01 – Ubuntu Preparation
* Docker Installation
* GREATER Installer Development
* Module 01 – Prerequisites Development

This clean environment provides a reproducible starting point for validating the GREATER Installer on a fresh Ubuntu 24.04 server.

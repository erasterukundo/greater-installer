# Step 00 – Clean Server Validation

## Purpose

Verify that development starts from a clean Ubuntu server before installing Docker, Docker Compose, or any GREATER ecosystem components.

This step establishes a reproducible baseline environment for all future installer development, testing, validation, and deployment activities.

---

## Why This Step Is Required

A clean environment ensures that installer validation is reproducible and that no previous software installations, Docker containers, or configuration files interfere with testing results.

Without this validation:

* Existing Docker installations may affect deployment behavior.
* Existing containers may occupy required ports.
* Previous GREATER deployments may influence test results.
* Documentation may become difficult to reproduce on another server.

---

## Input Files

None.

---

## Output Files

None.

---

## Commands Used

### Verify Current User Location

```bash
pwd
```

### List Existing Files and Directories

```bash
ls
```

### Check Docker Installation

```bash
docker --version
```

### Check Docker Compose Installation

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

### Remove Docker Components

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

---

## Example Outputs

### Current Working Directory

```bash
pwd
```

Example output:

```text
/home/<username>
```

### Existing Containers Before Removal

```bash
docker ps -a
```

Example output:

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

```bash
docker --version
```

Expected output:

```text
Command 'docker' not found
```

or

```text
-bash: /usr/bin/docker: No such file or directory
```

---

## Expected Results

After completing this step:

* Docker is not installed.
* Docker Compose is not installed.
* No GREATER containers exist.
* No active Docker services exist.
* No previous deployment artifacts affect testing.
* Ubuntu is ready for installer development.

---

## Validation Procedure

### Validate Docker Removal

Execute:

```bash
docker --version
```

Expected result:

```text
Command 'docker' not found
```

### Validate Docker Compose Removal

Execute:

```bash
docker compose version
```

Expected result:

```text
Command 'docker' not found
```

### Validate Server Accessibility

Execute:

```bash
pwd
```

Expected result:

```text
/home/<username>
```

### Validate User Permissions

Execute:

```bash
whoami
```

Expected result:

```text
<username>
```

---

## Troubleshooting Notes

### Docker Service Refuses to Stop

Observed message:

```text
Stopping 'docker.service', but its triggering units are still active:
docker.socket
```

Explanation:

This is normal behavior and does not prevent package removal.

### Docker Command Still Exists After Removal

Verify Docker location:

```bash
which docker
```

If Docker is still present, remove all remaining packages:

```bash
sudo apt purge -y docker-ce docker-ce-cli containerd.io
sudo apt autoremove -y
```

### Package Removal Fails

Refresh package information:

```bash
sudo apt update
```

Then repeat the removal commands.

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

1. Step 01 – Ubuntu Preparation
2. Docker Installation
3. GREATER Installer Development
4. Module 01 – Prerequisites Development

This clean environment provides a reproducible starting point for validating the GREATER Installer on a fresh Ubuntu server.

---

## Next Step

Proceed to:

```text
docs/STEP_01_UBUNTU_PREPARATION.md
```

to prepare the Ubuntu environment and install the basic utilities required for GREATER Installer development.

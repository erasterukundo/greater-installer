# Step 01 – Ubuntu Preparation

## Purpose

Prepare a clean Ubuntu server by installing the basic utilities required for GREATER Installer development, testing, troubleshooting, source code management, and future deployment activities.

This step establishes a standard development environment that can be reproduced on any Ubuntu server.

---

## Why This Step Is Required

A fresh Ubuntu installation may not include several utilities required during installer development and validation.

Installing these tools ensures that:

* Development activities are reproducible.
* Documentation examples work correctly.
* Source code can be downloaded and managed.
* System information can be collected.
* Troubleshooting activities can be performed.
* Future installer modules can execute correctly.

---

## Input Files

None.

---

## Output Files

None.

This step only installs required Ubuntu packages.

---

## Commands Used

### Verify Current Environment

```bash
pwd

whoami

ls -la
```

### Update Package Repository

```bash
sudo apt update
```

### Upgrade Existing Packages

```bash
sudo apt upgrade -y
```

### Install Required Utilities

```bash
sudo apt install -y \
tree \
curl \
wget \
git \
nano \
vim \
unzip \
zip \
htop \
net-tools \
openssh-client
```

### Verify Installed Utilities

```bash
tree --version

curl --version

wget --version

git --version

nano --version

vim --version

unzip -v

zip -v

htop --version
```

---

## Optional Development Workspace

Developers may create a dedicated workspace for development activities.

The workspace name and location are entirely user-defined.

### Recommended Approach

Create the workspace inside the current user's home directory:

```bash
cd ~

mkdir -p greater

cd greater

pwd
```

Example output:

```text
/home/username/greater
```

where:

```text
username
```

is the Linux account used for development.

### Alternative Locations

Developers may choose other locations according to institutional policies:

```text
/home/username/project
/opt/greater
/srv/greater
```

### Important Note

Creating directories directly inside:

```text
/home
```

normally requires elevated privileges.

For example:

```bash
cd /home

mkdir greater
```

may return:

```text
mkdir: cannot create directory 'greater': Permission denied
```

because `/home` is owned by the root user.

For this reason, the recommended approach is:

```bash
cd ~

mkdir -p greater
```

which creates the workspace inside the current user's home directory and does not require administrative privileges.

---

## Expected Results

All required packages should install successfully.

Verification examples:

```bash
git --version

curl --version

tree --version
```

Example output:

```text
git version 2.x.x

curl 8.x.x

tree v2.x.x
```

If a development workspace was created:

```bash
pwd
```

Expected output:

```text
/home/username/greater
```

Example:

```text
/home/greaterbk/greater
```

---

## Validation Procedure

Verify installed utilities:

```bash
git --version

curl --version

tree --version
```

Verify package installation:

```bash
which git

which curl

which tree
```

Expected:

```text
/usr/bin/git
/usr/bin/curl
/usr/bin/tree
```

Verify workspace:

```bash
cd ~/greater

pwd
```

Expected:

```text
/home/username/greater
```

---

## Troubleshooting Notes

### Package Installation Interrupted

```bash
sudo dpkg --configure -a
```

Then:

```bash
sudo apt update

sudo apt upgrade -y
```

---

### Package Repository Error

```bash
sudo apt clean

sudo apt update
```

---

### Command Not Found After Installation

Verify installation:

```bash
which git

which curl

which tree
```

Reinstall if necessary:

```bash
sudo apt install --reinstall git curl tree
```

---

## Commands Executed During Validation

```bash
pwd

whoami

ls -la

sudo apt update

sudo apt upgrade -y

sudo apt install -y \
tree \
curl \
wget \
git \
nano \
vim \
unzip \
zip \
htop \
net-tools \
openssh-client

git --version

curl --version

tree --version

which git

which curl

which tree

cd ~

mkdir -p greater

cd greater

pwd
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

The Ubuntu server has been prepared with the utilities required for GREATER Installer development and validation.

The system is now ready for:

* Docker Installation
* Docker Compose Installation
* Source Code Management with Git
* GREATER Installer Development
* Module 01 – Prerequisites Development

Any development workspace may be created according to local institutional requirements and administrator preferences.

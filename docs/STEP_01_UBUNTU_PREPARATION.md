# Step 01 – Ubuntu Preparation

## Purpose

Prepare a clean Ubuntu server by installing the basic utilities required for GREATER Installer development, testing, troubleshooting, and source code management.

This step establishes a standard development environment that will be used throughout the implementation of the GREATER Installer.

---

## Why This Step Is Required

A fresh Ubuntu installation does not always include the utilities required during installer development.

Installing these tools ensures that:

* Development activities are reproducible.
* Documentation commands work consistently.
* Source code can be downloaded and managed.
* Troubleshooting information can be collected.
* Future installer modules can execute correctly.

---

## Input Files

None.

---

## Output Files

None.

The step only installs required Ubuntu packages.

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

### Create GREATER Development Workspace

```bash
cd ~

mkdir -p greaterproject

cd greaterproject

pwd
```

---

## Expected Results

All required packages should install successfully.

The following directory should exist:

```text
/home/greaterbk/greaterproject
```

Verification command:

```bash
pwd
```

Expected output:

```text
/home/greaterbk/greaterproject
```

---

## Validation Procedure

Verify installed packages:

```bash
git --version

curl --version

tree --version
```

Verify workspace:

```bash
cd ~/greaterproject

pwd
```

Expected:

```text
/home/greaterbk/greaterproject
```

---

## Troubleshooting Notes

### Package Installation Interrupted

Run:

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

Run:

```bash
sudo apt clean

sudo apt update
```

---

### Command Not Found After Installation

Check package installation:

```bash
which git

which curl

which tree
```

If necessary reinstall:

```bash
sudo apt install --reinstall tree git curl
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

tree --version

git --version

curl --version

mkdir -p ~/greaterproject

cd ~/greaterproject

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

The Ubuntu server has been prepared with all utilities required for GREATER Installer development.

A dedicated development workspace named:

```text
greaterproject
```

has been created to host all installer source code, configuration files, generated artifacts, and validation activities.

The server is now ready for:

* Docker Installation
* Docker Compose Installation
* Git Repository Cloning
* GREATER Installer Development
* Module 01 – Prerequisites Development


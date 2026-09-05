# Go Web Application

This is a simple website written in Golang. It uses the `net/http` package to serve HTTP requests.

---

## Prerequisites

Before running this project, you need **Go (Golang)** installed on your system. Follow the instructions for your environment below.

### 1. Linux — CentOS / RHEL / Amazon Linux

```bash
# Update packages
sudo yum update -y

# Install Go from the official tarball (recommended — gets the latest version)
curl -LO https://go.dev/dl/go1.24.0.linux-amd64.tar.gz
sudo rm -rf /usr/local/go
sudo tar -C /usr/local -xzf go1.24.0.linux-amd64.tar.gz

# Add Go to PATH
echo 'export PATH=$PATH:/usr/local/go/bin' >> ~/.bashrc
source ~/.bashrc

# Verify
go version
```

> On an ARM instance (e.g. AWS Graviton), replace `linux-amd64` with `linux-arm64` in the URL. Check your architecture with `uname -m` (`x86_64` = amd64, `aarch64` = arm64).

### 2. Linux — Ubuntu / Debian

```bash
sudo apt update
sudo apt install golang-go -y

# Verify
go version
```

> The apt package may lag behind the latest release. For the newest version, use the tarball method shown in the CentOS section above.

### 3. Windows (local machine)

1. Download the Windows installer (`.msi`) from https://go.dev/dl
2. Run the installer and click through it. It installs Go to `C:\Program Files\Go` and adds it to your `PATH` automatically.
3. **Open a new terminal** (PowerShell or CMD) — PATH changes only apply to newly opened terminals.
4. Verify:

```powershell
go version
```

You should see output like `go version go1.24.0 windows/amd64`.

> Always check https://go.dev/dl for the current version number and update the download URL accordingly.

---

## Running the Project

Once Go is installed, clone the repository and run the server.

```bash
# Clone the repo
git clone https://github.com/prasna-ops/Golang_Project.git
cd Golang_Project

# Download dependencies (if any)
go mod download
```

### Run directly (development)

```bash
go run main.go
```

### Or build a binary and run it

```bash
# Linux / macOS
go build -o main .
./main

# Windows
go build -o main.exe .
.\main.exe
```

The server will start on port **8080**. Access it at `http://localhost:8080/courses` in your web browser.

---

## Deploying on AWS EC2 (from scratch)

Follow these steps to run the application on a fresh EC2 instance and expose it to the internet.

### Step 1 — Launch an EC2 instance

- Launch an instance (Amazon Linux, CentOS, or Ubuntu) from the AWS Console.
- Choose or create a **key pair** so you can SSH in.
- Note the instance's **Public IPv4 address**.

### Step 2 — Connect to the instance

```bash
ssh -i /path/to/your-key.pem ec2-user@<EC2_PUBLIC_IP>
```

> Use `ec2-user` for Amazon Linux/CentOS, or `ubuntu` for Ubuntu instances.

### Step 3 — Install Go and Git

```bash
# Amazon Linux / CentOS
sudo yum install git -y

# Ubuntu
# sudo apt update && sudo apt install git -y
```

Then install Go using the tarball method from the **Prerequisites** section above, and verify with `go version`.

### Step 4 — Clone and run the application

```bash
git clone https://github.com/prasna-ops/Golang_Project.git
cd Golang_Project
go build -o main .
./main
```

The app is now listening on port 8080 **inside** the instance — but it's not reachable from outside yet. That's the next step.

### Step 5 — Open port 8080 in the Security Group (the critical step)

By default, EC2 blocks inbound traffic. You must allow port 8080:

1. In the AWS Console, go to **EC2 → Instances** and select your instance.
2. Open the **Security** tab → click the **Security Group**.
3. Choose **Edit inbound rules → Add rule**:
   - **Type:** Custom TCP
   - **Port range:** `8080`
   - **Source:** `0.0.0.0/0` (anyone) — or your own IP for a more secure setup
4. **Save rules.**

### Step 6 — Access the application

Open in your browser:



> **Tip:** Running `./main` stops when you close the SSH session. To keep it running in the background, use `nohup ./main &`, or set it up as a `systemd` service for production.

---

## Looks like this

![Website](static/images/golang-website.png)
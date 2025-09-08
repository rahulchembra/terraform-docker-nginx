# 🚀 Terraform + Docker: Nginx Container Demo

This project demonstrates using **Terraform** with the **Docker provider** to provision a local Nginx container on Ubuntu.  
The container is exposed on [http://localhost:8080](http://localhost:8080) and execution logs are saved for each Terraform step.

---

## 📌 Features
- Automates Docker container provisioning with Terraform
- Pulls lightweight `nginx:alpine` image
- Creates a dedicated Docker network
- Maps **host port 8080 → container port 80**
- Sets environment variables (e.g., timezone)
- Configures restart policy (`unless-stopped`)
- Saves logs for every Terraform step

---

## 🗂️ Project Structure
```
tf-docker-demo/
├── screenshots/ 
├── main.tf                  # Terraform configuration
├── logs/                    # Execution logs
│   ├── 01_init.log
│   ├── 02_validate.log
│   ├── 03_plan.log
│   ├── 04_apply.log
│   ├── 05_state_container.log
│   ├── 06_show_full_state.log
│   └── 07_destroy.log
└──README.md
```
---

## ⚡ Prerequisites
- Ubuntu with Docker installed and running  
- Terraform **v1.5+**  
- User added to the `docker` group (to run Docker without `sudo`)  

Quick check:
docker --version
terraform -version
systemctl is-active docker

---

## 📑 Deliverables
- `main.tf` – Terraform configuration  
- `logs/` – Execution logs from Terraform runs  
- `README.md` – Project documentation  

---

👨‍💻 Author: *Rahul C*  


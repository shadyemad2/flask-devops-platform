# 🚀 Flask DevOps Platform

![Overview](images/overview.png)

A full-stack DevOps project featuring a Flask backend and static frontend, built with Docker and GitHub Actions for CI/CD, includes an AWS S3 restore script, Terraform infrastructure provisioning, and Kubernetes manifests (optional).

---

## 📸 Screenshots

### 🖥️ Frontend&Backend
<img width="709" height="588" alt="frontend backend" src="https://github.com/user-attachments/assets/429088b0-e21d-44b1-9789-7389bbce234b" />

### Backup To S3
<img width="1427" height="696" alt="bucket" src="https://github.com/user-attachments/assets/a29c7e2e-0ef9-4942-9539-c76065c60676" />

### ♻️ Restore Script in Action  
<img width="1002" height="333" alt="restore-script" src="https://github.com/user-attachments/assets/2df14765-475a-4fc3-8ba2-0578690e6403" />

### 🤖 GitHub Actions Workflow  
<img width="1905" height="747" alt="githup-actions" src="https://github.com/user-attachments/assets/b06dbfea-8f8e-47f2-9425-53df4a2252b9" />


> 📂 Place all screenshots in a folder named `images/` at the root of the repository.

---

## 🧾 Project Structure

```
.
├── backend/                  # Flask backend (Dockerized)
│   ├── app.py
│   ├── Dockerfile
│   ├── data.json
│   └── requirements.txt
├── frontend/                 # Static frontend (Dockerized)
│   ├── index.html
│   └── Dockerfile
├── .github/workflows/        # GitHub Actions CI/CD pipeline
│   └── deploy.yml
├── terraform/                # Infrastructure as Code (Terraform)
│   ├── main.tf
│   ├── backend.tf
│   ├── provider.tf
│   └── .terraform.lock.hcl
├── k8s/                      # Kubernetes manifests (optional)
│   ├── backend-deployment.yaml
│   ├── frontend-deployment.yaml
│   └── ingress.yaml
├── s3-restore-script/        # AWS S3 restore utility
│   ├── .env
│   ├── restore-backup.sh
│   └── restored_backup.json
├── images/                   # Project screenshots (not included in code)
└── README.md
```

---

## ✅ Features

- ✅ Flask backend with data served from `data.json`
- ✅ Static HTML frontend
- ✅ Dockerized backend and frontend
- ✅ GitHub Actions for CI/CD pipeline
- ✅ AWS S3 restore script
- ✅ Infrastructure as Code via Terraform
- ✅ Kubernetes manifests 

---

## 🔁 CI/CD Pipeline

GitHub Actions Workflow:
- Triggered on `push` to `main` or manual dispatch
- Builds Docker images for backend and frontend
- Pushes to DockerHub

```yaml
docker build -t shadyemad/flask-devops-platform-backend ./backend
docker build -t shadyemad/flask-devops-platform-frontend ./frontend
docker push shadyemad/flask-devops-platform-backend
docker push shadyemad/flask-devops-platform-frontend
```

> 🚫 Kubeconfig and Kubernetes deployment steps were removed for simplicity

---

## ☁️ AWS S3 Restore Script

Shell script to restore `data.json` backup from AWS S3.

**Run:**

```bash
cd s3-restore-script
bash restore-backup.sh
```

**Configure `.env`:**

```env
AWS_ACCESS_KEY_ID=your_access_key
AWS_SECRET_ACCESS_KEY=your_secret_key
S3_BUCKET_NAME=your_bucket_name
```

---

## 🐳 Docker Images

| Component | DockerHub Repo |
|-----------|----------------|
| Backend   | `shadyemad/flask-devops-platform-backend` |
| Frontend  | `shadyemad/flask-devops-platform-frontend` |

---

## 🔐 GitHub Secrets

| Secret Name           | Description              |
|------------------------|--------------------------|
| `DOCKERHUB_USERNAME`   | Your DockerHub username  |
| `DOCKERHUB_TOKEN`      | DockerHub PAT/token      |

---

## 🛠️ Terraform Usage

```bash
cd terraform
terraform init
terraform apply
```

Creates infrastructure as defined in `main.tf`, `provider.tf`, and `backend.tf`.

---

## ☸️ Kubernetes 

Use the manifests in `k8s/` if you want to deploy manually to a cluster.

```bash
kubectl apply -f k8s/
```

> 🧪 Kubernetes deployment is not handled in the current CI/CD workflow.

---

## 👤 Author

**Shady Emad Wahib Farhat**   
🔗 GitHub: [shadyemad2](https://github.com/shadyemad2)

---

## 📌 Project Status

- ✅ Working CI/CD via GitHub Actions
- ✅ Verified AWS S3 Restore
- ✅ Docker builds and image publishing
- ✅ Kubernetes manifests present (manual)
- ✅ Infrastructure via Terraform

---



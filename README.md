# Flask DevOps Platform 🚀

A full-stack DevOps-ready application built with:

- 🐍 **Flask** backend with AWS S3 integration (for storing backups)
- 🌐 **Frontend** with static HTML & JS
- 🐳 **Dockerized** components for both frontend and backend
- ☸️ **Kubernetes** deployments for scalable container orchestration
- ☁️ **AWS S3** as a storage backend
- ⚙️ **Terraform** to provision S3 and IAM resources
- 🔄 **GitHub Actions** CI/CD pipeline for build, push, and deployment
- 📦 Optional: `restore-backup.sh` script to pull backup data from S3

---

## 📁 Project Structure

```
flask-devops-platform/
├── backend/                 # Flask backend app with boto3 + S3
├── frontend/                # Static frontend with HTML/JS
├── k8s/                     # Kubernetes deployment & ingress YAMLs
├── terraform/               # Terraform scripts to provision AWS S3 and IAM
├── .github/workflows/       # GitHub Actions CI/CD workflows
├── restore-backup.sh        # Shell script to restore S3 backup locally
└── README.md
```

---

## ⚙️ Prerequisites

- AWS account with S3 access
- Docker & Docker Hub account
- Kubernetes cluster (Minikube, K3s, or EKS)
- Terraform installed
- GitHub repository with secrets set up

---

## 🚀 How to Run Locally (Optional)

```bash
# Run backend
cd backend
docker build -t flask-backend .
docker run -p 5000:5000 flask-backend

# Run frontend
cd ../frontend
docker build -t flask-frontend .
docker run -p 8080:80 flask-frontend
```

---

## ☸️ Kubernetes Deployment

```bash
kubectl apply -f k8s/
```

Make sure to set up:
- Kubernetes secret for AWS credentials (`aws-secret`)
- NGINX ingress controller
- DNS entry for `flask.local` if needed

---

## 📦 S3 Restore Script

```bash
chmod +x restore-backup.sh
./restore-backup.sh
```

Make sure to export your AWS credentials before running.

---

## 🔄 CI/CD with GitHub Actions

Every push to `main` branch will:

- Build backend and frontend Docker images
- Push them to Docker Hub
- Restart deployments on your Kubernetes cluster
- Send a Slack alert (if webhook is configured)

---

## 🔐 GitHub Secrets Required

| Secret Name          | Purpose                          |
|----------------------|----------------------------------|
| DOCKERHUB_USERNAME   | Your Docker Hub username         |
| DOCKERHUB_TOKEN      | Docker Hub access token          |
| SLACK_WEBHOOK_URL    | Slack webhook for notifications  |
| KUBECONFIG_DATA      | Base64-encoded kubeconfig file   |

---

## 📬 Contact

Made with 💻 by [Shady Emad](https://github.com/shadyemad2)

---



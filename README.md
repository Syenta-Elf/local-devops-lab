# 🏗️ local-devops-lab

A local Infrastructure as Code lab built with Terraform and Docker — designed to practice real-world DevOps workflows without cloud costs.

---

## 📐 Architecture

```
┌─────────────────────────────────────────┐
│            Terraform (IaC)              │
│                                         │
│  ┌─────────────┐   ┌─────────────────┐  │
│  │ root module │──▶│  modules/nginx  │  │
│  └─────────────┘   └─────────────────┘  │
│         │                               │
│         ▼                               │
│  ┌─────────────────────────────────┐    │
│  │         Docker Engine           │    │
│  │  ┌───────┐ ┌───────┐ ┌───────┐  │    │
│  │  │ web-1 │ │ web-2 │ │ web-n │  │    │
│  │  │ :9081 │ │ :9082 │ │ :908n │  │    │
│  │  └───────┘ └───────┘ └───────┘  │    │
│  └─────────────────────────────────┘    │
└─────────────────────────────────────────┘

State: GitLab HTTP Backend (Remote)
```

---

## 🛠️ Tech Stack

| Tool      | Purpose                |
| --------- | ---------------------- |
| Terraform | Infrastructure as Code |
| Docker    | Container runtime      |
| GitLab    | Remote state backend   |
| Nginx     | Sample workload        |

---

## 🚀 Getting Started

### Prerequisites

- [Terraform](https://developer.hashicorp.com/terraform/install) >= 1.5
- [Docker Desktop](https://www.docker.com/products/docker-desktop/)
- GitLab account (for remote state)

### Setup

**1. Clone the repo**

```bash
git clone https://github.com/Syenta-Elf/local-devops-lab.git
cd local-devops-lab
```

**2. Set your GitLab token**

```bash
export TF_HTTP_PASSWORD="your-gitlab-token"
```

**3. Initialize Terraform**

```bash
terraform init
```

**4. Preview the plan**

```bash
terraform plan
```

**5. Apply**

```bash
terraform apply
```

**6. Verify**

```bash
curl localhost:9081
curl localhost:9082
```

### Teardown

```bash
terraform destroy
```

---

## 📁 Project Structure

```
local-devops-lab/
├── main.tf               # Root module — calls child modules
├── providers.tf          # Provider & remote backend config
├── .gitignore            # Excludes .env, state files, .terraform/
└── modules/
    └── nginx/
        ├── main.tf       # Docker image + container resources
        ├── variables.tf  # Input variables (no defaults — passed from root)
        ├── outputs.tf    # Container IDs output
        └── providers.tf  # Provider requirements
```

---

## 💡 Key Concepts Practiced

- **Terraform modules** — reusable, composable infrastructure blocks
- **Remote state** — GitLab HTTP backend for team-safe state management
- **for_each with map(string)** — dynamic multi-container provisioning
- **State vs config drift** — understanding when Terraform replaces resources
- **Secret management** — keeping tokens out of version control via env vars

---

## 🗺️ Roadmap

- [x] Add Ansible provisioning on Lima VMs
- [x] GitHub Actions CI/CD pipeline
- [x] Prometheus + Grafana monitoring stack
- [x] Multi-environment support (dev / staging)

---

## 📜 License

MIT

````markdown
# MicroK8s Terraform Deployment on AWS

This repository contains Terraform configurations to deploy MicroK8s on an AWS EC2 instance. The setup includes the installation of MicroK8s, Kubernetes configuration, and an example deployment of an `nginx` service.

## Getting Started

### 1. Fork and Clone the Repository

First, fork this repository to your GitHub account. Then, clone it locally:

```bash
git clone git@github.com:jvsocial/tf-microk8s-on-aws.git
cd tf-microk8s-on-aws
```
````

### 2. Create a `terraform.tfvars` File

In the root of the cloned repository, create a `terraform.tfvars` file to provide necessary variables for the Terraform configuration. Add your values for required variables, for example:

```hcl
aws_access_key = "YOUR_AWS_ACCESS_KEY"
aws_secret_key = "YOUR_AWS_SECRET_KEY"
aws_region     = "YOUR_AWS_REGION"
```

Make sure **not to commit** `terraform.tfvars` if it contains sensitive information.

### 3. Deploy with Terraform

Initialize and apply the Terraform configuration:

```bash
terraform init
terraform apply
```

Type `yes` to confirm and apply the changes. The Terraform script will create a **free-tier-eligible t2.micro EC2 instance** with MicroK8s installed.

> **Note:** The `t2.micro` instance type has limited resources (1 vCPU, 1GB RAM) and may struggle with workloads requiring higher CPU or memory. Scaling beyond minimal services may not work well on this instance type.

### 4. Wait for MicroK8s Initialization

Once the EC2 instance is up, wait approximately **5 minutes** to ensure MicroK8s has fully initialized.

### 5. Access and Configure MicroK8s

After the wait time, use **AWS EC2 Instance Connect (Web Connect)** to access the EC2 instance. In your AWS Console:

1. Go to **EC2 Dashboard** > **Instances**.
2. Select the newly created instance.
3. Click **Connect** > **EC2 Instance Connect** > **Connect**.

Once connected, run the following commands to interact with MicroK8s:

```bash
# Check node status
sudo microk8s kubectl get nodes

# Check available services
sudo microk8s kubectl get services

# Scale the nginx deployment to 2 replicas (may be limited by instance capacity)
sudo microk8s kubectl scale deployment nginx --replicas=2

# Verify the nginx pods
sudo microk8s kubectl get pods
```

### Additional Information

- **Scaling Limitations:** Due to the limited resources of `t2.micro`, scaling workloads may not perform optimally, and Kubernetes pods may fail to deploy or may enter a pending state.
- **Destroy Resources**: To remove all resources, use `terraform destroy` in the project directory.

This completes the setup for deploying MicroK8s on AWS using Terraform. Enjoy working with Kubernetes on your EC2 instance!

```

```

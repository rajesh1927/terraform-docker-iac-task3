# Task 3 – Infrastructure as Code with Terraform

## Objective

Provision a local Docker container using Terraform and understand the basic Infrastructure as Code (IaC) workflow.

## Tools Used

- Terraform
- Docker
- Docker Provider for Terraform
- Nginx
- Git
- GitHub

## Project Overview

This project demonstrates how Terraform can be used to provision and manage a Docker container locally.

Terraform creates:

1. An Nginx Docker image
2. An Nginx Docker container
3. A port mapping from host port `8080` to container port `80`

The application can be accessed at:

```text
http://localhost:8080
```

## Project Structure

```text
terraform-docker-iac-task3/
│
├── README.md
├── main.tf
├── variables.tf
├── outputs.tf
├── .gitignore
│
├── logs/
│   ├── terraform-init.txt
│   ├── terraform-plan.txt
│   ├── terraform-apply.txt
│   ├── terraform-state.txt
│   └── terraform-destroy.txt
│
└── screenshots/
    ├── docker-container.png
    ├── terraform-plan.png
    └── terraform-state.png
```

## Terraform Configuration

The Docker provider is configured in `main.tf`.

The following resources are created:

```text
docker_image.nginx
docker_container.nginx
```

The container exposes:

```text
Host:      8080
Container: 80
```

## Prerequisites

Install the following:

```bash
terraform --version
docker --version
```

Make sure Docker is running:

```bash
docker ps
```

## Step 1 – Initialize Terraform

Run:

```bash
terraform init
```

This downloads and initializes the required Docker provider.

## Step 2 – Format Terraform Code

Run:

```bash
terraform fmt
```

This formats the Terraform configuration files.

## Step 3 – Validate Configuration

Run:

```bash
terraform validate
```

Expected result:

```text
Success! The configuration is valid.
```

## Step 4 – Create Terraform Plan

Before applying the infrastructure, generate a plan:

```bash
terraform plan
```

Expected result:

```text
Plan: 2 to add, 0 to change, 0 to destroy.
```

The plan shows what Terraform intends to create, modify, or destroy.

## Step 5 – Apply Infrastructure

Run:

```bash
terraform apply
```

Enter:

```text
yes
```

Terraform will create the Docker image and container.

Expected result:

```text
Apply complete! Resources: 2 added, 0 changed, 0 destroyed.
```

## Step 6 – Check Docker Container

Run:

```bash
docker ps
```

The container should appear with the name:

```text
terraform-nginx
```

## Step 7 – Test Nginx

Open:

```text
http://localhost:8080
```

The Nginx welcome page should be displayed.

You can also test from the terminal:

```bash
curl http://localhost:8080
```

## Step 8 – Check Terraform State

List the resources managed by Terraform:

```bash
terraform state list
```

Expected:

```text
docker_container.nginx
docker_image.nginx
```

Inspect the container resource:

```bash
terraform state show docker_container.nginx
```

Terraform uses its state to track the infrastructure it manages.

## Step 9 – Destroy Infrastructure

When testing is complete, destroy the infrastructure:

```bash
terraform destroy
```

Enter:

```text
yes
```

Expected:

```text
Destroy complete! Resources: 2 destroyed.
```

Verify:

```bash
docker ps
```

The Terraform-managed Nginx container should no longer be running.

# Terraform Workflow

```text
Write Terraform Code
        |
        v
terraform init
        |
        v
terraform fmt
        |
        v
terraform validate
        |
        v
terraform plan
        |
        v
terraform apply
        |
        v
Docker Container
        |
        v
terraform state
        |
        v
terraform destroy
```

# Execution Commands

The following commands were used during the task:

```bash
terraform init
terraform fmt
terraform validate
terraform plan
terraform apply
docker ps
curl http://localhost:8080
terraform state list
terraform state show docker_container.nginx
terraform destroy
```
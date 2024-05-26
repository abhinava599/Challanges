# azure-Three-Tier-terraform 🚀

Welcome to azure-terraform! This repository contains Terraform configurations to deploy a three tier architecture on the Azure cloud platform.

## Folder Structure 📁

```
azure-todo-app-terraform/
│
├── modules/           # Contains reusable Terraform modules
│   ├── <module1>/
│   ├── <module2>/
│   └── ...
│
├── scripts/           # Contains scripts for automation or deployment
│   ├── <script1>.sh
│   ├── <script2>.py
│   └── ...
│
└── environment/       # Contains environment-specific Terraform configurations
    ├── dev/
    ├── prod/
    └── ...
```

## Getting Started 🏁

To get started with deploying Three tier architecutre infra

1. **Clone the Repository**: 
   ```
   git clone "" 
   ```

2. **Navigate to the Directory**:
   ```
   cd challenge1
   ```

3. **Set Up Azure Credentials**:
   Ensure you have Azure credentials set up with appropriate permissions for Terraform to deploy resources.

4. **Customize Configuration**:
   Modify the Terraform configurations (`*.tf` files) in the `environment/` directory as needed to match your requirements.

5. **Initialize Terraform**:
   ```
   terraform init
   ```

6. **Preview Changes**:
   ```
   terraform plan
   ```

7. **Apply Changes**:
   ```
   terraform apply
   ```


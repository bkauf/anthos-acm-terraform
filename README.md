# anthos-acm-terraform

### Setup ACM via Terraform

Edit the terraform.tfvars file and enter the cluster and ACM information

```sh
gcp_project_id = "project_ID"
cluster_name = "cluster_name"
repo_structure = "hierarchy"
```

#### Launch The Terraform
```sh
terraform init
terraform apply
```

#### 
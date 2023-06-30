terraform {
  cloud {
    organization = "kmccorp-tfc"

    workspaces {
      name = "ACK-Cluster-Terraform-cli"
    }
  }

  
}
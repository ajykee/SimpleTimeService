variable "aws_region" {
  description = "AWS region to deploy to"
  default     = "us-east-1"
}

variable "cluster_name" {
  description = "Name of the EKS Cluster"
  default     = "simpletimesvc-eks"
}

variable "container_image" {
  description = "Docker image for the app"
  type        = string
}
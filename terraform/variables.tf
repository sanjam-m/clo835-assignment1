variable "instance_type" {
  default     = "t3.micro"
  description = "Type of the instance"
  type        = string
}

variable "env" {
  default     = "dev"
  type        = string
  description = "Deployment Environment"
}

variable "ecr_repos" {
  default     = ["cats", "dogs"]
  type        = set(string)
  description = "Amazon ECR Repository names"
}

variable "service_ports" {
  default     = ["22", "8080", "8081"]
  type        = list(string)
  description = "Ports that should be open on the host machine"
}
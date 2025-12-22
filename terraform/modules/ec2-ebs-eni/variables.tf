variable name {
  type        = string
}

variable ami_id {
  type        = string
  default     = "ami-068c0051b15cdb816"
}

variable instance_type {
  type        = string
  default     = "t3.micro"
}

variable subnet_id {
  type        = string
}

variable security_group_ids {
  type        = list(string)
}

variable key_name {
  type        = string
}

variable ebs_size_gb {
  type        = number
}

variable ebs_type {
  type        = string
  default     = "gp3"
}

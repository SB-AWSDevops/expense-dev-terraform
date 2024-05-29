variable "project_name"{
    default = "expense"
}

variable "env"{
    default = "dev"
}

variable "common_tags"{
    default = {
        Project = "expense"
        Env = "dev"
        Terraform = "true"
    }
}

variable "db_sg_description"{
    default = "Security Group for DB MYSQL Instances"
}

variable "backend_sg_description"{
     default = "Security Group for Backend Instances"
}
variable "frontend_sg_description"{
     default = "Security Group for Frontend Instances"
}
variable "bastion_sg_description"{
     default = "Security Group for Bastion Instances"
}
variable "ansible_sg_description"{
     default = "Security Group for Ansible Instances"
}

variable "sg_name"{
    default = "db"
}

variable "sg_tags"{
    default = {
        Name = "sg"
    }
}
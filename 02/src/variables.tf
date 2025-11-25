###cloud vars


variable "cloud_id" {
  type        = string
  description = "https://cloud.yandex.ru/docs/resource-manager/operations/cloud/get-id"
  default = "b1gfdkrcnb9k4fcvsh0s"
}

variable "folder_id" {
  type        = string
  description = "https://cloud.yandex.ru/docs/resource-manager/operations/folder/get-id"
  default = "b1gfdkrcnb9k4fcvsh0s"
}

variable "default_zone" {
  type        = string
  default     = "ru-central1-a"
  description = "https://cloud.yandex.ru/docs/overview/concepts/geo-scope"
}

variable "second_zone" {
  type        = string
  default     = "ru-central1-b"
  description = "https://cloud.yandex.ru/docs/overview/concepts/geo-scope"
}
variable "subnet_first_cidr" {
  type        = list(string)
  default     = ["10.0.1.0/24"]
  description = "https://cloud.yandex.ru/docs/vpc/operations/subnet-create"
}

variable "subnet_second_cidr" {
  type        = list(string)
  default     = ["10.0.2.0/24"]
  description = "https://cloud.yandex.ru/docs/vpc/operations/subnet-create"
}

variable "vpc_name" {
  type        = string
  default     = "develop"
  description = "VPC network & subnet name"
}

variable "subnet_second_name" {
  type        = string
  default     = "develop_bd"
  description = "subnet 2 name"
}

variable "subnet1_fist_name" {
  type        = string
  default     = "develop"
  description = "subnet 1 name"
}


###ssh vars

#variable "vms_ssh_root_key" {
#  type        = string
#  default     = "~/.ssh/id_rsa.pub"
#  description = "ssh-keygen -t ed25519"
#}

variable "vm_web_account_key_file" {
  type    = string
  default = "/home/funundead/Рабочий стол/ssh_key_cloud_yandex/authorized_key.json"
}

variable "vms_resources" {
  type = map(object({
    cores         = number
    memory        = number
    core_fraction = number
  }))
  default = {
    web = {
      cores         = 2
      memory        = 1
      core_fraction = 5
    }
    db = {
      cores         = 2
      memory        = 2
      core_fraction = 20
    }
  }
}

variable "vms_metadata" {
  type = map(object({
    serial-port-enable = number
    ssh-keys = string
  }))
  default = {
    default = {
        serial-port-enable = 1
        ssh-keys           = "~/.ssh/id_rsa.pub"
    }
  }
}
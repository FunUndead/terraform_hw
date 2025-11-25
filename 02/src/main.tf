resource "yandex_vpc_network" "develop" {
  name = var.vpc_name
}
resource "yandex_vpc_subnet" "develop" {
  name           = var.subnet1_fist_name
  zone           = var.default_zone
  network_id     = yandex_vpc_network.develop.id
  v4_cidr_blocks = var.subnet_first_cidr
}


data "yandex_compute_image" "ubuntu" {
  family = var.vm_web_image
}
resource "yandex_compute_instance" "platform" {
  name        = local.platform_name
  platform_id = var.vm_yandex_patform

  allow_stopping_for_update = true
  resources {
    cores         = var.vms_resources.web.cores
    memory        = var.vms_resources.web.memory
    core_fraction = var.vms_resources.web.core_fraction
  }
  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.ubuntu.image_id
    }
  }
  scheduling_policy {
    preemptible = true
  }
  network_interface {
    subnet_id = yandex_vpc_subnet.develop.id
    nat       = true
  }

  metadata = {
    serial-port-enable = var.vms_metadata.default.serial-port-enable
    ssh-keys           = local.vms_ssh_root_key_ubuntu
  }

}

resource "yandex_vpc_subnet" "subnet2" {
  name           = var.subnet_second_name
  zone           = var.second_zone
  network_id     = yandex_vpc_network.develop.id
  v4_cidr_blocks = var.subnet_second_cidr
}

resource "yandex_compute_instance" "platform_db" {
  name        = local.platform_db_name
  platform_id = var.vm_yandex_patform
  zone        = var.second_zone

  allow_stopping_for_update = true
  resources {
    cores         = var.vms_resources.db.cores
    memory        = var.vms_resources.db.memory
    core_fraction = var.vms_resources.db.core_fraction
  }
  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.ubuntu.image_id
    }
  }
  scheduling_policy {
    preemptible = true
  }
  network_interface {
    subnet_id = yandex_vpc_subnet.subnet2.id
    nat       = true
  }

  metadata = {
    serial-port-enable = var.vms_metadata.default.serial-port-enable
    ssh-keys           = local.vms_ssh_root_key_ubuntu
  }



}
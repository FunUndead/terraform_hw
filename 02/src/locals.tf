locals {
  platform_name = "${var.vm_web_image}-${var.vm_web_name}"
  vms_ssh_root_key_ubuntu = "ubuntu:${var.vms_metadata.default.ssh-keys}}"
  platform_db_name = "${var.vm_web_image}-${var.vm_db_name}"
}
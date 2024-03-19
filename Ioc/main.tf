terraform {
  required_version = "1.5.7"

  required_providers {
    yandex = {
      source  = "yandex-cloud/yandex"
      version = "0.112.0"
    }
  }

  backend "s3" {
    endpoint   = "storage.yandexcloud.net"
    bucket     = "tf-state-bucket"
    region     = "ru-central1-a"
    key        = "lemp.tfstate"
    access_key = ""
    secret_key = ""

    skip_region_validation      = true
    skip_credentials_validation = true
  }

}

# Документация к провайдеру тут https://registry.terraform.io/providers/yandex-cloud/yandex/latest/docs#configuration-reference
# Настраиваем the Yandex.Cloud provider
provider "yandex" {
  service_account_key_file = file("sa.json")
  cloud_id                 = "b1gplktasqvig8ni6vo5"
  folder_id                = var.folder_id
  zone                     = "ru-central1-a"
}

resource "yandex_vpc_network" "terraform-network" {
  name      = "terraform-network"
  folder_id = var.folder_id
}

resource "yandex_vpc_subnet" "subnet1" {
  name           = "subnet1"
  zone           = "ru-central1-a"
  network_id     = yandex_vpc_network.terraform-network.id
  folder_id      = var.folder_id
  v4_cidr_blocks = ["192.168.0.0/24"]
}

resource "yandex_vpc_subnet" "subnet2" {
  name           = "subnet2"
  zone           = "ru-central1-b"
  network_id     = yandex_vpc_network.terraform-network.id
  folder_id      = var.folder_id
  v4_cidr_blocks = ["192.168.1.0/24"]
}

module "compute_instance_1" {
  source        = "./modules/compute_instance"
  family_image  = "lemp"
  vpc_subnet_id = yandex_vpc_subnet.subnet1.id
  zone          = yandex_vpc_subnet.subnet1.zone
}

module "compute_instance_2" {
  source        = "./modules/compute_instance"
  family_image  = "lamp"
  vpc_subnet_id = yandex_vpc_subnet.subnet2.id
  zone          = yandex_vpc_subnet.subnet2.zone
}

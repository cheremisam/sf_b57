terraform {
  required_version = "1.5.7"

  required_providers {
    yandex = {
      source  = "yandex-cloud/yandex"
      version = "0.112.0" # Фиксируем версию провайдера
    }
  }
}

# Документация к провайдеру тут https://registry.terraform.io/providers/yandex-cloud/yandex/latest/docs#configuration-reference
# Настраиваем the Yandex.Cloud provider
provider "yandex" {
  service_account_key_file = file("sa.json")
  cloud_id                 = "b1gplktasqvig8ni6vo5"
  folder_id                = var.folder_id
  zone                     = var.zone # зона, которая будет использована по умолчанию
}

resource "yandex_iam_service_account" "sa" {
  folder_id = var.folder_id
  name      = "sa-skillfactory"
}

# Даем права на запись для этого SA
resource "yandex_resourcemanager_folder_iam_member" "sa-editor" {
  folder_id = var.folder_id
  role      = "storage.editor"
  member    = "serviceAccount:${yandex_iam_service_account.sa.id}"
}

# Создаем ключи доступа Static Access Keys
resource "yandex_iam_service_account_static_access_key" "sa-static-key" {
  service_account_id = yandex_iam_service_account.sa.id
  description        = "static access key for object storage"
}

# Создаем хранилище
resource "yandex_storage_bucket" "state" {
  bucket     = "tf-state-bucket"
  access_key = yandex_iam_service_account_static_access_key.sa-static-key.access_key
  secret_key = yandex_iam_service_account_static_access_key.sa-static-key.secret_key
}
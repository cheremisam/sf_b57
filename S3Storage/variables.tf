variable "zone" {                                # Используем переменную для передачи в конфиг инфраструктуры
  description = "Use specific availability zone" # Опционально описание переменной
  type        = string                           # Опционально тип переменной
  default     = "ru-central1-a"                  # Опционально значение по умолчанию для переменной
}

variable "folder_id" {
  description = "Folder id"
  type        = string
  default     = "b1gulh65eku8gtil8j4u"
}
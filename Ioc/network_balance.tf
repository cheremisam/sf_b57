resource "yandex_lb_target_group" "web_servers" {
  name      = "web-servers"
  region_id = "ru-central1"

  target {
    subnet_id = yandex_vpc_subnet.subnet1.id
    address   = module.compute_instance_1.internal_ip_address_vm
  }

  target {
    subnet_id = yandex_vpc_subnet.subnet2.id
    address   = module.compute_instance_2.internal_ip_address_vm
  }
}

resource "yandex_lb_network_load_balancer" "web_servers" {
  name = "web-servers-load-balancer"

  listener {
    name = "my-listener"
    port = 80
    external_address_spec {
      ip_version = "ipv4"
    }
  }

  attached_target_group {
    target_group_id = yandex_lb_target_group.web_servers.id

    healthcheck {
      name = "http"
      http_options {
        port = 80
        path = "/"
      }
    }
  }
}
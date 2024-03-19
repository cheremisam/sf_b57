output "internal_ip_address_vm_1" {
  value = module.compute_instance_1.internal_ip_address_vm
}

output "external_ip_address_vm_1" {
  value = module.compute_instance_1.external_ip_address_vm
}

output "internal_ip_address_vm_2" {
  value = module.compute_instance_2.internal_ip_address_vm
}

output "external_ip_address_vm_2" {
  value = module.compute_instance_2.external_ip_address_vm
}

output "external_ip_network_balance" {
  value = tolist(yandex_lb_network_load_balancer.web_servers.listener[*].external_address_spec[*].address)[0][0]
}


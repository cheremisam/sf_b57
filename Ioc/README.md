## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | 1.5.7 |
| <a name="requirement_yandex"></a> [yandex](#requirement\_yandex) | 0.112.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_yandex"></a> [yandex](#provider\_yandex) | 0.112.0 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_compute_instance_1"></a> [compute\_instance\_1](#module\_compute\_instance\_1) | ./modules/compute_instance | n/a |
| <a name="module_compute_instance_2"></a> [compute\_instance\_2](#module\_compute\_instance\_2) | ./modules/compute_instance | n/a |

## Resources

| Name | Type |
|------|------|
| [yandex_vpc_network.terraform-network](https://registry.terraform.io/providers/yandex-cloud/yandex/0.112.0/docs/resources/vpc_network) | resource |
| [yandex_vpc_subnet.subnet-a](https://registry.terraform.io/providers/yandex-cloud/yandex/0.112.0/docs/resources/vpc_subnet) | resource |
| [yandex_vpc_subnet.subnet-b](https://registry.terraform.io/providers/yandex-cloud/yandex/0.112.0/docs/resources/vpc_subnet) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_folder_id"></a> [folder\_id](#input\_folder\_id) | Folder id | `string` | `"b1gulh65eku8gtil8j4u"` | no |
| <a name="input_zone"></a> [zone](#input\_zone) | Use specific availability zone | `string` | `"ru-central1-a"` | no |

## Outputs

No outputs.

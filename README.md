# terraform-spotinst-ocean-gcp-k8s-vng
Terraform module for Spotinst provider resource `spotinst_ocean_gke_launch_spec`

This resource can be imported from GKE node pool or not. If you want to import the node pool and create the VNG from it, please provide `node_pool_name`.

## Usage
```hcl
module "ocean-gcp-k8s-vng" {
    source = "spotinst/ocean-gcp-k8s-vng/spotinst"

    ocean_id            = module.ocean-gcp-k8s.ocean_id
    node_pool_name      = "pool-1"
  }
```

## Documentation
* `ocean-gcp-k8s` - Creates Ocean Cluster [Doc](https://registry.terraform.io/modules/spotinst/ocean-gcp-k8s/spotinst/latest)
* `ocean-gcp-k8s-vng` - (Optional) Add custom virtual node groups with custom configs [Doc](https://registry.terraform.io/modules/spotinst/ocean-gcp-k8s-vng/spotinst/latest)
* `ocean-controller` - Create and installs Spot Ocean controller pod [Doc](https://registry.terraform.io/modules/spotinst/ocean-controller/spotinst/latest)


If you're new to [Spot](https://spot.io/) and want to get started, please checkout our [Getting Started](https://docs.spot.io/connect-your-cloud-provider/) guide, available on the [Spot Documentation](https://docs.spot.io/) website.

## Getting Help

We use GitHub issues for tracking bugs and feature requests. Please use these community resources for getting help:

- Ask a question on [Stack Overflow](https://stackoverflow.com/) and tag it with [terraform-spotinst](https://stackoverflow.com/questions/tagged/terraform-spotinst/).
- Join our [Spot](https://spot.io/) community on [Slack](http://slack.spot.io/).
- Open an issue.

## Community

- [Slack](http://slack.spot.io/)
- [Twitter](https://twitter.com/spot_hq/)

## Contributing

Please see the [contribution guidelines](CONTRIBUTING.md).
<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.13.1 |
| <a name="requirement_spotinst"></a> [spotinst](#requirement\_spotinst) | >= 1.39.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_google"></a> [google](#provider\_google) | n/a |
| <a name="provider_spotinst"></a> [spotinst](#provider\_spotinst) | >= 1.39.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [spotinst_ocean_gke_launch_spec.launchspec](https://registry.terraform.io/providers/spotinst/spotinst/latest/docs/resources/ocean_gke_launch_spec) | resource |
| [google_compute_image.COS](https://registry.terraform.io/providers/hashicorp/google/latest/docs/data-sources/compute_image) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_auto_headroom_percentage"></a> [auto\_headroom\_percentage](#input\_auto\_headroom\_percentage) | Set automatic headroom per launch spec. Number between 0-200 to control the headroom % of the specific Virtual Node Group. Effective when cluster.autoScaler.headroom.automatic.is\_enabled = true is set on the Ocean cluster. | `number` | `null` | no |
| <a name="input_batch_size_percentage"></a> [batch\_size\_percentage](#input\_batch\_size\_percentage) | Sets the percentage of the instances to deploy in each batch. | `number` | `20` | no |
| <a name="input_cpu_per_unit"></a> [cpu\_per\_unit](#input\_cpu\_per\_unit) | Optionally configure the number of CPUs to allocate for each headroom unit. CPUs are denoted in millicores, where 1000 millicores = 1 vCPU. | `number` | `null` | no |
| <a name="input_enable_integrity_monitoring"></a> [enable\_integrity\_monitoring](#input\_enable\_integrity\_monitoring) | Boolean. Enable the integrity monitoring parameter on the GCP instances. | `bool` | `null` | no |
| <a name="input_enable_secure_boot"></a> [enable\_secure\_boot](#input\_enable\_secure\_boot) | Boolean. Enable the secure boot parameter on the GCP instances. | `bool` | `null` | no |
| <a name="input_gpu_per_unit"></a> [gpu\_per\_unit](#input\_gpu\_per\_unit) | Optionally configure the number of GPUS to allocate for each headroom unit. | `number` | `null` | no |
| <a name="input_instance_types"></a> [instance\_types](#input\_instance\_types) | List of supported machine types for the Launch Spec. | `list(string)` | `null` | no |
| <a name="input_labels"></a> [labels](#input\_labels) | Optionally adds labels to instances launched in an Ocean cluster. | <pre>list(object({<br>    key   = string<br>    value = string<br>  }))</pre> | `null` | no |
| <a name="input_local_ssd_count"></a> [local\_ssd\_count](#input\_local\_ssd\_count) | Defines the number of local SSDs to be attached per node for this VNG. | `number` | `null` | no |
| <a name="input_max_instance_count"></a> [max\_instance\_count](#input\_max\_instance\_count) | Option to set a maximum number of instances per virtual node group. Can be null. If set, the value must be greater than or equal to 0. | `number` | `1000` | no |
| <a name="input_memory_per_unit"></a> [memory\_per\_unit](#input\_memory\_per\_unit) | Optionally configure the amount of memory (MiB) to allocate for each headroom unit. | `number` | `null` | no |
| <a name="input_metadata"></a> [metadata](#input\_metadata) | (Required only if node\_pool\_name is not set) Cluster's metadata. | <pre>list(object({<br>    key   = string<br>    value = string<br>  }))</pre> | `null` | no |
| <a name="input_min_instance_count"></a> [min\_instance\_count](#input\_min\_instance\_count) | Option to set a minimum number of instances per virtual node group. Can be null. If set, the value must be greater than or equal to 0. | `number` | `0` | no |
| <a name="input_name"></a> [name](#input\_name) | The launch specification name | `string` | `null` | no |
| <a name="input_node_pool_name"></a> [node\_pool\_name](#input\_node\_pool\_name) | The node pool you wish to use in your Launch Spec (VNG). | `string` | `null` | no |
| <a name="input_num_of_units"></a> [num\_of\_units](#input\_num\_of\_units) | The number of units to retain as headroom, where each unit has the defined headroom CPU, memory and GPU. | `number` | `null` | no |
| <a name="input_ocean_id"></a> [ocean\_id](#input\_ocean\_id) | The ID of the Ocean Cluster | `string` | n/a | yes |
| <a name="input_preemptible_percentage"></a> [preemptible\_percentage](#input\_preemptible\_percentage) | Defines the desired preemptible percentage for this launch specification. | `number` | `100` | no |
| <a name="input_restrict_scale_down"></a> [restrict\_scale\_down](#input\_restrict\_scale\_down) | Boolean. When set to true, VNG nodes will be treated as if all pods running have the restrict-scale-down label. Therefore, Ocean will not scale nodes down unless empty. | `bool` | `false` | no |
| <a name="input_root_volume_size"></a> [root\_volume\_size](#input\_root\_volume\_size) | Root volume size (in GB). | `number` | `null` | no |
| <a name="input_root_volume_type"></a> [root\_volume\_type](#input\_root\_volume\_type) | Root volume disk type. Valid values: pd-standard, pd-ssd | `string` | `null` | no |
| <a name="input_scheduling_task"></a> [scheduling\_task](#input\_scheduling\_task) | Used to define scheduled tasks such as a manual headroom update. | <pre>object({<br>    is_enabled      = bool<br>    cron_expression = string<br>    task_type       = string<br>    num_of_units    = string<br>    cpu_per_unit    = string<br>    gpu_per_unit    = string<br>    memory_per_unit = string<br>  })</pre> | `null` | no |
| <a name="input_service_account"></a> [service\_account](#input\_service\_account) | The account used by applications running on the VM to call GCP APIs. | `string` | `null` | no |
| <a name="input_should_roll"></a> [should\_roll](#input\_should\_roll) | Enables the roll | `bool` | `false` | no |
| <a name="input_source_image"></a> [source\_image](#input\_source\_image) | Image URL | `string` | `null` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | Tags to be added to resources | `map(string)` | `null` | no |
| <a name="input_taints"></a> [taints](#input\_taints) | Optionally adds labels to instances launched in an Ocean cluster. | <pre>list(object({<br>    key    = string<br>    value  = string<br>    effect = string<br>  }))</pre> | `null` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_launchspec_id"></a> [launchspec\_id](#output\_launchspec\_id) | n/a |
<!-- END_TF_DOCS -->
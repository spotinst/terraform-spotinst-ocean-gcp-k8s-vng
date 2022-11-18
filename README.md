# terraform-spotinst-ocean-gcp-k8s-vng
Terraform module for Spotinst provider resource `spotinst_ocean_gke_launch_spec`

## Usage
```hcl
module "ocean-gcp-k8s-vng" {
    source = "spotinst/ocean-gcp-k8s-vng/spotinst"

    ocean_id            = module.ocean-gcp-k8s.ocean_id
    node_pool_name      = "pool-1"
  }
```

## Providers

| Name | Version |
|------|---------|
| spotinst/spotinst | >= 1.39.0 |


## Modules
* `ocean-gcp-k8s` - Creates Ocean Cluster [Doc](https://registry.terraform.io/modules/spotinst/ocean-gcp-k8s/spotinst/latest)
* `ocean-gcp-k8s-vng` - (Optional) Add custom virtual node groups with custom configs [Doc](https://registry.terraform.io/modules/spotinst/ocean-gcp-k8s-vng/spotinst/latest)
* `ocean-controller` - Create and installs Spot Ocean controller pod [Doc](https://registry.terraform.io/modules/spotinst/ocean-controller/spotinst/latest)


## Documentation

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
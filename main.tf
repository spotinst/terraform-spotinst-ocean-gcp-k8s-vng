### Manages a custom Spotinst Ocean GKE Launch Spec resource. ###
resource "spotinst_ocean_gke_launch_spec" "launchspec" {
  ocean_id       = var.ocean_id
  node_pool_name = var.node_pool_name
  name           = var.name == null ? var.node_pool_name : var.name
  source_image   = var.source_image == null ? data.google_compute_image.COS.self_link : var.source_image

  create_options {
    initial_nodes = var.initial_nodes
  }

  dynamic "metadata" {
    for_each = var.metadata == null ? [] : var.metadata
    content {
      key   = metadata.key["key"]
      value = metadata.value["value"]
    }
  }

  dynamic "taints" {
    for_each = var.taints == null ? [] : var.taints
    content {
      key    = taints.value["key"]
      value  = taints.value["value"]
      effect = taints.value["effect"]
    }
  }

  dynamic "labels" {
    for_each = var.labels == null ? [] : var.labels
    content {
      key   = labels.value["key"]
      value = labels.value["value"]
    }
  }

  restrict_scale_down = var.restrict_scale_down
  root_volume_type    = var.root_volume_type
  root_volume_size    = var.root_volume_size
  instance_types      = var.instance_types

  #  dynamic "tags" {
  #    for_each = var.tags == null ? {Name = "${var.cluster_name}-ocean-${var.name}"} : var.tags
  #    content {
  #      key   = tags.key
  #      value = tags.value
  #    }
  #  }

  autoscale_headrooms_automatic {
    auto_headroom_percentage = var.auto_headroom_percentage
  }

  dynamic "autoscale_headrooms" {
    for_each = (
      var.num_of_units != null &&
      var.cpu_per_unit != null &&
      var.gpu_per_unit != null &&
      var.memory_per_unit != null
    ) ? [1] : []
    content {
      cpu_per_unit    = var.num_of_units
      gpu_per_unit    = var.cpu_per_unit
      memory_per_unit = var.gpu_per_unit
      num_of_units    = var.memory_per_unit
    }
  }

  strategy {
    preemptible_percentage = var.preemptible_percentage
  }

  shielded_instance_config {
    enable_integrity_monitoring = var.enable_integrity_monitoring
    enable_secure_boot          = var.enable_secure_boot
  }

  dynamic "storage" {
    for_each = var.local_ssd_count != null ? [1] : []
    content {
      local_ssd_count = var.local_ssd_count
    }
  }

  resource_limits {
    max_instance_count = var.max_instance_count
    min_instance_count = var.min_instance_count
  }

  service_account = var.service_account

  dynamic "scheduling_task" {
    for_each = var.scheduling_task != null ? [var.scheduling_task] : []
    content {
      is_enabled      = scheduling_task.value.is_enabled
      cron_expression = scheduling_task.value.cron_expression
      task_type       = scheduling_task.value.task_type
      task_headroom {
        num_of_units    = scheduling_task.value.num_of_units
        cpu_per_unit    = scheduling_task.value.cpu_per_unit
        gpu_per_unit    = scheduling_task.value.gpu_per_unit
        memory_per_unit = scheduling_task.value.memory_per_unit
      }
    }
  }

  dynamic "network_interfaces" {
    for_each = var.network_interfaces != null ? [var.network_interfaces] : []
    content {
      network    = network_interfaces.value.network
      project_id = network_interfaces.value.project_id
      dynamic "access_configs" {
        for_each = var.access_configs != null ? [var.access_configs] : []
        content {
          name = network_interfaces.value.name
          type = network_interfaces.value.type
        }
      }
      dynamic "alias_ip_ranges" {
        for_each = var.alias_ip_ranges != null ? [var.alias_ip_ranges] : []
        content {
          ip_cidr_range         = network_interfaces.value.ip_cidr_range
          subnetwork_range_name = network_interfaces.value.subnetwork_range_name
        }
      }
    }
  }

  update_policy {
    should_roll = var.should_roll
    roll_config {
      batch_size_percentage = var.batch_size_percentage
    }
  }
}
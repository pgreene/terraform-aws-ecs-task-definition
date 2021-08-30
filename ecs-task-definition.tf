resource "aws_ecs_task_definition" "general" {
  family = var.family
  container_definitions = var.container_definitions
  task_role_arn = var.task_role_arn
  execution_role_arn = var.execution_role_arn
  network_mode = var.network_mode
  ipc_mode = var.ipc_mode
  pid_mode = var.pid_mode
  cpu = var.cpu
  memory = var.memory
  requires_compatibilities = var.requires_compatibilities

  dynamic "volume" {
    for_each = var.volume == null ? [] : [var.volume]
    content {
      name = volume.value.name
      host_path = volume.value.host_path
      dynamic "docker_volume_configuration" {
        for_each = var.docker_volume_configuration == null ? [] : [var.docker_volume_configuration]
        content {
          scope = var.scope
          autoprovision = var.autoprovision
          driver = var.driver
          driver_opts = var.driver_opts
          labels = var.labels
        }
      }
      dynamic "efs_volume_configuration" {
        for_each = var.efs_volume_configuration == null ? [] : [var.efs_volume_configuration]
        content {
          file_system_id = efs_volume_configuration.value.file_system_id
          root_directory = efs_volume_configuration.value.root_directory
          transit_encryption = efs_volume_configuration.value.transit_encryption
          transit_encryption_port = efs_volume_configuration.value.transit_encryption_port
          dynamic "authorization_config" {
            for_each = var.authorization_config == null ? [] : [var.authorization_config]
            content {
              access_point_id = authorization_config.value.access_point_id
              iam = authorization_config.value.iam
              }
            }
          }
        }
      }
    }

  dynamic "placement_constraints" {
    for_each = var.placement_constraints == null ? [] : [var.placement_constraints]
    content {
      type = placement_constraints.value.type
      expression = placement_constraints.value.expression      
    }
  }

  dynamic "proxy_configuration" {
    for_each = var.proxy_configuration == null ? [] : [var.proxy_configuration]
    content {
      type = proxy_configurations.value.type
      container_name = proxy_configuration.value.container_name
      properties = var.properties
      }
  }

  dynamic "inference_accelerator" {
    for_each = var.inference_accelerator == null ? [] : [var.inference_accelerator]
    content {
      device_name = inference_accelerator.value.device_name
      device_type = inference_accelerator.value.device_type
    }
  }

  tags = var.tags
}

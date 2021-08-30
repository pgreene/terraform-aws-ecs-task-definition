variable "family" {
  description = "(Required) A unique name for your task definition."
  default = null
}

variable "container_definitions" {
  description = "(Required) A list of valid container definitions provided as a single valid JSON document. Please note that you should only provide values that are part of the container definition document. For a detailed description of what parameters are available, see the Task Definition Parameters section from the official Developer Guide."
  default = null
}

variable "task_role_arn" {
  description = "(Optional) The ARN of IAM role that allows your Amazon ECS container task to make calls to other AWS services."
  default = null
}

variable "execution_role_arn" {
  description = "(Optional) The Amazon Resource Name (ARN) of the task execution role that the Amazon ECS container agent and the Docker daemon can assume."
  default = null
}

variable "network_mode" {
  description = "(Optional) The Docker networking mode to use for the containers in the task. The valid values are none, bridge, awsvpc, and host."
  default = null
}

variable "ipc_mode" {
  description = "(Optional) The IPC resource namespace to be used for the containers in the task The valid values are host, task, and none."
  default = null
}

variable "pid_mode" {
  description = "(Optional) The process namespace to use for the containers in the task. The valid values are host and task."
  default = null
}

variable "cpu" {
  description = "(Optional) The number of cpu units used by the task. If the requires_compatibilities is FARGATE this field is required."
  default = null
}

variable "memory" {
  description = "(Optional) The amount (in MiB) of memory used by the task. If the requires_compatibilities is FARGATE this field is required."
  default = null
}

variable "requires_compatibilities" {
  description = "(Optional) A set of launch types required by the task. The valid values are EC2 and FARGATE."
  default = null
}

variable "volume" {
  description = "(Optional) A set of volume blocks that containers in your task may use."
  default = null
}

variable "docker_volume_configuration" {
  description = "(Optional) Used to configure a docker volume."
  default = null
  #default = {
  #        scope = docker_volume_configuration.value.scope
  #        autoprovision = docker_volume_configuration.value.autoprovision
  #        driver = docker_volume_configuration.value.driver
  #        driver_opts = docker_volume_configuration.var.driver_opts
  #        labels = docker_volume_configuration.var.labels
  #        }
}

variable "scope" {
  default = null
}

variable "autoprovision" {
  default = null
}

variable "driver" {
  default = null
}

variable "driver_opts" {
  description = "(Optional) A map of Docker driver specific options."
  default = null
  #default = {
  #  "type" = "nfs"
  #  "device" = "${aws_efs_file_system.fs.dns_name}:/"
  #  "o" = "addr=${aws_efs_file_system.fs.dns_name},rsize=1048576,wsize=1048576,hard,timeo=600,retrans=2,noresvport"
  #  }
}
  

variable "efs_volume_configuration" {
  default = null
}

variable "authorization_config" {
  default = null
}

variable "placement_constraints" {
  description = "(Optional) A set of placement constraints rules that are taken into consideration during task placement. Maximum number of placement_constraints is 10."
  default = null
}

variable "proxy_configuration" {
  description = "(Optional) The proxy configuration details for the App Mesh proxy."
  default = null
}

variable "properties" {
  description = "(Required) The set of network configuration parameters to provide the Container Network Interface (CNI) plugin, specified a key-value mapping."
  default = null
  #default = {
  #        AppPorts = "8080"
  #        EgressIgnoredIPs = "169.254.170.2,169.254.169.254"
  #        IgnoredUID = "1337"
  #        ProxyEgressPort = "15001"
  #        ProxyIngressPort = "15000"
  #      }
}

variable "inference_accelerator" {
  description = "(Optional) Configuration block(s) with Inference Accelerators settings. Detailed below."
  default = null
}

variable "labels" {
  description = "(Optional) A map of custom metadata to add to your Docker volume."
  default = null
}

variable "tags" {
  description = "(Optional) Key-value map of resource tags"
  default = {}
}
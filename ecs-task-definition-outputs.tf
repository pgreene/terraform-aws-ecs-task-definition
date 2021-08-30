
output "arn" {
  value = aws_ecs_task_definition.general.arn
}

output "family" {
  value = aws_ecs_task_definition.general.family
}

output "revision" {
  value = aws_ecs_task_definition.general.revision
}

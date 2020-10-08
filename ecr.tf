resource "aws_ecr_repository" "packer" {
  name = "packer"
  tags = merge(
    local.common_tags,
    { DockerHub : "dwpdigital/packer" }
  )
}

resource "aws_ecr_repository_policy" "packer" {
  repository = aws_ecr_repository.packer.name
  policy     = data.terraform_remote_state.management.outputs.ecr_iam_policy_document
}

output "ecr_example_url" {
  value = aws_ecr_repository.packer.repository_url
}

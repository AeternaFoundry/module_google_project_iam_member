variable "project_iam_members" {
  description = <<EOT
Map of project_iam_members, attributes below
Required:
    - member
    - project
    - role
Optional:
    - condition (block):
        - description (optional)
        - expression (required)
        - title (required)
EOT

  type = map(object({
    member  = string
    project = string
    role    = string
    condition = optional(object({
      description = optional(string)
      expression  = string
      title       = string
    }))
  }))
}


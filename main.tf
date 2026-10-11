resource "google_project_iam_member" "project_iam_members" {
  for_each = var.project_iam_members

  member  = each.value.member
  project = each.value.project
  role    = each.value.role

  dynamic "condition" {
    for_each = each.value.condition != null ? [each.value.condition] : []
    content {
      description = condition.value.description
      expression  = condition.value.expression
      title       = condition.value.title
    }
  }
}


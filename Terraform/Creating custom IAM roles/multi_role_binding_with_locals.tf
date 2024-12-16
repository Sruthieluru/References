# This Terraform configuration manages IAM bindings for multiple roles in a Google Cloud project.
# It assigns specific IAM roles (e.g., roles/storage.objectViewer, roles/compute.viewer) to the groups defined in `local.members`.
# The `google_project_iam_binding` resource is used to assign these roles dynamically using the `for_each` construct.
# 
# The roles and members are defined in the `locals` block:
# - `roles`: List of IAM roles to be assigned.
# - `members`: List of Google Cloud groups that will receive the roles.
# 
# The `google_project_iam_binding` resource will create a binding for each role in the `roles` list, associating it with the groups in the `members` list.


locals {
  roles = [
    "roles/storage.objectViewer",
    "roles/compute.viewer"
  ]

  members = [
    "group:developer-group@example.com",
    "group:tester-group@example.com"
  ]
}

resource "google_project_iam_binding" "multi_role_binding" {
  for_each = toset(local.roles)

  project = var.project_id
  role    = each.key
  members = local.members
}

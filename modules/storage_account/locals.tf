locals {
  storage_account_names = {
    for key, value in var.storage_accounts :
    key => substr(
      lower(
        replace(
          "${var.environment}${var.project_name}${key}",
          "-",
          ""
        )
      ),
      0,
      24
    )

  }

}
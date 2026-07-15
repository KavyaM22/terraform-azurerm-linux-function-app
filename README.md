# Azure Infrastructure using Terraform

## Overview

This project provisions Azure infrastructure using reusable Terraform modules.

## Resources Created

- Storage Account (ADLS Gen2 enabled)
- Azure Function App
- App Service Plan
- Azure SQL Server & Database
- Azure Key Vault
- Azure Data Factory (with optional GitHub configuration)
- Azure Synapse Workspace
- Log Analytics Workspace
- Application Insights
- Role Assignments

## Project Structure

```
modules/
├── storage_account/
├── function_app/
├── sql_db/
├── key_vault/
├── synapse/
├── data_factory/
├── application_insights/
├── log_analytics/
├── app_service_plan/
└── role_assignments/
```

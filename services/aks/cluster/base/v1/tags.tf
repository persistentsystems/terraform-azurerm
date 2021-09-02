data "azurerm_resources" "resource_name" {
  resource_group_name = var.context.resource_group_name
}

data "azurerm_subscription" "subscription_name" {
}

resource "azurerm_policy_definition" "costcenter_policy_definition" {
  name        = "${var.context.resource_group_name}-CostCenter"
  policy_type = "Custom"
  mode        = "Indexed"
  display_name = "CostCenter-TagPolicy"

  policy_rule = <<POLICY_RULE
    {
    "if": {
        "field": "tags['CostCenter']",
        "exists": "false"
    },
    "then": {
        "effect": "modify",
        "details": {
            "roleDefinitionIds": [
                "/providers/microsoft.authorization/roleDefinitions/b24988ac-6180-42a0-ab88-20f7382dd24c"
            ],
            "operations": [{
                "operation": "add",
                "field": "tags['CostCenter]",
                "value": "[resourcegroup().tags['CostCenter']]"
            }]
        }
    }
  }
POLICY_RULE

}

resource "azurerm_policy_assignment" "costcenter_policy" {
  name                 = "${var.context.resource_group_name}-CostCenter"
  location            = var.context.location
  scope         = "${data.azurerm_subscription.subscription_name.id}/resourceGroups/${var.context.resource_group_name}-cluster"
  policy_definition_id = azurerm_policy_definition.costcenter_policy_definition.id
    identity {
    type = "SystemAssigned"
  }

}

resource "azurerm_policy_definition" "businessunit_policy_definition" {
  name        = "${var.context.resource_group_name}-BusinessUnit"
  policy_type = "Custom"
  mode        = "Indexed"
  display_name = "BusinessUnit-TagPolicy"

  policy_rule = <<POLICY_RULE
    {
    "if": {
        "field": "tags['BusinessUnit']",
        "exists": "false"
    },
    "then": {
        "effect": "modify",
        "details": {
            "roleDefinitionIds": [
                "/providers/microsoft.authorization/roleDefinitions/b24988ac-6180-42a0-ab88-20f7382dd24c"
            ],
            "operations": [{
                "operation": "add",
                "field": "tags['BusinessUnit']",
                "value": "[resourcegroup().tags['BusinessUnit']]"
            }]
        }
    }
  }
POLICY_RULE

}

resource "azurerm_policy_assignment" "businessunit_policy" {
  name                 = "${var.context.resource_group_name}-BusinessUnit"
  location            = var.context.location
  scope         = "${data.azurerm_subscription.subscription_name.id}/resourceGroups/${var.context.resource_group_name}-cluster"
  policy_definition_id = azurerm_policy_definition.businessunit_policy_definition.id
    identity {
    type = "SystemAssigned"
  }

}

resource "azurerm_policy_definition" "product_policy_definition" {
  name        = "${var.context.resource_group_name}-Product"
  policy_type = "Custom"
  mode        = "Indexed"
  display_name = "Product-TagPolicy"

  policy_rule = <<POLICY_RULE
    {
    "if": {
        "field": "tags['Product']",
        "exists": "false"
    },
    "then": {
        "effect": "modify",
        "details": {
            "roleDefinitionIds": [
                "/providers/microsoft.authorization/roleDefinitions/b24988ac-6180-42a0-ab88-20f7382dd24c"
            ],
            "operations": [{
                "operation": "add",
                "field": "tags['Product']",
                "value": "[resourcegroup().tags['Product']]"
            }]
        }
    }
  }
POLICY_RULE

}

resource "azurerm_policy_assignment" "product_policy" {
  name                 = "${var.context.resource_group_name}-Product"
  location            = var.context.location
  scope         = "${data.azurerm_subscription.subscription_name.id}/resourceGroups/${var.context.resource_group_name}-cluster"
  policy_definition_id = azurerm_policy_definition.product_policy_definition.id
    identity {
    type = "SystemAssigned"
  }

}

resource "azurerm_policy_definition" "application_policy_definition" {
  name        = "${var.context.resource_group_name}-Application"
  policy_type = "Custom"
  mode        = "Indexed"
  display_name = "Application-TagPolicy"

  policy_rule = <<POLICY_RULE
    {
    "if": {
        "field": "tags['Application']",
        "exists": "false"
    },
    "then": {
        "effect": "modify",
        "details": {
            "roleDefinitionIds": [
                "/providers/microsoft.authorization/roleDefinitions/b24988ac-6180-42a0-ab88-20f7382dd24c"
            ],
            "operations": [{
                "operation": "add",
                "field": "tags['Application']",
                "value": "[resourcegroup().tags['Application']]"
            }]
        }
    }
  }
POLICY_RULE

}

resource "azurerm_policy_assignment" "application_policy" {
  name                 = "${var.context.resource_group_name}-Application"
  location            = var.context.location
  scope         = "${data.azurerm_subscription.subscription_name.id}/resourceGroups/${var.context.resource_group_name}-cluster"
  policy_definition_id = azurerm_policy_definition.application_policy_definition.id
    identity {
    type = "SystemAssigned"
  }

}


resource "azurerm_policy_definition" "environment_policy_definition" {
  name        = "${var.context.resource_group_name}-Environment"
  policy_type = "Custom"
  mode        = "Indexed"
  display_name = "Environment-TagPolicy"

  policy_rule = <<POLICY_RULE
    {
    "if": {
        "field": "tags['env']",
        "exists": "false"
    },
    "then": {
        "effect": "modify",
        "details": {
            "roleDefinitionIds": [
                "/providers/microsoft.authorization/roleDefinitions/b24988ac-6180-42a0-ab88-20f7382dd24c"
            ],
            "operations": [{
                "operation": "add",
                "field": "tags['env']",
                "value": "[resourcegroup().tags['env']]"
            }]
        }
    }
  }
POLICY_RULE

}

resource "azurerm_policy_assignment" "environment_policy" {
  name                 = "${var.context.resource_group_name}-Environment"
  location            = var.context.location
  scope         = "${data.azurerm_subscription.subscription_name.id}/resourceGroups/${var.context.resource_group_name}-cluster"
  policy_definition_id = azurerm_policy_definition.environment_policy_definition.id
    identity {
    type = "SystemAssigned"
  }

}

resource "azurerm_policy_definition" "supportteam_policy_definition" {
  name        = "${var.context.resource_group_name}-SupportTeam"
  policy_type = "Custom"
  mode        = "Indexed"
  display_name = "SupportTeam-TagPolicy"

  policy_rule = <<POLICY_RULE
    {
    "if": {
        "field": "tags['SupportTeam']",
        "exists": "false"
    },
    "then": {
        "effect": "modify",
        "details": {
            "roleDefinitionIds": [
                "/providers/microsoft.authorization/roleDefinitions/b24988ac-6180-42a0-ab88-20f7382dd24c"
            ],
            "operations": [{
                "operation": "add",
                "field": "tags['SupportTeam']",
                "value": "[resourcegroup().tags['SupportTeam']]"
            }]
        }
    }
  }
POLICY_RULE

}

resource "azurerm_policy_assignment" "supportteam_policy" {
  name                 = "${var.context.resource_group_name}-SupportTeam"
  location            = var.context.location
  scope         = "${data.azurerm_subscription.subscription_name.id}/resourceGroups/${var.context.resource_group_name}-cluster"
  policy_definition_id = azurerm_policy_definition.supportteam_policy_definition.id
    identity {
    type = "SystemAssigned"
  }

}                  

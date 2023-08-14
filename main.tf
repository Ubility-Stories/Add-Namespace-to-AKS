data "azurerm_resource_group" "main" {
  name = var.resource-group-name
}

data "azurerm_kubernetes_cluster" "aks" {
  name                = var.aks-name
  resource_group_name = data.azurerm_resource_group.main.name
}


resource "null_resource" "get_creds" {
  depends_on = [data.azurerm_kubernetes_cluster.aks]
  provisioner "local-exec" {
    command = "az aks get-credentials --resource-group ${data.azurerm_resource_group.main.name} --name ${data.azurerm_kubernetes_cluster.aks.name} --overwrite-existing"
  }
}

resource "null_resource" "kubectl_apply" {
  depends_on = [data.azurerm_kubernetes_cluster.aks]
  provisioner "local-exec" {
    command = "kubectl create ns ${data.namespace-name}"
  }
}

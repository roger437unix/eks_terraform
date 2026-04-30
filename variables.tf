variable "cluster_name" {
  type        = string
  description = "Informe o nome do cluster EKS"
}

variable "qtde_nodes" {
  type        = number
  description = "Quantidade de nodes? [>0 && <4]"

  validation {
    condition     = var.qtde_nodes > 0 && var.qtde_nodes < 4
    error_message = "*** Qtde de cluster deve ser maior que zero e menor que quatro"
  }
}

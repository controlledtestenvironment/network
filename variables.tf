variable "cidr_vpc" {
  description = "cidr block para vpc"
  type        = string
}

variable "cidr_subnet" {
  description = "cidr block para subnet"
  type        = string
}

variable "environment" {
  description = "Ambiente onde o recurso sera utilizado"
  type        = string

}

variable "region" {
  description = "Variavel indica regiao do recurso"
  type        = string
  default     = "sa-east-1"
}
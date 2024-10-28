resource "ibm_is_vpc" "vpc" {
  name = "vpc-azure-devops"
  address_prefix_management = "manual"
}

resource "ibm_is_vpc_address_prefix" "ibm_is_vpc_address_prefix01" {
  name = "vpc-azure-devops-zone1"
  zone = "eu-es-1"
  vpc  = ibm_is_vpc.vpc.id
  cidr = "10.1.1.0/24"
}

resource "ibm_is_subnet" "subnet01" {
  name            = "subnet01-vpc-azure-devop"
  vpc             = ibm_is_vpc.vpc.id
  zone            = "eu-es-1"
  ipv4_cidr_block = "10.1.1.0/24"
  depends_on = [ibm_is_vpc_address_prefix.ibm_is_vpc_address_prefix01]
}

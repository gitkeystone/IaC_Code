provider "tencentcloud" {
  secret_id  = var.secret_id
  secret_key = var.secret_key
  region     = var.region
}


resource "tencentcloud_vpc" "tf_vpc" {
  name       = var.short_name
  cidr_block = var.vpc_cidr
}

resource "tencentcloud_subnet" "tf_service_subnet" {
  vpc_id            = tencentcloud_vpc.tf_vpc.id
  name              = "tf_subnet"
  cidr_block        = var.web_cidr
  availability_zone = var.availability_zone
  route_table_id    = tencentcloud_route_table.tf_routetable.id

  tags = var.tags

}

resource "tencentcloud_route_table" "tf_routetable" {
  vpc_id = tencentcloud_vpc.tf_vpc.id
  name   = "tf-rt"
}

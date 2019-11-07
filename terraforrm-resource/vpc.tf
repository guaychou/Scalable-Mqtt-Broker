#
# VPC Resources
#  * VPC
#  * Subnets
#  * Internet Gateway
#  * Route Table
#

resource "aws_vpc" "kevin" {
  cidr_block = "10.0.0.0/16"

  tags = "${
    map(
      "Name", "terraform-eks-kevin-node",
      "kubernetes.io/cluster/${var.cluster-name}", "shared",
    )
  }"
}

resource "aws_subnet" "kevin" {
  count = 2

  availability_zone = "${data.aws_availability_zones.available.names[count.index]}"
  cidr_block        = "10.0.${count.index}.0/24"
  vpc_id            = "${aws_vpc.kevin.id}"

  tags = "${
    map(
      "Name", "terraform-eks-kevin-node",
      "kubernetes.io/cluster/${var.cluster-name}", "shared",
    )
  }"
}

resource "aws_internet_gateway" "kevin" {
  vpc_id = "${aws_vpc.kevin.id}"

  tags = {
    Name = "terraform-eks-kevin"
  }
}

resource "aws_route_table" "kevin" {
  vpc_id = "${aws_vpc.kevin.id}"

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "${aws_internet_gateway.kevin.id}"
  }
}

resource "aws_route_table_association" "kevin" {
  count = 2

  subnet_id      = "${aws_subnet.kevin.*.id[count.index]}"
  route_table_id = "${aws_route_table.kevin.id}"
}

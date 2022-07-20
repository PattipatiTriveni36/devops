 # create subnet

resource "aws_subnet" "test-subnet1" {
  #count will work like loop
  count = length(var.subnet1_cidr)
  vpc_id     = aws_vpc.test.id
  availability_zone = element(data.aws_availability_zones.available.*,count.index)
  # element will work as for loop
  cidr_block = element(var.subnet1_cidr,count.index)

  tags = {
    Name = element(var.subnet_1,count.index)
    Env = var.env[0]
  }
}


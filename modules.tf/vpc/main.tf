# Create a VPC
resource "aws_vpc" "vpc" {
  cidr_block = var.vpc_cidr


  tags = {
    Name        = "project-${var.infra_env}-vpc"
    Project     = "Three_tier_web_app"
    Environment = "var.infra_env"
    ManagedBy   = "terraform"
  }
}
resource "aws_subnet" "public" {
  for_each = var.public_subnet_numbers

  vpc_id = aws_vpc.vpc.id

  cidr_block = cidrsubnet(aws_vpc.vpc.cidr_block, 4, each.value)


  tags = {
    Name        = "project-${var.infra.env}-public-subnet"
    Project     = "project"
    Role        = "public"
    Environment = "var.infra.env"
    ManagedBy   = "terraform"
    subnet      = "${each.key}-${each.value}"
  }
}

resource "aws_subnet" "private" {
  for_each = var.private_subnet_numbers

  vpc_id = aws_vpc.vpc.id

  cidr_block = cidrsubnet(aws_vpc.vpc.cidr_block, 4, each.value)


  tags = {
    Name        = "project-${var.infra.env}-private-subnet"
    Project     = "project"
    Role        = "private"
    Environment = "var.infra.env"
    ManagedBy   = "terraform"
    subnet      = "${each.key}-${each.value}"
  }
}


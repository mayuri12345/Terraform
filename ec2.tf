provider "aws" {
    region = "us-east-1"
    access_key = ""
    secret_key = ""
  
}
resource "aws_instance" "my-instance" {
    ami = "ami-0953476d60561c955"
    instance_type = "t2.micro"
  tags = {
    Name = "new-instance"
  }
  count = 3
}
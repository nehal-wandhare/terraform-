resource "aws_instance" "demo" {
  ami           = "ami-02b8269d5e85954ef"
  instance_type = "t3.micro"
  subnet_id     = "subnet-093434380a6d5b8a3"

  provisioner "local-exec" {
    command = "echo EC2 created successfully >> ec2.txt"
  }
}


resource "aws_instance" "file_ec2" {
  ami           = "ami-02b8269d5e85954ef"
  instance_type = "t3.micro"
  subnet_id     = "subnet-093434380a6d5b8a3"
  key_name      = "nehal"

  connection {
    type        = "ssh"
    user        = "ubuntu"
    private_key = file("nehal.pem")
    host        = self.public_ip
  }

  provisioner "file" {
    source      = "ec2.txt"
    destination = "/home/ubuntu/ec2.txt"
  }

  tags = {
    Name = "file-provisioner-demo"
  }
}


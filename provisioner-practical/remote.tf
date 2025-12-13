resource "aws_instance" "remote_exec_demo" {
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

  provisioner "remote-exec" {
    inline = [
      "sudo apt update -y",
      "sudo apt install -y apache2",
      "sudo systemctl enable apache2",
      "sudo systemctl start apache2",
      "echo Remote exec successful > /home/ubuntu/remote.txt"
    ]
  }

  tags = {
    Name = "remote-exec-demo"
  }
}


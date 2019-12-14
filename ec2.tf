resource "aws_instance" "example" {
  ami           = "ami-01f14919ba412de34"
  instance_type = "t2.micro"
  vpc_security_group_ids = [aws_security_group.sec_group.id]

  user_data = <<-EOF
              #!/bin/bash
              echo "Hello, World" > index.html
              nohup busybox httpd -f -p 8080 &
              EOF
  
  tags = {
    Name = "terraform-example"
  }

}
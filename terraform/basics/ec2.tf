resource "aws_instance" "codepanda_ec2_instance" {
  ami                         = "ami-068c0051b15cdb816"
  instance_type               = "t3.micro"
  subnet_id                   = aws_subnet.public_subnet_1.id
  vpc_security_group_ids      = [aws_security_group.codepanda_sg.id]
  key_name                    = "codepanda-demo-session"
  associate_public_ip_address = true
  
  tags = {
    Name = "codepanda_ec2_instance"
    env  = "dev"
  }
}
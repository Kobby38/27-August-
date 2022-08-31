resource "aws_instance" "server" {
  ami           = "ami-00785f4835c6acf64" # eu-west-2
  instance_type = "t2.micro"
  key_name = "july-kp"
  vpc_security_group_ids =[aws_security_group.July-sec.id]
  associate_public_ip_address = true
  subnet_id = aws_subnet.pub-sub-1.id
}

   
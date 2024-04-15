resource "aws_instance" "web" {
 ami          = "ami-0f3c7d07486cad139"
 instance_type = "t3.micro"
 vpc_security_group_ids = [aws_security_group.roboshop-all.id]

 tags = {
    Name = "Helloterraform"
 }
}

resource "aws_security_group" "roboshop-all" { #this is terraform referance name only
    name   = var.sg-name # this is for aws
    description = var.sg-description
    #vpc_id     = aws_vpc.main.id = connection 
      
    ingress {
        description    = "Allow All ports"
        from_port      = var.inbound-from-port # 0 means all ports
        to_port        = 0
        protocol       = "tcp"
        cidr_blocks    = var.cidr_blocks
    }

    egress {
        from_port     = 0
        to_port       = 0
        protocol      = "-1"
        cidr_blocks   = ["0.0.0.0/0"]
    }

    tags = {
        name = "roboshop-all-was"
    }
    
}
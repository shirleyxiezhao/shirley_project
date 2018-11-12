provider "aws" {
  version = "~> 1.43"
  region= "us-east-1"
}


resource "aws_instance" "spring" {
  ami                    = "ami-05aa248bfb1c99d0f"
  instance_type          = "t2.micro"
  vpc_security_group_ids = ["sg-547cc53b"]
  subnet_id              = "subnet-049cf4763e0a35908"
  key_name               = "my-key"
  
  provisioner "file" {
    source = "*.jar"
    destination = "/tmp/*.jar"
  }
   provisioner "remote-exec" {
     inline = [
      "chmod +x /tmp/hardening.sh",
      "sudo bash /tmp/hardening.sh"
    ]
  }
  
  
  
  tags {
    Name = "sprint-boot"
  }
}

resource "aws_elb" "spring_elb" {
  name            = "spring-elb"
  subnets         = ["subnet-049cf4763e0a35908"]
  security_groups = ["sg-547cc53b"]
  
  listener {
    instance_port      = "8080"
    instance_protocol  = "http"
    lb_port            = "8080"
    lb_protocol        = "http"
  }

 
  health_check {
    healthy_threshold   = 2
    unhealthy_threshold = 2
    timeout             = 5
    target              = "TCP:8080"
    interval            = 30
  }
  
  idle_timeout = 60
  
  tags {
    Name = "spring-boot"
   
  }
}


resource "aws_key_pair" "mykey" {
  key_name   = "my-key"
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDE8Vfg+o5Xs+5fA+y1GIGKz4MjuFUb1cRo5oCl+FlWduUt67Q1XJC61TpckE/hRYEk6nGR/RZdbJJJV5mAQWyINNmfwZGz4e6CkIH6NdgtuE+XK18UtbKp8v2+cuzrysXHHZ3qIUx+5fEMI5p62+fRkdops2sLojv4riLrriQgMxraMzJVDY0ntlbgMQUG2U2gPG6L4JmKhq2ui08gEVZGJI3em+jpNh4XvJa3GDC/meBFOdM2NL5x6FCUmWkgyVsBxgSRkynCuUbf+zrmxIFTlAlBpoz08W0+OBu7ONiGrusiOsRC7KoAsz8X0bRm1tTixsHR75RDFyjXUpL0Qn5l Xies@CCSC02QVATWG8WP"
}

resource "aws_lb_target_group" "application-target-group" {
  name     = "application-target-group"
  vpc_id   = var.application-vpc-id
  protocol = "HTTP"
  port     = 80
}

resource "aws_alb_target_group_attachment" "target-group-registeration" {
  target_group_arn = aws_lb_target_group.application-target-group.arn
  target_id        = aws_instance.application-server.id
  port             = 80
}

resource "aws_lb" "application-load-balancer" {
  name                       = "application-load-balancer"
  load_balancer_type         = "application"
  internal                   = false
  security_groups            = [var.load-balancer-security-group-id]
  enable_deletion_protection = false
  ip_address_type            = "ipv4"
  subnets                    = var.public-subnets-ids
}

resource "aws_lb_listener" "application-load-balancer-listener" {
  load_balancer_arn = aws_lb.application-load-balancer.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.application-target-group.arn
  }
}

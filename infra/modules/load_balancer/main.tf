resource "aws_lb" "internal_lb" {
  name               = var.lb_name
  internal           = true
  load_balancer_type = "application"
  security_groups    = var.security_group_ids
  subnets            = var.subnet_ids
}

resource "aws_lb_listener" "api_listener" {
  load_balancer_arn = aws_lb.internal_lb.arn
  port              = "6443"
  protocol          = "TCP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.api_target_group.arn
  }
}

resource "aws_lb_target_group" "api_target_group" {
  name     = var.target_group_name
  port     = 6443
  protocol = "TCP"
  vpc_id   = var.vpc_id

  health_check {
    path                = var.health_check_path
    interval            = var.health_check_interval
    timeout             = var.health_check_timeout
    healthy_threshold   = var.health_check_healthy_threshold
    unhealthy_threshold = var.health_check_unhealthy_threshold
    protocol            = var.health_check_protocol
  }
}

resource "aws_lb_target_group_attachment" "api_target_attachment" {
  count            = length(var.target_ids)
  target_group_arn = aws_lb_target_group.api_target_group.arn
  target_id        = var.target_ids[count.index]
  port             = 6443
}

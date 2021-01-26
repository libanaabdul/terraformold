
resource "aws_lb" "lb-tf" {
  name               = var.name_lb
  internal           = false
  load_balancer_type = "application"
  security_groups    = [var.sgmonitor]
  subnets            = [var.subnet1, var.subnet2]

  enable_deletion_protection = false

  tags = {
    Environment = var.environment
  }
}

resource "aws_lb_listener" "http-https" {
  load_balancer_arn = aws_lb.lb-tf.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type = "redirect"

    redirect {
      port        = "443"
      protocol    = "HTTPS"
      status_code = "HTTP_301"
    }
  }
}

resource "aws_lb_listener" "https" {

  load_balancer_arn = aws_lb.lb-tf.arn
  port              = var.https_port
  protocol          = "HTTPS"
  certificate_arn   = var.certificate_arn

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.ip-lb.arn

  }
}

resource "aws_lb_target_group" "ip-lb" {
  name     = "tf-example-lb-tg"
  port     = 80
  protocol = "HTTP"
  vpc_id   = var.vpclib
}

# Redirect action

resource "aws_lb_listener_rule" "redirect_http_to_https" {
  listener_arn = aws_lb_listener.http-https.arn

  action {
    type = "redirect"

    redirect {
      port        = "443"
      protocol    = "HTTPS"
      status_code = "HTTP_301"
    }
  }

  condition {
    host_header {
      values = [var.domain]
    }
  }
}


resource "aws_lb_listener_certificate" "lib-certificate" {
  listener_arn    = aws_lb_listener.https.arn
  certificate_arn = var.certificate_arn
}


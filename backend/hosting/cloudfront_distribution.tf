resource "aws_cloudfront_distribution" "bfide-meriy100-com" {
  aliases = ["bfide.meriy100.com"]

  default_cache_behavior {
    allowed_methods = ["GET", "HEAD"]
    cached_methods  = ["GET", "HEAD"]
    compress        = false
    default_ttl     = "86400"

    forwarded_values {
      cookies {
        forward = "none"
      }

      query_string = false
    }

    max_ttl                = "31536000"
    min_ttl                = "0"
    smooth_streaming       = false
    target_origin_id       = "S3-bucket-brainfuck-ide"
    viewer_protocol_policy = "redirect-to-https"
  }

  default_root_object = "index.html"
  enabled             = true
  http_version        = "http2"
  is_ipv6_enabled     = true

  origin {
    custom_origin_config {
      http_port                = "80"
      https_port               = "443"
      origin_keepalive_timeout = "5"
      origin_protocol_policy   = "http-only"
      origin_read_timeout      = "30"
      origin_ssl_protocols     = ["TLSv1", "TLSv1.1", "TLSv1.2"]
    }

    domain_name = "bucket-brainfuck-ide.s3-website-us-east-1.amazonaws.com"
    origin_id   = "S3-bucket-brainfuck-ide"
  }

  price_class = "PriceClass_All"

  restrictions {
    geo_restriction {
      restriction_type = "none"
    }
  }

  retain_on_delete = false
  tags             {}

  viewer_certificate {
    cloudfront_default_certificate = false
    minimum_protocol_version       = "TLSv1.1_2016"
    ssl_support_method             = "sni-only"
  }

  wait_for_deployment = true
}

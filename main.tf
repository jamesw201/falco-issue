terraform {
  required_providers {
    fastly = {
      source  = "fastly/fastly"
      version = ">= 3.1.0"
    }
  }
}

resource "fastly_service_vcl" "demo" {
  name = "demofastly"

  domain {
    name    = "demo.notexample.com"
    comment = "demo"
  }

  backend {
    address = "127.0.0.1"
    name    = "localhost"
    port    = 80
  }

  force_destroy = true

  vcl {
    name    = "default"
    content = file("./default.vcl")
    main    = true
  }
}

## Global Config
log_level   = "DEBUG"
working_dir = "sync-tasks"
port        = 8558

syslog {}

buffer_period {
  enabled = true
  min     = "5s"
  max     = "20s"
}

# Consul Block
 consul {
  address = "localhost:8500"
  service_registration {
    enabled = true
    service_name = "CTS Event AS3 WAF"
    default_check {
      enabled = true
      address = "http://localhost:8558"
   }
}
   token = "2e840207-4f76-e889-6124-f9df1cxxxxx"

}

# Driver block
driver "terraform-cloud" {
  hostname     = "https://app.terraform.io"
  organization = "SCStest"
  token        = "mxxxxxxxxxxxxxxxRkgEOQoUFZKnMwrGz3TNNxhVMD3zft6sRgGWY7nEKDwwQQQA4QpfhZhJeegr98"
required_providers {
    bigip = {
      source = "F5Networks/bigip"
    }
  }

}

terraform_provider "bigip" {
  address  = "1.2.3.4:8443"
  username = "admin"
  password = "CUYfIEcqzV"
}

task {
  name = "AS3_W5"
  description = "BIG-IP example"
  source = "scshitole/consul-event-waf/bigip"
  providers = ["bigip"]
  services = ["nginx"]
  variable_files = ["terraform.tfvars"]
}



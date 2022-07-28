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



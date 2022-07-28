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

/*# Consul Block
consul {
  address = "https://scs-consul-cluster.consul.95dfd4f6-6078-40ed-9b82-f58d39eb209e.aws.hashicorp.cloud"
  token = "2e840207-4f76-e889-6124-f9df1c619b8f"
}*/

# Consul Block
 consul {
  address = "localhost:8500"
  service_registration {
    enabled = true
    service_name = "CTS Event AS3 WAF"
    default_check {
      enabled = true
      address = "http://10.0.0.209:8558"
   }
}

}

terraform_provider "bigip" {
  address  = "54.213.254.29:8443"
  username = "admin"
  password = "CUYfIEcqzV"
}

task {
  name = "AS3_W5"
  description = "BIG-IP example"
  source = "../"
  providers = ["bigip"]
  services = ["nginx"]
  variable_files = ["terraform.tfvars"]
}



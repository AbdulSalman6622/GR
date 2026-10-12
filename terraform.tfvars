tenant_id       = "efd2e458-1bb2-4f36-a32d-634528cacc03"
subscription_id = "0e5d466e-a86b-4990-b751-5b634db97164" 


naming = {
  prefix    = "az"
  delimiter = "-"
}

product = "tfstate"
env     = "prod"

location = "uksouth"

region_short_map = {
  uksouth = "uks"
}

common_tags = {
  environment = "prod"
  product     = "tfstate"
}

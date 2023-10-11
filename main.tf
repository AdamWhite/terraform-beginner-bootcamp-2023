terraform {
  required_providers {
    terratowns = {
      source = "local.providers/local/terratowns"
      version = "1.0.0"
    }
  }
  #backend "remote" {
  #  hostname = "app.terraform.io"
  #  organization = "ExamPro"

  #  workspaces {
  #    name = "terra-house-1"
  #  }
  #}
  cloud {
    organization = "RedTurtleSoftware"
    workspaces {
      name = "terra-house-1"
    }
  }

}

provider "terratowns" {
  endpoint = var.terratowns_endpoint
  user_uuid = var.teacherseat_user_uuid
  token = var.terratowns_access_token
}

module "home_thebirchv2_hosting" {
  source = "./modules/terrahome_aws"
  user_uuid = var.teacherseat_user_uuid
  public_path = var.thebirchv2.public_path
  content_version = var.thebirchv2.content_version
}

resource "terratowns_home" "home" {
  name = "The Birch!v2"
  description = <<DESCRIPTION
The Birch v2 is a home built upon a swamp. 
It's not a yucky or smelly swamp, it's a cozy place to call home. :)
DESCRIPTION
  domain_name = module.home_thebirchv2_hosting.domain_name
  town = "missingo"
  content_version = var.thebirchv2.content_version
}

module "home_myhouse_hosting" {
  source = "./modules/terrahome_aws"
  user_uuid = var.teacherseat_user_uuid
  public_path = var.myhouse.public_path
  content_version = var.myhouse.content_version
}

resource "terratowns_home" "home_myhouse" {
  name = "My custom House"
  description = <<DESCRIPTION
MY custom house is nothing like the house I actually have
DESCRIPTION
  domain_name = module.home_myhouse_hosting.domain_name
  town = "missingo"
  content_version = var.myhouse.content_version
}
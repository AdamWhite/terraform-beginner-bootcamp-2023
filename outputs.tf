output "bucket_name" {
    description = "Bucket name for our static website"
    value = module.home_thebirchv2_hosting.bucket_name  
}

output "website_endpoint" {
    description = "website endpoint for our static website"
    value = module.home_thebirchv2_hosting.website_endpoint  
}

output "domain_name" {
    description = "the cloudfront distribution domain name"
    value = module.home_thebirchv2_hosting.domain_name
}
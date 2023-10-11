variable "user_uuid" {
    description = "The UUID of the user"
    type = string  
    validation {
      condition     = can(regex("^[0-9a-fA-F]{8}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{12}$", var.user_uuid))
      error_message = "The provided UUID is not in a valid format. Please ensure it matches the pattern: 8-4-4-4-12 hexadecimal characters."
  }
}

#variable "bucket_name" {
#    description = "The name of the S3 bucket"
#    type = string  
#    validation {
#      condition     = (
#        length(var.bucket_name) >= 3 && length(var.bucket_name) <= 63 && can(regex("^[a-z0-9][a-z0-9-.]*[a-z0-9]$", var.bucket_name))
#      )
#      error_message = "The bucket name must be between 3 and 63 characters"
#  }
#}

variable "content_version" {
  description = "Version of the content, should be a positive integer starting at 1."
  type        = number
  
  validation {
    condition     = var.content_version >= 1 && floor(var.content_version) == var.content_version
    error_message = "The content_version must be a positive integer starting at 1."
  }
}

variable "public_path" {
  description = "The file path for the public directory"
  type        = string
}
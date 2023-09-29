variable "user_uuid" {
    description = "The UUID of the user"
    type = string  
    validation {
      condition     = can(regex("^[0-9a-fA-F]{8}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{12}$", var.user_uuid))
      error_message = "The provided UUID is not in a valid format. Please ensure it matches the pattern: 8-4-4-4-12 hexadecimal characters."
  }
}

variable "bucket_name" {
    description = "The name of the S3 bucket"
    type = string  
    validation {
      condition     = (
        length(var.bucket_name) >= 3 && length(var.bucket_name) <= 63 && can(regex("^[a-z0-9][a-z0-9-.]*[a-z0-9]$", var.bucket_name))
      )
      error_message = "The bucket name must be between 3 and 63 characters"
  }
}

variable "index_html_filepath" {
  description = "The file path for the index.html."
  type        = string

  validation {
    condition     = fileexists(var.index_html_filepath) && can(regex(".+\\.html$", var.index_html_filepath))
    error_message = "The provided path either does not point to a .html file or the file does not exist. Please provide a valid path to an existing index.html file."
  }
}

variable "error_html_filepath" {
  description = "The file path for the error.html."
  type        = string

  validation {
    condition     = fileexists(var.error_html_filepath) && can(regex(".+\\.html$", var.error_html_filepath))
    error_message = "The provided path either does not point to a .html file or the file does not exist. Please provide a valid path to an existing error.html file."
  }
}

variable "content_version" {
  description = "Version of the content, should be a positive integer starting at 1."
  type        = number
  
  validation {
    condition     = var.content_version >= 1 && floor(var.content_version) == var.content_version
    error_message = "The content_version must be a positive integer starting at 1."
  }
}

variable "assets_path" {
  description = "The path to the assets folder"
  type        = string

}
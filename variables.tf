variable "user_uuid" {
    description = "The UUID of the user"
    type = string  
    validation {
      condition     = can(regex("^[0-9a-fA-F]{8}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{12}$", var.user_uuid))
      error_message = "The provided UUID is not in a valid format. Please ensure it matches the pattern: 8-4-4-4-12 hexadecimal characters."
  }
}
variable "s3_name" {
  type        = string
  description = "The name of the bucket."

  validation {
    condition     = length(var.s3_name) >= 3 && length(var.s3_name) <= 63
    error_message = "The bucket name must be length between 3 and 63."
  }
}

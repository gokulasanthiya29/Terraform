provider "aws" {
  region     = "us-west-1"
  access_key = "AKIAITNNIXIGKA3ZRMJA"
  secret_key = "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"
}

resource "aws_s3_bucket" "hibyebucket04012021" {
  bucket = "hibyebuckbuckbucket"
  acl    = "private"

  tags = {
    Name        = "My bucket"
    Environment = "Dev"
  }
}

resource "aws_s3_bucket_object" "keyobject" {
  bucket = "${aws_s3_bucket.hibyebucket04012021.id}"
  key    = "objectkey.txt"
  source = "./textfiles/index.html"
  etag = filemd5("./textfiles/index.html")
}

variable "myVar"{
	type = string
	default = "Hi!"
}

output "myVarOutput"{
	value = "${var.myVar}"
}

variable "multilinestring"{
	type = "string"
	default = <<EOF
	this is a 
	block of strings
    EOF
}
output "myOutput" {
	value = "${var.multilinestring}"
}

variable "mapheymap" {
	type = "map"
	default = {
	"key1" : "value1"
	"key2" : "value2"
	}
}

output "myoutput" {
	value = "${var.mapheymap}"
}

variable "mylist"{
	type = "list"
	default = ["key1","key2","key3"]
}

output "myoutputlist"{
	value = "${var.mylist}"
}
variable "boolboolbool" {
	default = true
}

output "outputeh" {
	value = "${var.boolboolbool}"
}
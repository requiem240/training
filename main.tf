#

# DO NOT DELETE THESE LINES!

#

# Your subnet ID is:

#

#     subnet-3135ea1c

#

# Your security group ID is:

#

#     sg-57e40c2a

#

# Your AMI ID is:

#

#     ami-c9580bde

#

# Your Identity is:

#

#     datapipe-scorpion

#
variable "aws_access_key" {}

variable "aws_secret_key" {}

variable "aws_region" {
  default = "us-east-1"
}
asdfasdfg
provider "aws" {
  #  access_key = "AKIAJ7OFRJWN75NC52ZQ"
  #  secret_key = "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"
  #  region     = "us-east-1"
  access_key = "${var.aws_access_key}"

  secret_key = "${var.aws_secret_key}"
  region     = "${var.aws_region}"
}

resource "aws_instance" "web" {
  count                  = "1"
  ami                    = "ami-c9580bde"
  instance_type          = "t2.micro"
  subnet_id              = "subnet-3135ea1c"
  vpc_security_group_ids = ["sg-57e40c2a"]

  tags {
    Identity = "datapipe-scorpion"
    tag1     = "tag1"
    tag2     = "tag2"
  }
}

output "public_ip" {
  value = ["${aws_instance.web.*.public_ip}"]
}

output "public_dns" {
  value = ["${aws_instance.web.*.public_dns}"]
}

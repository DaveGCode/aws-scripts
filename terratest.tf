provider "aws" {
  access_key = ""
  secret_key = ""
  region     = "eu-west-1"
}

# resource "aws_instance" "terraform-instance" {
#  ami           = "ami-00035f41c82244dab"
#  instance_type = "t2.micro"
#	tags = {
#	Name = "Terraform-Ubuntu"
#	}
#}
# resource "aws_eip" "ip" {
#	instance = "${aws_instance.terraform-instance.id}"
#}

# resource "aws_s3_bucket" "example" {
  # NOTE: S3 bucket names must be unique across _all_ AWS accounts, so
  # this name must be changed before applying this example to avoid naming
  # conflicts.
#  bucket = ""
#  acl    = "private"
#
#	depends_on = ["aws_s3_bucket.example"]
#}

# Non dependant

resource "aws_instance" "terraform-instance2" {
	ami = "ami-ca0135b3"
	instance_type = "t2.micro"
	tags = {
		Name = "Terraform-RHEL"
	}
	provisioner "local-exec" {
		command = "echo ${aws_instance.terraform-instance2.public_ip} > ip_address.txt"
	}
}

output "ip" {
	value = "${aws_instance.terraform-instance2.public_ip}"
}
output "id" {
	value = "${aws_instance.terraform-instance2.id}"
}
output "tags" {
	value = "${aws_instance.terraform-instance2.tags}"
}

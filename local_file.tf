# Create a file in local machine using terraform

resource "null_resource" "my_file" {
  provisioner "local-exec" {
    command = "echo 'Message: ${upper("The Sample Data!")}' > my_file.txt"
  }
}

# Terraform

This repo narrates the major operations performed terraform. So, first-of-all terraform is a IaC(Infrastructure as a Code) tool to build, change and configure
infrastructures. It uses HCL(Hashicorp Configuration Language) to codify the infrastructure. Terraform follows a declarative approach, where the users only need 
to specify the desired state to be achieved and the rest is done by Terraform itself. This property makes it a convenient automation tool in the DevOps era. 

The major commands used in terraform are:
1.terraform init
2.terraform plan
3.terraform apply
4.terraform destroy

-- init - for initialization
-- plan - for the architecture of the build yet to perform
-- apply - to achieve the desired state
-- destroy - to delete the misconfigured/unwanted resources

  While initializing, terraform automatically creates the necessary plugins under the specified provider to carry out the build processes in a '.Terraform' sub-
 directory. Here, the provider is "aws". And then with further commands, it creates a '.tfstate' file where-in it keeps the track of all the builds and 
 changes done thereby, it makes the reviewing easier.

Some more commands:
-- terraform state list - shows the list of resources provisioned using Terraform
-- terraform state show <resource_id> - shows detatiled information about the particular resource
-- terraform output - shows the exclusively codified output block result

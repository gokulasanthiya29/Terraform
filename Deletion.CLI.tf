C:\Users\santh\OneDrive\Documents\Terraform-Projects>terraform destroy
aws_instance.web: Refreshing state... [id=i-0eb5c361138777a54]

An execution plan has been generated and is shown below.
Resource actions are indicated with the following symbols:
  - destroy

Terraform will perform the following actions:

  # aws_instance.web will be destroyed
  - resource "aws_instance" "web" {
      - ami                          = "ami-04d29b6f966df1537" -> null
      - arn                          = "arn:aws:ec2:us-east-1:907170656532:instance/i-0eb5c361138777a54" -> null
      - associate_public_ip_address  = true -> null
      - availability_zone            = "us-east-1f" -> null
      - cpu_core_count               = 1 -> null
      - cpu_threads_per_core         = 2 -> null
      - disable_api_termination      = false -> null
      - ebs_optimized                = false -> null
      - get_password_data            = false -> null
      - hibernation                  = false -> null
      - id                           = "i-0eb5c361138777a54" -> null
      - instance_state               = "running" -> null
      - instance_type                = "t3.micro" -> null
      - ipv6_address_count           = 0 -> null
      - ipv6_addresses               = [] -> null
      - monitoring                   = false -> null
      - primary_network_interface_id = "eni-0b5e3b4652c5b2735" -> null
      - private_dns                  = "ip-172-31-67-193.ec2.internal" -> null
      - private_ip                   = "172.31.67.193" -> null
      - public_dns                   = "ec2-3-238-180-217.compute-1.amazonaws.com" -> null
      - public_ip                    = "3.238.180.217" -> null
      - secondary_private_ips        = [] -> null
      - security_groups              = [
          - "default",
        ] -> null
      - source_dest_check            = true -> null
      - subnet_id                    = "subnet-75205e7b" -> null
      - tags                         = {} -> null
      - tenancy                      = "default" -> null
      - volume_tags                  = {} -> null
      - vpc_security_group_ids       = [
          - "sg-8c7479be",
        ] -> null

      - credit_specification {
          - cpu_credits = "unlimited" -> null
        }

      - metadata_options {
          - http_endpoint               = "enabled" -> null
          - http_put_response_hop_limit = 1 -> null
          - http_tokens                 = "optional" -> null
        }

      - root_block_device {
          - delete_on_termination = true -> null
          - device_name           = "/dev/xvda" -> null
          - encrypted             = false -> null
          - iops                  = 100 -> null
          - volume_id             = "vol-0cfdf11e3b588cfbb" -> null
          - volume_size           = 8 -> null
          - volume_type           = "gp2" -> null
        }
    }

Plan: 0 to add, 0 to change, 1 to destroy.

Do you really want to destroy all resources?
  Terraform will destroy all your managed infrastructure, as shown above.
  There is no undo. Only 'yes' will be accepted to confirm.

  Enter a value: yes

aws_instance.web: Destroying... [id=i-0eb5c361138777a54]
aws_instance.web: Still destroying... [id=i-0eb5c361138777a54, 10s elapsed]
aws_instance.web: Still destroying... [id=i-0eb5c361138777a54, 20s elapsed]
aws_instance.web: Still destroying... [id=i-0eb5c361138777a54, 30s elapsed]
aws_instance.web: Still destroying... [id=i-0eb5c361138777a54, 40s elapsed]
aws_instance.web: Still destroying... [id=i-0eb5c361138777a54, 50s elapsed]
aws_instance.web: Still destroying... [id=i-0eb5c361138777a54, 1m0s elapsed]
aws_instance.web: Still destroying... [id=i-0eb5c361138777a54, 1m10s elapsed]
aws_instance.web: Destruction complete after 1m13s

Destroy complete! Resources: 1 destroyed.
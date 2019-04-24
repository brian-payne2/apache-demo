# apache-demo
This repo contains sections for both the automated creation, configuration and testing of an Apache web server serving pages over HTTPS in AWS.

### Requirements
* Check the 'Built With' section to ensure you have compatible versions of software dependencies
* These instructions assume that:
  * You have a VPC in AWS with a publicly routable subnet
  * You have created a .PEM file in your account and saved it to your local machine
  * You have the AWS CLI installed and configured with access credentials to create and destroy EC2 instances, IAM roles/policies, read/write S3 and DynamoDB resources
  * It also assumes you have TF configured to use a state file in S3, as well as a DynamoDB table for automated locking of the state file during updates


### Use
These instructions will teach you how to deploy and configure an Apache node in your AWS cloud using Terraform and Ansible.

We will start with deploying the EC2 instance to AWS

1. From the command line, navigate to "terraform" folder contained in this repo
2. Update the values in the provider.tf to point to the state file locations in S3 and DynamoDB.
3. Create a terraform.tfvars to suit your needs:
   - This example was built using the Amazon Linux 2 AMI
4. Initialize the TF repo

   ```$ terraform init```

5. Once the repo initializes successfully, run the TF to deploy the EC2 instance, IAM roles/policies and necessary SGs for connectivity

   ```$ terraform apply```

6. Grab the IP address outputted by the TF to get the public IP of your new EC2 instance

7. Update the host in the Ansible playbook (apache-configure/site.yml) to point to the public IP of your new node

8. The final step is to run the Ansible playbook, replacing PUBLICIP with your new instance's public IP. Note: this step requires connectivity over port 22 to your EC2 instance.

   ```$ ansible-playbook site.yml --private-key=/path/to/master.pem -i PUBLICIP,```

Now you should have an EC2 instance running Amazon Linux 2, with Apache enabled and running, serving traffic over HTTPS via a self-signed certificate!

## Testing
This module was built via Ansible Galaxy and has molecule testing for configuration and idempotence built in. To test, follow these instructions:

   ```$ cd apache-configure```
   ```$ molecule test```

This will run through the full set of tests, and requires you to have all of the necessary components installed and configured on your local machine. This does run the tests through Docker, so ensure you have the necessary Docker modules installed. The test file itself is located in apache-demo/apache-configure/molecule/default/tests/test_default.py

## Built With
* Python 3.6.3
* Ansible 2.7.6
* Molecule 2.19.0
* Terraform 0.11.11
* Docker 18.09.2

## Author
Brian Payne - [brian.payne2@gmail.com](mailto:brian.payne2@gmail.com)

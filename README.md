# efs-connect
Sample script to attach EFS volume during deployment which can be added to Jenkins, TeamCity or Terraform at any point in the deployment to take advantage of EFS as a multi instance volume.  NOTE: This script assumes an EFS volume has already been created within the AWS account. if you haven't, please do so before executing it.

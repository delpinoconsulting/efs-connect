# efs-connect
Sample script to attach EFS volume during deployment which can be added to Jenkins, TeamCity or Terraform at any point in the deployment to take advantage of EFS as a multi instance volume.

It then attaches the volume to a specific mountpoint, and checks to see if the entry exists in etc/fstab. If so, it informs the user, otherwise it'll create the entry automatically.

NOTE: This script assumes an EFS volume has already been created within the AWS account. if you haven't, please do so before executing it.

#!/bin/bash

# Exit on Error
set -e

# Error checking
: ${REGION:?"[ERROR] REGION must be set."}
: ${VOLUME_NAME:?"[ERROR] VOLUME_NAME must be set."}

VOLUME_NAME: Replace here with Volume endpoint assigned by AWS (ex: fs-fxxxxxx)
REGION: replace here with intended deployment region (ex: us-east-1, us-west-2)

#Create folder and mount EFS volume
mkdir -p /mnt/efs
mount -t nfs4 -o nfsvers=4.1,rsize=1048576,wsize=1048576,hard,timeo=600,retrans=2 ${VOLUME_NAME}.efs.${REGION}.amazonaws.com:/ /mnt/efs

#Automount EFS Volume
fstab=/etc/fstab
if [[ $(grep -q "${VOLUME_NAME}.efs.${REGION}.amazonaws.com" "$fstab") ]]
then
    echo "${VOLUME_NAME}.efs.${REGION}.amazonaws.com:/ /mnt/efs nfs4 nfsvers=4.1,rsize=1048576,wsize=1048576,hard,timeo=600,retrans=2,_netdev 0 0" >> /etc/fstab
else
    echo "Entry in fstab exists."
fi

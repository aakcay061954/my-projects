#!/bin/bash



# Check if we are root privilage or not
if [[ ${UID} -ne 0 ]] 
then
        echo 'Please run this script with sudo privillage or as root user'
  exit 1
fi

# Which files are we going to be backed up. Please make sure to exist /home/ec2-user/data folder
BACKUP_FILES="/home/ec2-user/data /etc /boot /opt" 


# Where do we backup them to. Please crete this file before execute this script
DESTINATION="/mnt/backup"

# Create archive filename based on time
TIME=$(date +"%Y_%m_%d_%I_%M_%p")
HOSTNAME=$(hostname -s)
ARCHIVE_FILE="${HOSTNAME}-${TIME}.tgz"

# Print start status message.
echo "We'll back up ${BACKUP_FILES} to ${DESTINATION}/${ARCHIVE_FILE}"
echo


# Backup the files using tar.
tar czf ${DESTINATION}/${ARCHIVE_FILE} ${BACKUP_FILES}


# Print end status message.
echo
echo "Congrutulations! Your Back up is ready"

# Long listing of files in $dest to check file sizes.
ls -lh ${DESTINATION}

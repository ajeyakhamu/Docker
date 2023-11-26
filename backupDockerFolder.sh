#!/bin/bash

####################################
#
# Backup to NFS mount script.
#
####################################

TIME=$(date +%Y_%m_%d)

#srcFolders=(Nginx Downloader)
srcFolders=(Hass_Legacy)
for D in ${srcFolders[*]}; do
#for D in *; do
    if [ -d "${D}" ]; then
        echo "${D}"   # your processing here

        # Archive Filename
        FILENAME=${D}_Archive_$TIME.tar.gz

        # Destination
        DESDIR=/mnt/Others/Docker

        # Print start status message.
        echo "Backing up ${D} to $DESDIR"
        date
        echo

        sudo tar -cpzf $DESDIR/$FILENAME ${D}
    fi
done

# Print end status message.
echo
echo "Backup finished"
date

# Long listing of files in $dest to check file sizes.
ls -lh $DESDIR

#!/bin/bash

# Author: chuck00lin
# Date: 2023-6-18
# Description: version-1.0 

set -e

# Specify the mount point for the USB drive
mount_point="/mnt/usb"

# Specify the document folder to copy from
document_folder="/home/bblab/Documents/tmp"

function check_mount {
    # Check if the USB drive is already mounted
    if mount | grep -q "$mount_point"; then
        echo "USB drive is already mounted."
        return 0
    else
        return 1
    fi
}

function mount_drive {
    # Find the device name of the USB drive
    device="sda2"

    # Print the block devices
    echo "Printing block devices..."
    lsblk
    
    # Check if the device exists
    if lsblk | grep -q "$device"; then
        echo "Block device $device exists."
    else
        echo "Block device $device does not exist. Please check the device name."
        exit 1
    fi

    read -p "Press enter to continue"

    # Create the target directory if it doesn't exist
    sudo mkdir -p "$mount_point"

    # Mount the USB drive
    sudo mount "/dev/$device" "$mount_point"
    echo "USB drive mounted successfully."
}

function copy_files {
    # Copy files from the document folder to the USB drive
    echo "Copying files..."
    cp -rv "$document_folder"/* "$mount_point" && echo "Files copied successfully." || { echo "File copy failed. USB drive remains mounted."; exit 1; }
}

function unmount_drive {
    # Unmount the USB drive if the copy was successful
    sudo umount "$mount_point"
    echo "USB drive successfully unmounted."
}

# Main execution
if check_mount; then
    echo "Proceeding with file copy..."
else
    mount_drive
fi

copy_files
unmount_drive

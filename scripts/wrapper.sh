#!/bin/bash

clear

intro_message=$(cat <<EOF
Duplicacy wrapper script

Currently only supports the duplicacy init command to initialize your storage.
Planning to add all commands in the future.

Currently works with sftp storage only. Planning to add all storage types in the future.

When you initialize a duplicacy repository with the 'init' command, a preferences file is
created in a .duplicacy directory in your current directory.

If you try to initialize any additional repositories from the same directory, you will get
an error message that the directory has already been initialized.

You normally need to change to the directories you want to back up first before initializing a new repository
with the 'init' command because duplicacy will not modify the existing .duplicacy/preferences file.

This bash script allows you to initialize multiple duplicacy repositories from your home
directory without needing to change to the other directories you want to back up.

It will allow you to have one .duplicacy/preferences file in your home directory and eliminate the
need to have a separate .duplicacy/preference file in every directory that you want to back up.

* The Duplicacy CLI needs to be installed and functional via the duplicacy command.
* The sftp server needs to be reachable via an ssh key.
* The backup directory on the sftp server must already exist.
* When prompted for an SSH password, you can leave it blank and hit <enter> if you are using an SSH key only.
* When prompted for the private SSH key, it will normally be in your .ssh directory and named id_rsa.
* Be sure to type in the full path to the private SSH key when prompted.
* When prompted to type a storage password, be sure to remember the password because you can't access your backups without it!

The init command will now be run to initialize sftp storage for a new backup...
EOF
)
echo "$intro_message"

# Function to prompt the user to continue or exit
prompt_continue() {
    read -p "Would you like to continue? (y/n): " choice
    case "$choice" in
        y|Y) return 0 ;;
        n|N) exit ;;
        *) echo "Invalid choice. Please enter y or n." && prompt_continue ;;
    esac
}

# Prompt the user to continue
prompt_continue

# Input variables:

read -p "Enter a name for the storage bucket: " storagename
read -p "Enter the full path to the directory to backup: " repository
read -p "Enter a name for the snapshot ID: " backupid
read -p "Enter the username for the sftp server: " username
read -p "Enter the IP Address or hostname for the sftp server: " servername
read -p "Enter the name of the backup directory on the sftp server: " remotedirectory

# Check for existing preferences file:
file_path=~/.duplicacy/preferences

if [ -f "$file_path" ]; then
mv "$file_path" ~/.duplicacy/oldpreferences

duplicacy init -chunk-size 32M -max-chunk-size 64M -e -storage-name $storagename -repository $repository $backupid sftp://$username@$servername/$remotedirectory

file=~/.duplicacy/preferences

temp_file=$(mktemp)
tail -n +2 "$file" > "$temp_file"
mv "$temp_file" "$file"

file=~/.duplicacy/oldpreferences
temp_file=$(mktemp)
head -n -2 "$file" > "$temp_file"
mv "$temp_file" "$file"
echo "    }," >> "$file"

source_file=~/.duplicacy/preferences
destination_file=~/.duplicacy/oldpreferences

cat "$source_file" >> "$destination_file"
mv "$destination_file" "$source_file"

else

duplicacy init -e -storage-name $storagename -repository $repository $backupid sftp://$username@$servername/$remotedirectory

fi

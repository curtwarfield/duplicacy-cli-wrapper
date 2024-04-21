# Duplicacy CLI wrapper

## Introduction

[Duplicacy](https://duplicacy.com) is a cross-platform cloud backup tool with client-side encryption and fast performance.

* Available as a web-based GUI or a command line tool.
* Excellent performance with [Lock Free Deduplication](https://github.com/gilbertchen/duplicacy/wiki/Lock-Free-Deduplication).
* Extensive [storage](https://forum.duplicacy.com/t/supported-storage-backends/1107) backend support.
* A software license is required but the **command-line interface** (CLI) version is free for personal use.

Currently works with `sftp` storage only. Planning to add all storage types in the future.

When you initialize a repository with the `init` command, a preferences file is created in a `.duplicacy` directory in your current directory.

If you run the `init` commmand again to create a new repository, you will get an error message that the directory has already been initialized.

That's because you normally need to change to the other directory you want to back up **before** running the `init` command since the `duplicacy init` command will not modify an existing `.duplicacy/preferences` file.

## Requirements

* The Duplicacy CLI needs to be installed and functional via the 'duplicacy' command.
* The `sftp` server needs to be reachable via an `ssh` key.
* The backup directory on the sftp server must already exist.
* When prompted for an SSH password, you can just hit `<enter>` since you are using SSH keys.
* When prompted for the private SSH key, it will normally be in your .ssh directory and named id_rsa
* Be sure to type in the full path to the private SSH key when prompted.
* When prompted to type in a password for the storage, it's important to remember the password.

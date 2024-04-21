# Duplicacy CLI wrapper script

## Introduction

[Duplicacy](https://duplicacy.com) is a cross-platform cloud backup tool with client-side encryption and fast performance.

* Available as a web-based GUI or a command line tool.
* Excellent performance with [Lock Free Deduplication](https://github.com/gilbertchen/duplicacy/wiki/Lock-Free-Deduplication).
* Extensive [storage](https://forum.duplicacy.com/t/supported-storage-backends/1107) backend support.
* A software license is required but the **command-line interface** (CLI) version is free for personal use.

## Features
* Automatically creates and runs the **duplicacy** `init` command for `sftp` storage backends.

* Creates a single `.duplicacy/preferences` file for multiple backups.

> When you run the `init` command, a preferences file is created in a `.duplicacy` directory in the current directory. When you try to run the `init` command again to initialize another repository,
> you will get an error message that the directory has already been initialized.

> Normally you must first change to the directory you want to back up before running the `init` command again because **Duplicacy** will not modify an existing `.duplicacy/preferences` file.

* Allows you to initialize multiple **duplicacy** repositories from your home
directory without needing to change to the other directories first.

## Planning
* Additional storage backends will be supported in the future.

* Additional commands will be supported in the future.
## Requirements

* The `duplicacy` CLI package needs to be installed and functional via the `duplicacy` command.
* The `sftp` server needs to be reachable via an `ssh` key.
* The backup directory on the `sftp` server must already exist.
* When prompted for an `SSH` password, you can leave it blank and hit `<enter>` if you are using an `SSH` key only.
* When prompted for the private `SSH` key, it will normally be in your `.ssh` directory and named `id_rsa`.
* Be sure to type in the full path to the private `SSH` key when prompted.
* When prompted to type a storage password, be sure to remember the password because you can't access your backups without it!

## Getting started
The wrapper script is written in `bash` and simply just needs to be downloaded and made executable.

## Contribute
Contributions are always welcome. Feel free to improve existing features, add new features or report issues.

## License
Duplicacy-cli-wrapper is licensed under the MIT License.

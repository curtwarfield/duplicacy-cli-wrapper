# Duplicacy repository initialization

Currently works with `sftp` storage only. Planning to add all storage types in the future.

When you initialize a repository with the `init` command, a preferences file is created in a `.duplicacy` directory in your current directory.

If you run the `init` commmand again to create a new repository, you will get an error message that the directory has already been initialized.

You normally need to change to the directory you want to back up before running the `init` command because **duplicacy** will not modify the existing `.duplicacy/preferences` file.
## Set Up

Running the container is easy. Fire up the container as usual. You can set which port it runs on.

    docker run -d --restart unless-stopped --name pluto-for-channels -p 8080:80 jonmaddox/pluto-for-channels

You can retrieve the playlist and EPG via the status page.

    http://127.0.0.1:8080

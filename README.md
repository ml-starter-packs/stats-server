# stats-server
RStudio + RShiny

# Set up

Quickstart:
```sh
make run
```


By default you will log in as
```sh
admin
changethispassword
```

(you should change this password in `add_users.sh` before running `make run` and potentially add more users)

## Terminal
You may notice the terminal output looks incorrect (unless you are running with GPUs as described below)
Under Terminal > Terminal Options, deselect _Hardware Acceleration_.


## Adding Users
Refer to `/tmp/add_users.sh` to see how to create users with home directories.
In short, run `useradd -m -g users <username>` to create the user and `passwd <username>` to set their password.
Once added using the Terminal from the admin's RStudio session, other users will be able to log in.

By default, the `admin` user has `sudo` privileges.
You can use standard UNIX users/groups organization to assign your users to various groups and manage file permissions that way.


## GPU Support
You must build this image from an nvidia docker base that is associated with compatible drivers on your system.
Then you can pass `--gpus all` to your `make run` command and have access to your GPUs.


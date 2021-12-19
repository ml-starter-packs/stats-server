# stats-server
RStudio + RShiny

# Prerequesites

`make` and `docker` are presumed to already exist on your system.

# Set up

Quickstart:
```sh
make run
```

And access RStudio at `http://<your-ip-or-localhost>:8787` (with RShiny running on `3838`).

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


## Data Persistence
(WORK IN PROGRESS, PLEASE OPEN ISSUES IF YOU NEED HELP)
`make run` by default runs an emphemeral container for demonstration purposes only.
Before doing any work inside this environment, you need to make sure your user's data will persist.
Fortunately you can do this by creating a local `home` directory and bind-mounting `./home:/home/` into the container and (optionally) run it without the `--rm` flag.
If you run this container emphemerally (with `--rm`), for users to persist, you will also need to bind-mount the files that define users.

## Integration with Jupyterhub
(POTENTIAL FUTURE ADD-ON)
The maintainer of this project has (in the past) successfully managed to set up Jupyterhub to manage users and proxy traffic to an RStudio server that runs in isolation for each user (as opposed to this project which runs one RStudio server for all users to share).
If you are interested in this use case (perhaps managing an environment where Jupyter notebooks and RStudio are used by members of the same research team), please open an issue in [ml-starter-packs/jupyterhub-deploy-docker](https://github.com/ml-starter-packs/jupyterhub-deploy-docker/issues/).


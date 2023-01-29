# README

## Installation of the server

### Database

This server is using a PostgreSQL Alpine database and the safest and fastest way to install one is to use podman in the userspace. 

```bash
podman run -dti --name postgresql-green-house -e POSTGRES_PASSWORD=postgres -p 5432:5432 postgres:alpine
```

And then to create a service file in the user space to have the service constantly running:

```bash
mkdir -p ~/.config/systemd/user
podman generate systemd postgresql-green-house --name > ~/.config/systemd/user/container-postgresql-green-house.service
```

To manually start the service during the current machine instance:

```bash
systemctl --user start container-postgresql-green-house.service
```

And to start the service every time after a system reboot:

```bash
systemctl --user enable container-postgresql-green-house.service --now
loginctl enable-linger $USER
```

### Development

To setup ruby [`asdf`](https://asdf-vm.com/) is going to be used, which is a universal version-managemnt tool. 

To install ruby on an Ubuntu 22.04 machine we need to install dependencies:

```bash
sudo apt update && \
    sudo apt upgrade && \
    sudo apt install libyaml-dev libedit-dev libffi-dev curl git
```

And then we're going to install `asdf` and install ruby `3.2.0`. The last step takes a few minutes as it is going to compile ruby from source.

```bash
git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.11.1
echo '. "$HOME/.asdf/asdf.sh"' >> ~/.bashrc
echo '. "$HOME/.asdf/completions/asdf.bash"' >> ~/.bashrc
source ~/.bashrc
asdf plugin add ruby
asdf install ruby 3.2.0
```

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

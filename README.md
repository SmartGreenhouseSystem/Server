# README

## Installation of the server

### Database

This server is using a PostgreSQL Alpine database and the safest and fastest way to install one is to use podman in the userspace. 

```bash
podman run -dti --name postgresql-green-house -e POSTGRES_PASSWORD=postgres -p 5432:5432 postgres:alpine
```

### Redis

For fast cache for devices redis is used.

```bash
podman run -dti --name redis-green-house -p 6379:6379 redis:alpine
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

### Ruby


#### ASDF
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

Eventually, instead of running `asdf install ruby 3.2.0` one can cd into the root of the project and just run `asdf install` which will install the required version of ruby.

#### Rubocop VScode

Additionally, under VScode, one can install [`ruby-rubocop`](https://marketplace.visualstudio.com/items?itemName=misogi.ruby-rubocop), run `gem install rubocop` and open their user settings JSON file and paste: `"ruby.rubocop.executePath": "/home/USERNAME/.asdf/shims/` where `USERNAME` is replaced with their username.

### Development

To install the dependencies in the project:

```
bundle
```

And to steup the database:

```
rails db:setup
```

## Up and running

After the database has been created you can start the server by running:

```bash
rails s
```

And access the server by going to:

```bash
localhost:3000
```

Optionally you can access the console by running:

```bash
rails c
```

# README

## Installation of the server


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

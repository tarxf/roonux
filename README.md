# roonux
A headless Roon Core (roonserver) running on a virtual machine.

## What is Roon?

Roon is a digital audio delivery solution (subscription required) that can stream your high resolution files to devices in your network. [See how it works](https://roonlabs.com/howroonworks).

roonux is the Roon Core (server part) and the Roon application in either a desktop or mobile device will be required to play your library.

## Why roonux?

Why Gamora? Good question. This repo contains the recipe to get it up and running in a virtualized environment, solve the dependencies, fix the runtime permissions and add persistent firewall rules; just for it to become visible to your Roon control application.

### Options to roonux

I have only tested the Roon app running in OSX, the rest of the options have not been tested.

1. Roon application running in a desktop computer
1. The [ROCK](https://kb.roonlabs.com/ROCK:_Getting_Started)
1. [docker-roon](https://github.com/dubo-dubon-duponey/docker-roon)

## Pre-requisites

It might be useful to know in advance that this [How-To](https://computingforgeeks.com/how-to-install-vagrant-and-virtualbox-on-fedora/) guide that provides the Vagrant & Virtualbox setup on Fedora. A non-Fedora Host OS could be used provided the requirements below are met.

1. A host computer that can provide:
    1. 2 cores and 2GB of RAM
    1. A network interface connected to the internet
1. A [Roon control](https://roonlabs.com/downloads) (application) to play music
1. [Vagrant](https://www.vagrantup.com/), the virtual machine manager; and Virtualbox with the extension pack
1. A CIFS/SMB network share with your files

## Installation Steps

Execute the following instructions in the host machine in order to bring up the roonux virtual machine.

### On the Host Machine

1. Clone this repository

    `git clone https://github.com/tarxf/roonux.git`

1. Enter roonux

    `cd roonux`

1. Bring up the virtual machine, it might ask which network interface can be used for bridging the VM out, select the interface that is connected to the network

    `vagrant up --provider virtualbox`

Shall you require advanced configuration or troubleshooting of roonux, you can `vagrant ssh` into it. No instructions are currently provided to persist the VM across host reboots, shall you reboot your host machine then you'll need to `cd roonux && vagrant up` to bring it up again.

### On the Roon Control

You may have installed the Roon control application in either a desktop computeror smartphone/tablet, any of those will help for viewing and configuring the Roon Core.

1. Open the Roon application on your computer/device
1. If this is the first time you bring up the application, it will directly scan for a Roon Core and roonux should appear as an option
1. if you have an existing Roon Core and want to see roonux, go to settings and disconnect from the current Roon Core, roonux should appear as an option
1. Select roonux, login with your account
![Choose Roon Core](img/choose-roon-core.jpg?raw=true "Choose Roon Core")
1. Go to settings, storage, add a network share (from the dropdown menu)
![Network Share Location](img/network-share.jpg?raw=true "Network Share")
1. Enter your CIFS/SMB details and save 
1. Watch the Roon Core import your library
1. Play music

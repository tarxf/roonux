# roonux
A headless Roon Core (roonserver) running on a virtual machine.

## What is Roon?

Roon is a digital audio delivery solution (subscription required) that can play your high resolution files to one or multiple endpoints, integrating it selected music subscriptions. [See how it works](https://roonlabs.com/howroonworks).

roonux will play the Roon Core (server part) and the Roon control will be required in order to play from the library. See more in the pre-requisites section.

## Why roonux?

Why Gamora? Good question. This repo contains the recipe to get it up and running in a virtualized environment, solve the dependencies, fix the runtime permissions and add persistent firewall rules; just for it to become visible to your Roon control application.

## Pre-requisites

While pre-requisites are listed below, I found this [How-To](https://computingforgeeks.com/how-to-install-vagrant-and-virtualbox-on-fedora/) that gets you Vagrant & Virtualbox setup on Fedora in the same set of instructions.

1. A machine to host the virtual machine. The virtual machine will require:
    1. 2 cores and 2GB of RAM
    1. A network interface visible by the Roon application
1. A [Roon control](https://roonlabs.com/downloads) (application) to play music
1. [Vagrant](https://www.vagrantup.com/)
1. Virtualbox with the extension pack
1. A CIFS/SMB network share with your files

## Installation Steps

Execute the following instructions in the host machine in order to bring up the roonux virtual machine.

### On the Host Machine

1. Clone this repository
    git clone https://github.com/tarxf/roonux.git
1. Enter roonux
    cd roonux
1. Bring up the virtual machine, it might ask which network interface can be used for bridging the VM out, select the interface that is connected to the network
    vagrant up --provider virtualbox

Shall you require advanced configuration or troubleshooting of roonux, you can `vagrant ssh` into it. No instructions are currently provided to persist the VM across host reboots, shall you reboot your host machine then you'll need to `cd roonux && vagrant up` to bring it up again.

### On the Roon Control

You may have installed the Roon control application in either a desktop computeror smartphone/tablet, any of those will help for viewing and configuring the Roon Core.

1. Open the Roon application on your computer/device
1. If this is the first time you bring up the application, it will directly scan for a Roon Core and roonux should appear as an option
1. if you have an existing Roon Core and want to see roonux, go to settings and disconnect from the current Roon Core, roonux should appear as an option
1. Select roonux, login with your account
1. Go to settings, storage, add a network share (from the dropdown menu)
1. Enter your CIFS/SMB credentials
1. Watch the Roon Core import your library

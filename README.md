# packer-xenial-redis-ec2
An EC2 AMI based on ubuntu xenial with Redis

# Prerequisites
## Install packer
Grab packer and learn how to install it from [here](https://www.packer.io/intro/getting-started/install.html).

## Install aws-cli
Grab aws-cli and learn how to install it from [here](https://docs.aws.amazon.com/cli/latest/userguide/cli-chap-welcome.html).

## Install kitchen
ToDo

# How to build

    packer build template.json
    

# How to test
ToDO
    


# Purpose

This repository attempts to store the minimum amount of code that is required to create a:
- Ubuntu Xenial64 box
- With Redis running in development mode
- using Packer
- for Amazon AWS EC2

# To Do
- [ ] add kitchen install instructions
- [ ] create kitchen test
- [ ] add kitchen test to makefile

# Done
- [x] add nginx to box
- [x] add redis to box
- [x] create json template file
- [x] build initial readme

# terraform-homelab
## Overview
This project contains all of the terraform code for my homelab. The focus is now on AWS, but some legacy vsphere code does exist for reference.

This repo calls on config found in my [ansible-homelab](https://github.com/reschouw/ansible-homelab) and [packer-homelab](https://github.com/reschouw/packer-homelab) repos to spin up and configure instances.

### Major projects:

 - **aws-instance module**: Creates an aws instance (spot or on-demand) with built-in features like automated Ansible runs, auto-recovery, persistent public IPs, DNS entries, and alerts. 
 - **Multi-node Kubernetes cluster**: Used to host the majority of services running in the homelab. Workers built on a spot fleet.
 -  **NAT instance config & routing**: To avoid having to pay for the AWS NAT Gateway service, I've spun up my own NAT instance
 - **vshpere-instance module**: A mostly functional but depreciated module for spinning up vms in vsphere. `:

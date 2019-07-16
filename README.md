# ansible-playbook
A CentOS 7 based container that is capable of running ansible playbooks. Ansible is provided from the EPEL repository.

## Description
This repository contains the dockerfile for running ansible playbooks. The default entrypoint is `ansible-playbook` itself. You can provide parameters from docker on the command line, and mount in any relevant files such as SSH keys, inventory files, repositories containing the playbook you want to run etc.

# ansible-playbook
A CentOS 7 based container that is capable of running ansible playbooks.

## Description
This repository contains the dockerfile for running ansible playbooks. The default entrypoint is `ansible-playbook` itself. You can provide parameters from docker on the command line, and mount in any relevant files such as SSH keys, inventory files, repositories containing the playbook you want to run etc. In order to facilitate mounting of SSH keys, this container runs under UID 1000, GID 1000.

## Running

To run a playbook from your local machine with the docker container, you could do the following:

```console
stephen@my-pc:~$ sudo docker run --rm -v ~/workspace/openshift-centos-playbooks:/home/ansible/openshift-centos-playbooks -v ~/.ssh:/home/ansible/.ssh:ro -v ~/Documents/all-machines-inventory:/home/ansible/inventory -e ANSIBLE_HOST_KEY_CHECKING=False stephen001/ansible-playbook:latest -i /home/ansible/inventory -u stephen /home/ansible/openshift-centos-playbooks/playbooks/os-update.yml
```

Note the need for disabling host key checking, as your container will not have seen the inventory hosts before.

## Extra Dependencies

Ansible playbooks sometimes require extra dependencies to operate correctly. This image can be extended to install extra dependencies. The following additional dependencies are included by default:

 * pyOpenSSL
 * python-lxml
 * python-cryptography
 * python-junitxml

This dependency set will allow you to use the image as part of CI builds, testing ansible playbooks and capturing their output as Junit results via (junit callback plugin)[https://docs.ansible.com/ansible/2.5/plugins/callback/junit.html]. Similarly, these dependencies will allow you to run most basic Openshift ansible playbooks for general system administration of an Openshift cluster.

FROM centos:centos7
RUN yum clean all && \
    yum install -y epel-release && \
    yum install -y ansible openssh-clients && \
    yum clean all
RUN groupadd -g 1000 ansible && \
    useradd ansible -m -u 1000 -g ansible
USER ansible:ansible
WORKDIR /home/ansible
ENTRYPOINT ["ansible-playbook"]

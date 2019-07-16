FROM centos:centos7
RUN yum clean all && \
    yum install -y epel-release && \
    yum install -y ansible && \
    yum clean all
ENTRYPOINT ["ansible-playbook"]

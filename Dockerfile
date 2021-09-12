FROM centos:7
RUN rpm --import /etc/pki/rpm-gpg/RPM-GPG-KEY-CentOS-7
RUN yum update -y && \
    yum install -y createrepo yum-utils && \
    yum clean all
RUN sed -i.backup 's/^enabled=1/enabled=0/' /etc/yum/pluginconf.d/fastestmirror.conf
COPY Centos-7.repo /etc/yum.repos.d/CentOS-Base.repo
COPY run.sh /centos-mirror-docker/run.sh
RUN chmod 755 /centos-mirror-docker/run.sh
RUN mkdir -p /var/www/html/repos/{base,centosplus,extras,updates}
WORKDIR /centos-mirror-docker


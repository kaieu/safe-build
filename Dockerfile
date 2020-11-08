FROM centos:centos7

ENV https_proxy "http://real-proxy0.tyo.jprs.co.jp:8091" 
ENV http_proxy ${https_proxy}

RUN yum update && yum clean all

RUN yum groupinstall -y "Development Tools" 
RUN yum install -y mesa-libGL-devel \
  apr-devel \
  subversion-devel \
  qt5-qtbase-devel \
  git
WORKDIR /root
RUN git clone https://github.com/svn-all-fast-export/svn2git.git
WORKDIR /root/svn2git/src
RUN qmake-qt5
RUN make

FROM centos:latest

RUN yum -y update
RUN yum -y upgrade
RUN yum -y install epel-release
RUN yum -y groupinstall "Development Tools"
RUN yum -y install wget
RUN yum -y install libmpc libmpc-devel
RUN yum -y install mpfr mpfr-devel
RUN yum -y install gmp gmp-devel gmp-static
RUN yum -y install texinfo

RUN mkdir /tmp/build

ADD build.sh /tmp/build.sh

CMD /tmp/build.sh

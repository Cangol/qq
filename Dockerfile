FROM openjdk:8-jdk
MAINTAINER Cangol  wxw404@gmail.com

RUN apt-get --quiet update --yes
RUN apt-get install perl-modules --yes
RUN apt-get install libssl-dev --yes
RUN apt-get install libnet-ssleay-perl --yes
RUN apt-get install libcrypt-ssleay-perl --yes
RUN apt-get install python-yaml --yes
RUN apt-get install build-essential --yes

RUN cpan -i App::cpanminus
RUN cpanm Mojo::Webqq

FROM openjdk:8-jdk
MAINTAINER Cangol  wxw404@gmail.com

RUN apt-get --quiet update --yes
RUN apt-get install perl-modules --yes
RUN apt-get install libssl-dev --yes
RUN apt-get install libnet-ssleay-perl --yes
RUN apt-get install libcrypt-ssleay-perl --yes
RUN apt-get install python-yaml --yes
RUN apt-get install build-essential --yes
RUN apt-get install libcrypt-openssl-bignum-perl libcrypt-openssl-rsa-perl

RUN cpan -i App::cpanminus
RUN cpanm Mojo::Webqq
RUN cpanm Webqq::Encryption


ENV MOJO_WEBQQ_ACCOUNT=136454424
ENV MOJO_WEBQQ_PWD=3ba2686692af81a34a230c25d2f728ca
ENV MOJO_WEBQQ_LOGIN_TYPE=login

EXPOSE 5000
CMD perl -MMojo::Webqq -e 'Mojo::Webqq->new(log_encoding=>'utf8')->load('ShowMsg','UploadQRcode')->load('Openqq',data=>{listen =>[port=>5000}]})->run()'

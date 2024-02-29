#!/bin/sh

[ ! -f sqldeveloper-*.noarch.rpm ] && echo 'sqldeveloper-<version>.noarch.rpm not found' && exit 1

sqldeveloper=$(ls -1 sqldeveloper-*.noarch.rpm | sort -rV | head -1)

cat <<EOF > Dockerfile
FROM oraclelinux:9

COPY $sqldeveloper /tmp/
RUN dnf install java-11-openjdk java-11-openjdk-devel desktop-file-utils file

RUN rpm -Uhv /tmp/$sqldeveloper

CMD sqldeveloper

EOF


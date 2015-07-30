FROM debian:jessie
MAINTAINER Joeri Verdeyen <joeriv@yappa.be>

ENV TMPFS_PATH /tmpfs

ADD run.sh /run.sh
RUN chmod +x /run.sh
VOLUME ["/var/www", "/vendor", "/tmpfs"]
CMD ['/run.sh']
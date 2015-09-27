#
# aptly server Dockerfile
#
# https://github.com/
#

# Pull base image.
FROM debian:jessie

MAINTAINER hihouhou < hihouhou@hihouhou.com >

# Update & install packages for aptly
RUN apt-get update && \
    apt-get install -y aptly


#Configure graphite-carbon
ADD .aptly.conf /root/


VOLUME ["/mnt/.aptly"]

EXPOSE 80 

CMD ["/usr/bin/aptly", "-listen=:80","-config=/.aptly.conf"]

############################################################
# Dockerfile to run Domino server
############################################################
FROM ubuntu:14.04
MAINTAINER Nick Heinemans (nick@hostlogic.nl)
ENV DEBIAN_FRONTEND=noninteractive
ADD DOMINO_9.0.1_64_BIT_LIN_XS_EN.tar /tmp 
RUN useradd -d /local/notesdata notes \
&& echo "notes:notes" | chpasswd \
&& bash -c "/tmp/linux64/domino/install -silent -options /tmp/linux64/domino/unix_response.dat" \
&& rm -Rf /tmp/linux64
ADD start.sh /
ENTRYPOINT ["/start.sh"]

############################################################
# Dockerfile to run Domino server
############################################################
FROM ubuntu:14.04
MAINTAINER Nick Heinemans (nick@hostlogic.nl)
ENV DEBIAN_FRONTEND=noninteractive
ADD /media/sf_Desktop/linux64 /tmp
#ADD DOMINO_9.0.1_64_BIT_LIN_XS_EN.tar /tmp 
#RUN apt-get update \
#  && apt-get -y install wget \
#  && cd /tmp \
#  && tar -xf DOMINO_9.0.1_64_BIT_LIN_XS_EN.tar 
 
RUN useradd -d /local/notesdata notes \
 && echo "notes:notes" | chpasswd \
 && bash -c "/tmp/linux64/DominoEval/install -silent -options /tmp/linux64/DominoEval/unix_response.dat" \
 && rm -Rf /tmp/linux64
ADD start.sh /
ENTRYPOINT ["/start.sh"]

FROM debian:12
LABEL description="SSHD"
RUN mkdir -p /etc/apt
COPY sources.list /etc/apt/sources.list
COPY startup.sh /
RUN chmod 755 /startup.sh
RUN apt update
RUN apt install -y openssh-server

EXPOSE 22
ENTRYPOINT ["nohup", "/startup.sh"]


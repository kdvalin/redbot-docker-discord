FROM registry.access.redhat.com/ubi8:8.8-1009

RUN dnf -y update
RUN dnf -y install python39 python39-devel java-11-openjdk-headless nano git

RUN alternatives --set java "java-11-openjdk.$(uname -i)"

RUN mkdir /opt/redbot
WORKDIR /opt/redbot

RUN python3 -m venv venv
RUN source venv/bin/activate

RUN python3 -m pip install -U pip wheel
RUN python3 -m pip install -U Red-DiscordBot

RUN mkdir /.config
RUN chmod -R 777 /opt/redbot
RUN chmod 777 /.config

ENV INAME "redbot"
ENV BOT_TOKEN ""
ENV PREFIX "!"
ENV OWNER ""

COPY run.sh /bin
RUN chmod 755 /bin/run.sh

ENTRYPOINT [ "/bin/run.sh" ]
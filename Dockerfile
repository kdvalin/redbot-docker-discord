FROM registry.access.redhat.com/ubi9/ubi-init

RUN dnf -y update
RUN dnf -y install python3-pip java-17-openjdk-headless nano git

RUN alternatives --set java "java-17-openjdk.$(uname -i)"

RUN mkdir /opt/redbot
WORKDIR /opt/redbot

RUN python3 -m venv venv
RUN source venv/bin/activate

RUN python3 -m pip install -U pip wheel

ENV INAME "redbot"
ENV BOT_TOKEN ""
ENV PREFIX "!"
ENV OWNER ""

COPY run.sh /bin
RUN chmod 755 /bin/run.sh

ARG RED_VERS
RUN python3 -m pip install -U Red-DiscordBot==${RED_VERS}

RUN mkdir /.config
RUN chmod -R 777 /opt/redbot
RUN chmod 777 /.config


ENTRYPOINT [ "/bin/run.sh" ]

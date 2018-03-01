FROM procraft/alpine-openjdk-grcat

LABEL maintainer="Procraft Team"

ENV sbtVersion=1.1.0-r0 \
    WORK_DIR=/opt/app \
    IVY_DIR=/opt/ivy \
    SBT_DIR=/opt/sbt

# install sbt
RUN echo "http://nl.alpinelinux.org/alpine/edge/testing" >> /etc/apk/repositories && \
    apk --update add sbt=${sbtVersion} && \
    rm -rf /var/cache/apk/* && \
    rm -rf /tmp/* && \
    rm -rf /var/log/* && \
    mkdir -p $WORK_DIR /usr/local/share/grc

COPY grc.sbt.conf /usr/local/share/grc/sbt.conf
COPY sbt-color /usr/local/bin/
COPY sbtopts /etc/sbt/

WORKDIR $WORK_DIR

VOLUME $WORK_DIR $IVY_DIR $SBT_DIR

ENTRYPOINT [ "/usr/local/bin/sbt-color" ]

CMD [ "run" ]

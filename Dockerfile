FROM srakshit/alpine-base

MAINTAINER Subham Rakshit

ENV JANUSGRAPH_HOME="/opt/janusgraph" \
    JANUSGRAPH_VERSION="0.1.1" \
    PATH=$PATH:$JANUSGRAPH_HOME/bin

ADD ./janusgraph-* /opt/

RUN apk --no-cache add libarchive-tools

RUN curl -L https://github.com/JanusGraph/janusgraph/releases/download/v0.1.1/janusgraph-${JANUSGRAPH_VERSION}-hadoop2.zip | bsdtar -xf- -C /opt/ \
    && ln -s /opt/janusgraph-${JANUSGRAPH_VERSION}-hadoop2 $JANUSGRAPH_HOME \
    && addgroup janusgraph \
    && adduser -S -G janusgraph janusgraph \
    && chown janusgraph:janusgraph -R /opt/janusgraph* \
    && chmod 754 /opt/janusgraph*

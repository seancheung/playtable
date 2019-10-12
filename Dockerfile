FROM seancheung/alpinewine:wine
LABEL maintainer="Sean Cheung <theoxuanx@gmail.com>"

ARG VPT_URL=https://virtualplaytable.com/download/vpt0952setup.exe
ARG CN_MIRROR=false
RUN if [ "$CN_MIRROR" = true ]; then sed -i 's/dl-cdn.alpinelinux.org/mirrors.aliyun.com/g' /etc/apk/repositories; fi

ENV VPT_DIR=/var/opt/vpt

RUN set -ex && \
    echo "Installing temp dependencies..." && \
    apk add --no-cache --virtual TMP curl innoextract && \
    echo "Downloading vpt binary from $VPT_URL..." && \
    curl -L -o /tmp/vptsetup.exe "$VPT_URL" && \
    echo "Decompressing file..." && \
    innoextract -e -d/tmp/vptsetup -m /tmp/vptsetup.exe && \
    mkdir -p "$VPT_DIR" && \
    echo "Copying files..." && \
    rm -rf /tmp/vptsetup/app/jre /tmp/vptsetup/app/*.qm && \
    cp -rf /tmp/vptsetup/app/* "$VPT_DIR" && \
    echo "Clean Up..." && \
    apk del TMP && \
    rm -rf /tmp/* && \
    rm -rf /var/cache/apk/*

COPY playtable.conf /etc/supervisor/conf.d/

EXPOSE 4754 4754/udp
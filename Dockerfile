ARG ALPINE_VERSION=3.11

FROM alpine:${ALPINE_VERSION}

LABEL maintainer="Lucca Pessoa da Silva Matos - luccapsm@gmail.com" \
        org.label-schema.version="1.0.0" \
        org.label-schema.release-data="2020-03-26" \
        org.label-schema.url="https://github.com/lpmatos" \
        org.label-schema.alpine="https://alpinelinux.org/" \
        org.label-schema.helm="https://helm.sh/docs/" \
        org.label-schema.name="Slack Integration with BotKube" 

ENV HOME=/usr/src/code

RUN apk update && apk add --update --no-cache \
        curl=7.67.0-r0 \
        openssl=1.1.1d-r3 \
        bash=5.0.11-r1  && \
    curl -LO https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubectl && \
    chmod +x ./kubectl && \
    mv ./kubectl /usr/local/bin/kubectl && \
    mkdir -p /root/.kube && mkdir -p ${HOME} && \
    curl https://raw.githubusercontent.com/helm/helm/master/scripts/get-helm-3 | bash

WORKDIR ${HOME}

COPY [ "./code", "." ]

RUN find ./ -iname "*.sh" -type f -exec chmod a+x {} \; -exec echo {} \;;

ENTRYPOINT []

CMD [ "sh", "./run.sh" ]

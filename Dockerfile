FROM python:3-alpine

ENV AWSCLI1_LATEST_VERSION="1.18.30"
RUN pip install -q awscli==${AWSCLI1_LATEST_VERSION}

ENV HELM_LATEST_VERSION="v3.1.2"
RUN apk add --no-cache ca-certificates \
 && wget -q https://get.helm.sh/helm-${HELM_LATEST_VERSION}-linux-amd64.tar.gz \
 && tar -xf helm-${HELM_LATEST_VERSION}-linux-amd64.tar.gz \
 && mv linux-amd64/helm /usr/local/bin \
 && rm -rf /helm-${HELM_LATEST_VERSION}-linux-amd64.tar.gz linux-amd64/

ENV KUBE_LATEST_VERSION="v1.18.0"
RUN apk add --no-cache ca-certificates \
 && wget -q https://storage.googleapis.com/kubernetes-release/release/${KUBE_LATEST_VERSION}/bin/linux/amd64/kubectl -O /usr/local/bin/kubectl \
 && chmod +x /usr/local/bin/kubectl

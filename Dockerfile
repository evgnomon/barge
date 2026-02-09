FROM ghcr.io/evgnomon/ark:main

ENV ANSIBLE_COLLECTIONS_PATH=/opt/ansible/collections
ENV CATAMARAN_VERSION=v0.2.9
ENV EGET_VERSION=v1.3.4

RUN pip install catamaran==${CATAMARAN_VERSION} hcloud poetry \
  && ansible-galaxy collection install evgnomon.catamaran --collections-path ${ANSIBLE_COLLECTIONS_PATH} \
  && go install github.com/zyedidia/eget@${EGET_VERSION} \
  && go install github.com/digitalocean/doctl/cmd/doctl@latest

COPY evgnomon.asc /etc/apt/trusted.gpg.d/
COPY evgnomon.sources /etc/apt/sources.list.d/

RUN apt-get update && apt-get install -y mkdeb=0.2.1

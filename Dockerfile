FROM ghcr.io/evgnomon/ark:main

ENV ANSIBLE_COLLECTIONS_PATH=/opt/ansible/collections
ENV CATAMARAN_VERSION=v0.1.38
ENV EGET_VERSION=v1.3.4

RUN pip install catamaran==${CATAMARAN_VERSION} hcloud poetry \
  && ansible-galaxy collection install evgnomon.catamaran --collections-path ${ANSIBLE_COLLECTIONS_PATH} \
  && go install github.com/zyedidia/eget@${EGET_VERSION} \
  && go install github.com/digitalocean/doctl/cmd/doctl@latest


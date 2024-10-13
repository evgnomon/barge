FROM ghcr.io/evgnomon/ark:main

ENV ANSIBLE_COLLECTIONS_PATH=/opt/ansible/collections
RUN pip install catamaran==v0.1.11 poetry \
  && ansible-galaxy collection install evgnomon.catamaran --collections-path /opt/ansible/collections

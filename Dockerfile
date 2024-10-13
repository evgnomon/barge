FROM ghcr.io/evgnomon/ark:main

RUN pip install catamaran==v0.1.6 poetry \
  && ansible-galaxy collection install evgnomon.catamaran

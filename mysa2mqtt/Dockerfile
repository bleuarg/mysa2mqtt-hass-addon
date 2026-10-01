# https://developers.home-assistant.io/docs/add-ons/configuration/#add-on-dockerfile
# Supervisor >= 2026.04.0 no longer provides BUILD_FROM; pin the base image here.
FROM ghcr.io/home-assistant/base:3.24-2026.08.0

# Set mysa2mqtt version
ARG mysa2mqttRevision=1.2.2

# Install requirements for add-on
RUN \
  apk add --no-cache \
    nodejs \
    npm

RUN npm install -g "mysa2mqtt@${mysa2mqttRevision}"

# Copy data for add-on
COPY run.sh /
RUN chmod a+x /run.sh

CMD [ "/run.sh" ]

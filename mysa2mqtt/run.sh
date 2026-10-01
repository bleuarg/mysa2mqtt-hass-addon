#!/usr/bin/with-contenv bashio
# shellcheck shell=bash
set -e

# Use the broker configured in the add-on options if set, otherwise the one
# Supervisor provides (e.g. the Mosquitto add-on, with generated credentials).
if bashio::config.has_value 'mqtt_host'; then
  export M2M_MQTT_HOST="$(bashio::config 'mqtt_host')"
  export M2M_MQTT_PORT="$(bashio::config 'mqtt_port' '1883')"
  if bashio::config.has_value 'mqtt_username'; then
    export M2M_MQTT_USERNAME="$(bashio::config 'mqtt_username')"
  fi
  if bashio::config.has_value 'mqtt_password'; then
    export M2M_MQTT_PASSWORD="$(bashio::config 'mqtt_password')"
  fi
elif bashio::services.available 'mqtt'; then
  bashio::log.info "Using the MQTT broker provided by Supervisor."
  export M2M_MQTT_HOST="$(bashio::services 'mqtt' 'host')"
  export M2M_MQTT_PORT="$(bashio::services 'mqtt' 'port')"
  export M2M_MQTT_USERNAME="$(bashio::services 'mqtt' 'username')"
  export M2M_MQTT_PASSWORD="$(bashio::services 'mqtt' 'password')"
else
  bashio::log.fatal "No MQTT broker found. Install the Mosquitto add-on or set mqtt_host in the add-on configuration."
  exit 1
fi

if ! bashio::config.has_value 'mysa_username' || ! bashio::config.has_value 'mysa_password'; then
  bashio::log.fatal "Mysa credentials are required. Set mysa_username and mysa_password in the add-on configuration."
  exit 1
fi

export M2M_MQTT_TOPIC_PREFIX="$(bashio::config 'mqtt_topic_prefix')"
export M2M_MQTT_CLIENT_NAME="$(bashio::config 'mqtt_client_name')"
export M2M_MYSA_USERNAME="$(bashio::config 'mysa_username')"
export M2M_MYSA_PASSWORD="$(bashio::config 'mysa_password')"
export M2M_LOG_LEVEL="$(bashio::config 'log_level')"
export M2M_LOG_FORMAT="$(bashio::config 'log_format')"
export M2M_TEMPERATURE_UNIT="$(bashio::config 'temperature_unit')"

exec mysa2mqtt

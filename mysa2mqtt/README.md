# Mysa2MQTT Home Assistant Add-on

[![Open your Home Assistant instance and show the add add-on repository dialog with a specific repository URL pre-filled.](https://my.home-assistant.io/badges/supervisor_add_addon_repository.svg)](https://my.home-assistant.io/redirect/supervisor_add_addon_repository/?repository_url=https%3A%2F%2Fgithub.com%2Fitsamenathan%2Fmysa2mqtt-hass-addon)

Expose your Mysa smart thermostats to Home Assistant via MQTT. This add-on wraps the [mysa2mqtt](https://github.com/bourquep/mysa2mqtt) bridge and publishes
climate and sensor entities using MQTT discovery, so devices show up automatically in Home Assistant.

## Installation

1. In Home Assistant: Settings → Add-ons → Add-on Store → ⋮ (top right) → Repositories.
2. Add the repository URL: `https://github.com/itsamenathan/mysa2mqtt-hass-addon`.
3. Install **Mysa2MQTT** from the list and open the add-on.

## Configuration

Set your Mysa credentials and MQTT details, then save and start the add-on. Defaults are shown below:

```yaml
mqtt_host: core-mosquitto     # required; your MQTT broker host/IP
mqtt_port: 1883
mqtt_username: ""             # optional
mqtt_password: ""             # optional
mqtt_topic_prefix: mysa2mqtt
mqtt_client_name: mysa2mqtt
mysa_username: ""             # required; your Mysa account email
mysa_password: ""             # required; your Mysa account password
log_level: info               # silent|fatal|error|warn|info|debug|trace
log_format: pretty            # pretty|json
temperature_unit: C           # C|F; must match your Home Assistant unit system
```

Important notes:

- `temperature_unit` must match Home Assistant (Settings → System → General) to avoid incorrect setpoints.
- If your broker requires auth, set both `mqtt_username` and `mqtt_password`.

## Usage

After starting the add-on:

- Home Assistant should auto-discover the thermostats under Settings → Devices & Services → MQTT.
- Control heat/off modes and setpoints from the climate entities; power and temperature sensors are published as well.

## Troubleshooting

- Check the add-on logs for connection or authentication errors.
- Ensure your MQTT broker is reachable from Home Assistant and credentials are correct.

## Support

Issues and feature requests: https://github.com/bourquep/mysa2mqtt/issues

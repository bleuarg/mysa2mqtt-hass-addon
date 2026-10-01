## [0.2.0] - 2026-09-30

First release of the bleuarg fork.

- Build from a pinned `ghcr.io/home-assistant/base:3.24-2026.08.0` image. Supervisor 2026.04.0 and later no longer
  provide `BUILD_FROM`.
- Drop `armv7`, which the base image isn't published for.
- Update mysa2mqtt from 1.2.2 to 3.2.6.
- Remove the `mysa_session_file` option. mysa2mqtt 2.0.0 removed session files.
- Stop mapping Home Assistant's `/config` into the add-on.
- Get the MQTT broker from the Supervisor by default. The `mqtt_*` options are now optional overrides.

## [0.1.2] - 2026-01-18

- Set session file default to be /config/mysa2mqtt/session.json
- Moved Readme and Changelog into addon folder

## [0.1.1] - 2026-01-18

- Moved code to this repo
- Set session file default to be /share/mysa2mqtt/session.json

## [0.1.0] - 2025-12-04

- Using v1.2.2 of mysa2mqtt
- Publish the first version of the add-on

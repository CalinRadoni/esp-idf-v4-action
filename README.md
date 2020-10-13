# ESP-IDF v4.x installer

GitHub Action to install Espressif IoT Development Framework v4.x for building ESP32 code.

The usable ESP-IDF versions are:

- `latest` (based on release/v4.2)
- `v4.2`, v4.2.x, `release/v4.2`
- `v4.1`, v4.1.x, `release/v4.1`
- v4.0.x, `release/v4.0`

**Note:** The action is built for Ubuntu 20.04 LTS. It may or may not work with other Ubuntu or Debian versions.

## Usage

Source the ESP-IDF required environment variables before building your code:

```sh
source ~/esp/esp-idf/export.sh
idf.py build
```

It is used at least in [ESP32HAL](https://github.com/CalinRadoni/ESP32HAL) repository.

### Example

```yml
name: ESP32 Builder

on: [push]

jobs:
  builder:
    name: Builder for test ESP32 project
    runs-on: ubuntu-20.04

    steps:
      - name: Checkout code
        uses: actions/checkout@v2

      - name: Install ESP-IDF
        uses: CalinRadoni/esp-idf-v4-action@v2
        with:
          esp_idf_version: 'v4.1'

      - name: Build
        run: |
          source ~/esp/esp-idf/export.sh
          idf.py reconfigure
          idf.py app
          idf.py size
```

## About

It was tested in the official Ubuntu Focal Docker container and it contains some minor extra steps not really needed for the GitHub-hosted Ubuntu 20.04 LTS runner, like the installation of `tzdata` and `python3-libusb1`. I left them for completeness if more tests are needed.

Version 2 of this action does not build the ESP32 code, like version 1 has done it, to allow custom build steps.

## License

This repository is licensed with the [MIT License](LICENSE).

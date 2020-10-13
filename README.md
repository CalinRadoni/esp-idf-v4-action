# ESP32 build - ESP-IDF v4.x

GitHub Action to build your ESP32 code with Espressif IoT Development Framework v4.x

The usable ESP-IDF versions are:

- `latest` (based on release/v4.2)
- `v4.2`, v4.2.x, `release/v4.2`
- `v4.1`, v4.1.x, `release/v4.1`
- v4.0.x, `release/v4.0`

**Note:** The action is built for Ubuntu 20.04 LTS. It may or may not work with other Ubuntu or Debian versions.

## Usage

It is used at least in [ESP32HAL](https://github.com/CalinRadoni/ESP32HAL) repository.

```yml
name: ESP32 Builder

on: [push]

jobs:
  builder:
    name: Builder for test project
    runs-on: ubuntu-20.04

    steps:
      - name: Checkout code
        uses: actions/checkout@v2

      - name: Build
        uses: CalinRadoni/esp-idf-v4-action@v1
        with:
          esp_idf_version: 'v4.1'
          src_directory: '.'
```

## About

It was tested in the official Ubuntu Focal Docker container and it contains some minor extra steps not really needed for the GitHub-hosted Ubuntu 20.04 LTS runner, like the installation of `tzdata` and `python3-libusb1`. I left them for completeness if more tests are needed.

## License

This repository is licensed with the [MIT License](LICENSE).

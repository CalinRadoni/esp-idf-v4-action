# ESP32 build - ESP-IDF v4

GitHub Action to build your ESP32 code with Espressif IoT Development Framework v4.x

Currently implemented versions are:

- latest (based on release/v4.2)
- v4.2, v4.2.x, release/v4.2
- v4.1, v4.1.x, release/v4.1
- v4.0.x, release/v4.0

**Note:** The action is built for Ubuntu 20.04 LTS. It was tested in the official Ubuntu Focal Docker container and it contains some minor extra steps not really needed for the GitHub-hosted Ubuntu 20.04 LTS runner.

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
        uses: CalinRadoni/esp-idf-v4-action@v0.3
        with:
          esp_idf_version: 'v4.1'
          src_directory: 'test'
```

## License

This repository is licensed with the [MIT License](LICENSE).

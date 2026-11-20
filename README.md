# parla snap repository

[![snap: parla](https://snapcraft.io/parla/badge.svg "snap latest stable version")](https://snapcraft.io/parla)

This repository contains the recipie to build the snap version of [parla](https://github.com/trufae/parla).

[![Get it from the Snap Store](https://snapcraft.io/static/images/badges/en/snap-store-black.svg)](https://snapcraft.io/parla)

To install the snap version of parla run:

```sh
sudo snap install parla
```

## CLI

To use the snap version of `parla-cli` use instead `parla.parla-cli`.

```sh
alias parla-cli='parla.parla-cli'
```

Or create a wrapper script if intended to be used via AI by running:
```sh
cat << EOF | sudo tee /usr/local/bin/parla-cli
#!/bin/sh
exec parla.parla-cli "\$@"
EOF
sudo chmod a+rx /usr/local/bin/parla-cli
```

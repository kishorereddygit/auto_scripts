#!/usr/bin/env bash
#Scripts for starting docker automatically on boot
sudo mv "$ROOT_DIR/artifact/rc.local.service" /etc/systemd/system/rc-local.service
sudo chmod +x /etc/rc.local
sudo systemctl enable rc-local
sudo systemctl start rc-local.service
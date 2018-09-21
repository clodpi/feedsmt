#!/bin/sh /etc/rc.common
# Copyright (C) 2015 OpenWrt.org

START=70
APP=lora-gateway-bridge
SERVICE_WRITE_PID=1
SERVICE_DAEMONIZE=1

start() {
  sed "s/client_id=\"\"/client_id=\"$(uci get lora-global.gateway_conf.gateway_ID)\"/g" /etc/lora-gateway-bridge/lora-gateway-bridge.toml
  service_start /usr/sbin/$APP
}

stop() {
  service_stop /usr/sbin/$APP
}

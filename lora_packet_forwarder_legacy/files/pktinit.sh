#!/bin/sh

sleep 2
logger "Generating Config"
GATEWAY_ID=$(uci get network.lan.macaddr | awk -F\: '{print $1$2$3"FFFE"$4$5$6}')
uci set lora-global.gateway_conf.gateway_ID=$GATEWAY_ID
cat /etc/lora/$(uci get lora-global.gateway_conf.frequency_plan)-global_conf.json > /etc/lora/global_conf.json
echo -e "{\n\t\"gateway_conf\":{\n\t\t\"gateway_ID\":\"$(uci get lora-global.gateway_conf.gateway_ID)\",\n\t\t\"server_address\":\"$(uci get lora-global.gateway_conf.server_address)\",\n\t\t\"serv_port_up\":$(uci get lora-global.gateway_conf.serv_port_up),\n\t\t\"serv_port_down\":$(uci get lora-global.gateway_conf.serv_port_down),\n\t\t\"ref_latitude\": $(uci get lora-global.gateway_conf.ref_latitude),\n\t\t\"ref_longitude\": $(uci get lora-global.gateway_conf.ref_longitude),\n\t\t\"ref_altitude\": $(uci get lora-global.gateway_conf.ref_altitude),\n\t\t\"keepalive_interval\":$(uci get lora-global.gateway_conf.keepalive_interval),\n\t\t\"stat_interval\":$(uci get lora-global.gateway_conf.stat_interval),\n\t\t\"push_timeout_ms\":$(uci get lora-global.gateway_conf.push_timeout_ms),\n\t\t\"gps_tty_path\":\"$(uci get lora-global.gateway_conf.gps_tty_path)\",\n\t\t\"forward_crc_valid\":$(uci get lora-global.gateway_conf.forward_crc_valid),\n\t\t\"forward_crc_error\":$(uci get lora-global.gateway_conf.forward_crc_error),\n\t\t\"forward_crc_disabled\":$(uci get lora-global.gateway_conf.forward_crc_disabled)\n\t}\n}" >/etc/lora/local_conf.json
logger "Config generation complete"

if [ -e "/dev/ttyACM0" ]
then
    arg0=" -d /dev/ttyACM0"
else
    arg0=" -d /dev/ttyACM1"
fi

(sleep 1 && killall util_chip_id) & /usr/bin/util_chip_id $arg0

sleep 2
if [ -e "/dev/ttyACM0" ]
then
    arg=" -d /dev/ttyACM0"
else
    arg=" -d /dev/ttyACM1"
fi
/usr/bin/lora_pkt_fwd $arg

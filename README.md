A dockerised version of the semtech packet forwarder.

Circle ci is set to publich multi arch images to docker hub.

Available Env Vars

```
CONCENTRATOR_RESET_PIN=..   # The concetrator pin for doing the resets.
CONCENTRATOR_CONFIG=...                  # The main config.
GW_ID=...                   # Use this gateway id instead of an autogenerated one from the mac address of eth0. Inside a docker container the ethernet mac address changes when recreating the container so the auto generated gateway id will also change. 
```

### Example
```
docker run \
    --privileged \
    --env CONCENTRATOR_RESET_PIN=22 \
    --env GW_ID=0242acfffe110006 \
    --env CONCENTRATOR_CONFIG=$(cat ./config_file.json) \
    arribada/packet-forwarder
```

[PiSupply Rak833 hat config file](https://github.com/brocaar/lora-gateway-os/blob/v3.0.0test2/layers/targets/meta-raspberrypi/recipes-lora/lora-packet-forwarder/lora-packet-forwarder/pislora/global_conf.eu868.json) for the EU settings.<br/>

Other config files for the PiSupply hat can be copied from the [lora-gateway-os repo](https://github.com/brocaar/lora-gateway-os/tree/v3.0.0test2/layers/targets/meta-raspberrypi/recipes-lora/lora-packet-forwarder/lora-packet-forwarder/pislora).
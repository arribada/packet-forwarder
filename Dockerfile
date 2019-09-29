FROM debian AS build
RUN apt update
RUN apt install -y make git gcc
WORKDIR /tmp

RUN git clone https://github.com/Lora-net/lora_gateway.git
WORKDIR /tmp/lora_gateway
RUN make
COPY ./src /tmp/packet_forwarder
WORKDIR /tmp/packet_forwarder
RUN make

FROM debian
COPY --from=build /tmp/packet_forwarder/lora_pkt_fwd/lora_pkt_fwd ./
COPY --from=build /tmp/packet_forwarder/lora_pkt_fwd/global_conf.json ./
COPY --from=build /tmp/lora_gateway/reset_lgw.sh ./
COPY entrypoint.sh ./
ENTRYPOINT [ "./entrypoint.sh" ]
CMD ./lora_pkt_fwd
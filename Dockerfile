FROM ubuntu:latest
ENV DEBIAN_FRONTEND=noninteractive
RUN mkdir -p /home/payload/in/ && mkdir -p /home/payload/out/ && \
apt update && apt install -y python3 python3-pip zip unzip
COPY payload_dumper/ /payload/
ENV payload_file="payload.bin"
RUN python3 -m pip install protobuf
COPY entry.sh /entry.sh
RUN chmod a+x /entry.sh
ENTRYPOINT [ "/entry.sh" ]
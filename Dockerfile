FROM ubuntu:latest
ENV DEBIAN_FRONTEND=noninteractive
RUN apt update && apt install -y pip python3 python3-pip zip unzip && mkdir -p /home/payload/in/ && mkdir -p /home/payload/out/
COPY payload_dumper/ /payload/
ENV payload_file="payload.bin"
RUN python3 -m pip install protobuf
COPY entry.sh /entry.sh
RUN chmod a+x /entry.sh
ENTRYPOINT [ "/entry.sh" ]
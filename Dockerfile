FROM arm32v7/telegraf

ADD qemu-arm-static /usr/bin
ADD raspi.list /etc/apt/sources.list.d/raspi.list
RUN wget -qO - http://archive.raspberrypi.org/debian/raspberrypi.gpg.key | apt-key add -

# Update and install the raspberry pi userland tools
RUN apt-get update && apt-get -y dist-upgrade && \
  apt-get install -y libraspberrypi-bin && \
  rm -rf /var/lib/apt/lists/*
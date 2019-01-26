# Use official ubuntu image as parent
FROM ubuntu:18.04

# Install required packages
RUN apt-get update && apt-get install -y \
	libsdl2-mixer-2.0-0 \
	libsdl2-2.0-0 \
	libgme-dev \
	dirmngr \
	software-properties-common

RUN add-apt-repository ppa:kartkrew/srb2kart
RUN apt-get install -y \
	srb2kart

# Make port 5029 available to the world outside this container
EXPOSE 5029/udp

# Set the working directory to data folder
WORKDIR /root/.srb2kart

# Copy configs and mods to container
RUN mkdir -p data

# Set the working directory to where application lives
WORKDIR /usr/games/SRB2Kart

# Run srb2kart dedicated when the container launches
ENTRYPOINT ["./srb2kart", "-dedicated"]
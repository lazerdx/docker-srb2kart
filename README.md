# docker-srb2kart
This dockerfile was built for the purpose of making [srb2kart dedicated server](https://mb.srb2.org/showthread.php?t=43708) deployment more streamlined.
The built image can be found at: https://cloud.docker.com/repository/docker/lazerdx/srb2kart

You can run the image once built as such:

docker run -d -i -t -p :5029:5029/udp --name (container name) -v ${PWD}:/root/.srb2kart (image name) -room 33 -bindaddr 172.17.0.2 (if you have mods add "-file" then your list of mods delimited by space ie "-file bonuschars.kart somemod.kart")

You can provide additional srb2kart command flags as needed at the end of the command. The software automatically runs under the "-dedicated" flag.

You'll notice a volume is mounted from the working directory the container is ran from. This will map all the srb2kart data to that volume, such as kartdata.cfg. If you provide your own kartdata.cfg then it will be used. Mods (.kart files) or text files for scripting purposes/colored server names to be called via kartdata.cfg should also be included here.

Once the server is running, you can attach to it with:

docker attach --detach-keys="ctrl-_"

Use "ctrl-_" to detach, or specify your own detach sequence with the --detach-keys flag. For some reason the default detach sequence of ctrl-p + ctrl-r does not work correctly.

For automated restarts, simply configure a cronjob to trigger docker restart or a bash script that does the same (and perhaps saves a copy of the log in the mounted volume).

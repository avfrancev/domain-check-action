# Container image that runs your code
FROM ubuntu:latest

# Copies your code file from your action repository to the filesystem path `/` of the container
ADD entrypoint.sh /entrypoint.sh
# RUN chmod +x entrypoint.sh
ADD telegram.sh /telegram.sh
# RUN chmod +x telegram.sh

# Code file to execute when the docker container starts up (`entrypoint.sh`)
ENTRYPOINT ["/entrypoint.sh"]

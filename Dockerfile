# https://help.github.com/en/actions/building-actions/creating-a-docker-container-action

# Container image that runs your code
FROM vvakame/review:5.9

# Copies your code file from your action repository to the filesystem path `/` of the container
COPY entrypoint.sh /entrypoint.sh

# ラベルの内容を増やす必要があるときは\（継続マーカー）を利用すること（LABELで始まるLABEL命令を増やさない） 
LABEL maintainer="mhidaka <rabbitlog@gmail.com>"

# Code file to execute when the docker container starts up (`entrypoint.sh`)
ENTRYPOINT ["/entrypoint.sh"]

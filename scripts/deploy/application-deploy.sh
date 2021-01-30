#!/bin/bash
# /iac/atlassian-enviroment-iac-arm/scripts/generate-pem-key.sh
set -e
TIME=date\ +%d/%m/%Y-%H:%M:%S
TIME_CLEAN=date\ +%d-%m-%Y_%H-%M-%S

echo [$(${TIME})] -------- APPLICATION USER --------
echo CONFIGURE SECURITY
echo WHOIAM: $(whoami)
echo SERVER_NAME: $(uname -a)
# PASSWORD BY PARAMETER BY JENKINS
export DOCKER_HOST="tcp://127.0.0.1:4243"
DOCKER_RUNNING=$(docker ps -q --filter ancestor=${registryHost}/${imageName})
echo DOCKER_RUNNING: ${DOCKER_RUNNING}
if [ ! -z "${DOCKER_RUNNING}" ] ; then
	echo "STOP CONTAINER: "+${DOCKER_RUNNING}
	docker stop ${DOCKER_RUNNING}
fi
DOCKER_RUNNING=$(docker ps -a -q --filter ancestor=${registryHost}/${imageName})
echo DOCKER_RUNNING: ${DOCKER_RUNNING}
if [ ! -z "${DOCKER_RUNNING}" ] ; then
	echo "REMOVE CONTAINER: "+${DOCKER_RUNNING}
	docker rm -f ${DOCKER_RUNNING}
fi

# FOR THE EXAMPLE OPEN PORT 8111
docker run -d ${dockerRunArgs} ${registryHost}/${imageName}

# TO CHECK THE APPLICATION http://<HOST>:8111

echo [$(${TIME})] ------------- FINISH ------------
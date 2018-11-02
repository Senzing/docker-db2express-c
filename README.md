# docker-db2express-c

## Overview

This Dockerfile inherits from
[ibmcom/db2express-c](https://hub.docker.com/r/ibmcom/db2express-c/).

The changes are to allow mounting of the storage using `volumes`.
Essentially,
[entrypoint.sh](app/entrypoint.sh)
was modified to support non-root ownership of
`/home/db2inst1/db2inst1`.

### Contents

1. [Create Docker container](#create-docker-container)
1. [Run Docker container](#run-docker-container)
1. [More information](#more-information)

## Create docker container

```console
docker build --tag senzing/db2express-c https://github.com/senzing/docker-db2express-c.git
```

## Run Docker container

1. **Option #1** - Run the docker container without volumes or network.

   Identify the `db2inst1` user's password.
   Example:

    ```console
    export DB2INST1_PASSWORD=password
    ```

    Run docker container.

    ```console
    docker run -it  \
      --env DB2INST1_PASSWORD=${DB2INST1_PASSWORD} \
      --env LICENSE="accept" \
      senzing/db2express-c
    ```

1. **Option #2** - Run the docker container with volumes.

   Identify the path on local system where the database files are to be stored.
   Default: `/storage/docker/senzing/docker-compose-db2-demo`.
   Example:

    ```console
    export DB2_STORAGE=/storage/docker/senzing/docker-compose-db2-demo
    ```

    Run docker container.

    ```console
    docker run -it  \
      --volume ${DB2_STORAGE}:/home/db2inst1/db2inst1 \
      --env DB2INST1_PASSWORD=${DB2INST1_PASSWORD} \
      --env LICENSE="accept" \
      senzing/db2express-c
    ```

1. **Option #3** - Run the docker container in a docker network.

   Identify the Docker network of the DB2 database.
   Example:

    ```console
    docker network ls

    # Choose value from NAME column of docker network ls
    export DB2_NETWORK=nameofthe_network
    ```

    Run docker container.

    ```console
    docker run -it  \
      --volume ${DB2_STORAGE}:/home/db2inst1/db2inst1 \
      --net ${DB2_NETWORK} \
      --env DB2INST1_PASSWORD=${DB2INST1_PASSWORD} \
      --env LICENSE="accept" \
      senzing/db2express-c
    ```

## More information

1. Visit [ibmcom/db2express-c](https://hub.docker.com/r/ibmcom/db2express-c/) on hub.docker.com for more information.

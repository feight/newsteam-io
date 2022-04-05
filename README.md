# newsteam-io

### A microservice for sending and receiving content from Cosmos

## Todo:

-   Apis for:

    -   config; setting up entities to sync
    -   paths; send to FTP folders / Webhooks
    -   use Cloud Storage for saving configuration in one file

-   Should be able to deploy to Cloud Run / Kube
-   Publish Image to Docker Hub so anybody can use it.

## Pull from Dockerhub:

docker run --rm \
    -v ~/Workspace/newsteam-io/service-account.json:/app/modules/api/service-account.json \
    -p 3000:3000 \
    dgroux/newsteam-io:latest
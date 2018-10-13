# DivSeek Canada Portal

The [DivSeek Canada](http://www.divseekcanada.ca)  **Portal** is a web-based platform to implement association genetics 
workflows supporting plant breeding and crop research focusing on large scale plant genetic resources / crop 
genotype-phenotype data sets whose access is brokered / managed by the project.

# Genome Canada Pilot Project

The first iteration of the platform is funded under a 
[Genome Canada Project](https://www.genomecanada.ca/en/divseek-canada-harnessing-genomics-accelerate-crop-improvement-canada) with co-funding from other partners.

# Documentation

Some technical notes about the portal system will be compiled on the 
[Divseek Portal Wiki](https://github.com/DivSeek-Canada/divseek-canada-portal/wiki).

# Working on the Project

This project resides in [this Github project repository](https://github.com/DivSeek-Canada/divseek-canada-portal).

First, ensure that you have the git client installed (here again, we assume Ubuntu):

    apt update
    apt install git

Then, you can clone the project:

    git clone https://github.com/DivSeek-Canada/divseek-canada-portal 

Note that the project contains an embedded git submodule, which is code from the
[docker-tripal project v3.x branch](https://github.com/erasche/docker-tripal/tree/v3.x). 
Thus, in addition to git cloning the project, you'll need to initialize the submodule, i.e.

    cd divseek-canada-portal
    git submodule init
    
in later iterations, after every pull or checkout of another branch from the remote repo, you should update the submodule, as follows:

    git submodule update

# Docker Deployment of Tripal

The DivSeek Canada portal is being designed to run within a **Docker** container when the application is run on a Linux server or virtual machine. Some preparation is required.

## Installation of Docker

To run Docker, you'll obviously need to [install Docker first](https://docs.docker.com/engine/installation/) in your target Linux operating environment (bare metal server or virtual machine running Linux).

For our installations, we typically use Ubuntu Linux, for which there is an [Ubuntu-specific docker installation using the repository](https://docs.docker.com/engine/installation/linux/docker-ce/ubuntu/#install-using-the-repository).
Note that you should have 'curl' installed first before installing Docker:

```
$ sudo apt-get install curl
```

For other installations, please find instructions specific to your choice of Linux variant, on the Docker site.

## Testing Docker

In order to ensure that Docker is working correctly, run the following command:

```
$ sudo docker run hello-world
```

This should result in something akin to the following output:

```
Unable to find image 'hello-world:latest' locally
latest: Pulling from library/hello-world
ca4f61b1923c: Pull complete
Digest: sha256:be0cd392e45be79ffeffa6b05338b98ebb16c87b255f48e297ec7f98e123905c
Status: Downloaded newer image for hello-world:latest

Hello from Docker!
This message shows that your installation appears to be working correctly.

To generate this message, Docker took the following steps:
 1. The Docker client contacted the Docker daemon.
 2. The Docker daemon pulled the "hello-world" image from the Docker Hub.
    (amd64)
 3. The Docker daemon created a new container from that image which runs the
    executable that produces the output you are currently reading.
 4. The Docker daemon streamed that output to the Docker client, which sent it
    to your terminal.

To try something more ambitious, you can run an Ubuntu container with:
 $ docker run -it ubuntu bash

Share images, automate workflows, and more with a free Docker ID:
 https://cloud.docker.com/

For more examples and ideas, visit:
 https://docs.docker.com/engine/userguide/
```

## Installing Docker Compose

You will then also need to [install Docker Compose](https://docs.docker.com/compose/install/) alongside Docker on your target Linux operating environment.

### Docker under Linux

Note that under Ubuntu, you likely need to do a bit more preparation to avoid having to run docker (and docker-compose) 
as 'sudo'. See [here](https://docs.docker.com/install/linux/linux-postinstall/) for details on how to fix this.

## Testing Docker Compose

In order to ensure Docker Compose is working correctly, issue the following command:
```
$ docker-compose --version
docker-compose version 1.22.0, build f46880f
```
Note that your particular version and build number may be different than what is shown here. We don't currently expect that docker-compose version differences should have a significant impact on the build, but if in doubt, refer to the release notes of the docker-compose site for advice.

# Deployment of Tripal using Docker

This project is currently designed to deploy Tripal as a Docker deployment. Thus, once cloned, the project may be built 
by Docker Compose. 

# Configuring the System

Before buiding the system using Docker Compose, it is important to perhaps make a copy and customize the contents of the 
**docker-compose.yml** file. 

A mandatory item to review is the location of your data files for the web site, database and (elasticsearch) index, 
which are specified to be persisted on the host system, external from the Docker containers.

The default project data file assumes a Mac OSX deployment with the **/Volumes** directory as a Mac OSX enabled location 
for subfolders which can be mapped as Docker 'volumes'.  If you are on Linux, you may need to fix this to point to some
other location. After changing the paths in the **docker-compose.yml** file, you should create each subdirectory in
question, and ensure that the user permissions are set to the user account running the docker-compose.yml file.

The four such directories in the default docker-compose.yml file to be fixed accordingly are:

      /Volumes/DivSeekCanada/tripal_sites:/var/www/html/sites
      /Volumes/DivSeekCanada/tripal_private:/var/www/private
      /Volumes/DivSeekCanada/tripal_db:/var/lib/postgresql/data/
      /Volumes/DivSeekCanada/tripal_index/:/usr/share/elasticsearch/data

Note that you should ensure that you have a "large enough" storage volume initialized and mounted to your system,
upon which to store these directories, and also, the Docker deployment in general.  On a cloud deployment, this 
may mean adding suitable volume storage. Yourexperience with your data system size will dictate the size of 
such a volume storage.

## Running the System

The **docker-compose.yml** file, once configured, may be directly run as follows:

    docker-compose -f /path/to/the/divseek-canada-portal/docker-compose.yml up

The first time the docker-compose is run, it will trigger the downloading of the required Docker images,
from their specified sources:

To stop the docker system, the following may be run:

    docker-compose -f /path/to/the/divseek-canada-portal/docker-compose.yml down

While running, you may directly access and manipulate the running Tripal instance by firing up a bash shell session.
Assuming that your docker image name is something like _"divseek-canada-portal_web_1"_
then, you can enter it by:

    docker exec -t -i divseek-canada-portal_web_1 /bin/bash
    root@31d29c26c792:/var/www/html#

Once it, you can (for example) change the admin password using 'drush' as follows:

    root@31d29c26c792:/var/www/html# drush user-password admin --password="your-new-admin-password"

In this manner, can then log in as the "admin" user then the admin dashboard, e.g.

    http://localhost:3000/tripal/admin

to perhaps apply other customizations.

# Targets for Customization of a Docker Tripal Installation

A given Docker Compose deployment of Tripal has various levels at which customization may be attempted.

## Customize the 'docker-compose.yml' file

The [Docker Tripal project README](https://github.com/erasche/docker-tripal/blob/v3.x/README.md) provides
more details on how to customize your Tripal installation using environment variables and other
indications within the _docker-compose.yml_ file.

### Customize the Web Docker Image

The [Docker Tripal project README](https://github.com/erasche/docker-tripal/blob/v3.x/README.md) also suggests, in 
particular, that one can run the docker-compose.yml build from a derived version of the standard docker image 
provided (i.e. _quay.io/erasche/tripal:v3.x_) by building the "web" service component off a Dockerfile which inherits 
from the standard image in the usual fashion, using the FROM docker file directive, namely:

    FROM quay.io/erasche/tripal:v3.x
    # additional RUN, COPY, CMD customizations

## Customize within the Docker mapped volumes

### Tripal (Drupal) HTML Site Files

The _divSeek-canada_ project customization of the docker-tripal docker-compose.yml provides external docker *volume* 
mappings. One of these is to a _"tripal_sites"_ subdirectory within which the Tripal (Drupal) site configuration files 
are placed. These files may be customized accordingly, either directly or through the Tripal (Drupal) 'admin' dashboard.

### Tripal (Drupal) PostgreSQL Database

Similarly, _divSeek-canada_ project customization of the docker-tripal docker-compose.yml provides external docker\
*volume* mappings to a _"tripal_db"_ subdirectory within which the Tripal (Drupal) postgres database files are placed.
Given suitable postgres credentials, this database may be directly accessed(?) and content modified to project needs.

## Customize inside the 'web' Docker container using _drush_

We have already mentioned (above) the use of the _drush_ command inside the web container, to change the Tripal (Drupal)
admin password. I effect, though, any _drush_ command accessible site changes (customizations) may be applied.

## Customize Tripal using the _admin_ Dashboard, accessible through the web site

After setting the **admin** password, the entire Tripal (Drupal) site administration will be accessible at 
**http://localhost:3000/tripal/admin***, page which provides access to significant global customization options.
 

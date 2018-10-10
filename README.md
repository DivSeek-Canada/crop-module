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
Note that the project contains an embedded git submodule, which is code from the
[docker-tripal project v3.x branch](https://github.com/erasche/docker-tripal/tree/v3.x).

Thus, in addition to git cloning the project, i.e.

    git clone https://github.com/DivSeek-Canada/divseek-canada-portal 
    
one needs to initialize the submodule, i.e.

    cd divseek-canada-portal
    git submodule init
    
in later iterations, after every pull from the remote repo, one should update the submodule, i.e.

    git submodule update

# Administering the Docker Tripal Build

Once cloned, the project may be built by Docker Compose. A customized version of the docker-compose.yml file
is under iterative development in the project root directory, and may be used as a target for the build:

    docker-compose -f /path/to/the/divseek-canada-portal/docker-compose.yml build

After the image is built, it may be run:

    docker-compose -f /path/to/the/divseek-canada-portal/docker-compose.yml up

then stopped:

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

The [https://github.com/erasche/docker-tripal/blob/v3.x/README.md](Docker Tripal project README) provides
more details on how to customize your Tripal installation using environment variables and other
indications within the _docker-compose.yml_ file.

### Customize the Web Docker Image

The [https://github.com/erasche/docker-tripal/blob/v3.x/README.md](Docker Tripal project README) also suggests, in 
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
 
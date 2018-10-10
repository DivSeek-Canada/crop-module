# DivSeek Canada Portal

The [DivSeek Canada](http://www.divseekcanada.ca)  **Portal** is a web-based platform to implement association genetics workflows supporting plant breeding and crop research focusing on large scale plant genetic resources / crop genotype-phenotype data sets whose access is brokered / managed by the project.

# Genome Canada Pilot Project

The first iteration of the platform is funded under a [Genome Canada Project](https://www.genomecanada.ca/en/divseek-canada-harnessing-genomics-accelerate-crop-improvement-canada) with co-funding from other partners.

# Documentation

Some technical notes about the portal system will be compiled on the [Divseek Portal Wiki](https://github.com/DivSeek-Canada/divseek-canada-portal/wiki).

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

The [https://github.com/erasche/docker-tripal/blob/v3.x/README.md](Docker Tripal project README) provides
more details on how to customize your Tripal installation using environment variables and other
indications within the _docker-compose.yml_ file.

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
 
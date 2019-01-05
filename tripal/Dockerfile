# This Dockerfile derives a customized Tripal image for DivSeek Canada

# This is the docker-tripal "master" image, which is now at release 3.x
FROM quay.io/galaxy-genome-annotation/tripal:latest

MAINTAINER Richard Bruskiewich <richard@starinformatics.com>

ARG DIVSEEK_ADMIN_USER
# Create custom admin account
ENV ADMIN_USER $DIVSEEK_ADMIN_USER

COPY ./DivSeekCanadaLogo.* /

# Overlay DivSeek Canada specific installation scripts
# added to the core docker-tripal start-up scripts in the image
# to be run in the prescribed order
COPY ./scripts /scripts/
# Make sure that all our scripts are executable
RUN chmod -R +x /scripts/

# Overrides the docker-tripal image CMD entrypoint.sh
# with a slightly different version here?
COPY entrypoint.sh  /entrypoint.sh
CMD ["/entrypoint.sh"]

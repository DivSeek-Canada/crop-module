# This is the docker-tripal "master" image, which is now at release 3.x
FROM quay.io/galaxy-genome-annotation/tripal:latest

MAINTAINER Richard Bruskiewich <richard@starinformatics.com>

COPY ./DivSeekCanadaLogo.png /DivSeekCanadaLogo.png

# Overlay DivSeek Canada specific installation scripts
# added to the core docker-tripal start-up scripts in the image
# to be run in the prescribed order
ADD ../scripts /scripts/


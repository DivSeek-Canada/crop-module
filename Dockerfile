FROM quay.io/erasche/tripal:v3.x
MAINTAINER Richard Bruskiewich <richard@starinformatics.com>

ADD /config/DivSeekCanadaLogo.png /var/www/html/sites/default/files/DivSeekCanadaLogo.png

# Overlay DivSeek Canada specific installation scripts added to image
#ADD /scripts/ /scripts/

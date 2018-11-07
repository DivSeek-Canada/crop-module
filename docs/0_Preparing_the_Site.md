# Preparing the Site

The DivSeek Canada 'portal' is a Dockerized version of Tripal, Jbrowse and perhaps other bioinformatics components.
There are a number of tasks immediately before and right after the Docker Compose build which may require the
attention of administrators creating one crop-specific web site module for DivSeek Canada.

# The Data Directory

The divseek-canada-portal project **data** subdirectory is actually deliberately left (largely) empty in the repository since
each deployment of the docker subsystem here is actually a modular site for one specific crop. 

As such, after cloning a copy of the web site locally, to prepare it for deploying one crop-specific site, and prior
to running the Docker Compose build, the data directory should generally be populated by a site administrator with 
crop-specific configuration, meta-data (e.g. ontology) and data in a form to be preloaded into the site.  

Note that, normally, such data files should be designated as **.gitignored** (e.g. by file extension exclusion) so that
they are not committed to the _divseek-canada-portal_ repository.

Specific guidelines on what (meta-)data is expect, will be documented in a [Data README file](../data/README.md) situated
in the subdirectory.

# UI Preliminaries

The "Bootstrap" theme was included with the "Panels" UI module. The Bootstrap theme styles Panels and Panels organize 
content. Panels is an interface that can more directly WYSIWYG UI look and feel without having to write your own theme. 

Although we are working to automate site construction to the fullest extent feasible (using Docker Compose and 
Tripal/Drupal tools like Drush), there are some UI tasks which must be undertaken manually. Do do so, one must first
log into a user account which has "administrative" role permissions, to see the admin "Dashboard" and ensure that the
required modules and themes are enabled (to the best of our knowledge, such modules should be enabled by the
docker-compose build, but double check, just in case). Here we provide some pointers on the configuration and use of
each of the target UI components (modules or themes).

## Panels Configuration and Use

The Panels module allows you to structure page layouts of Drupal (hence, also Tripal) UI components in a flexible 
manner. Panels is a powerful but mildly complex module. Probably the easiest way to learn about how to use it is to 
consult [a series of Panels tutorial videos](https://www.drupal.org/node/561730#D7) available on the Drupal.org site. 


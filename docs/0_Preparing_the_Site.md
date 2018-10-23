# Preparing the Site

The DivSeek Canada 'portal' is a Dockerized version of Tripal, Jbrowse and perhaps other bioinformatics components.
The "Bootstrap" theme was included with the "Panels" UI module. Although we are working to automate site construction 
to the fullest extent feasible (using Docker Compose and Tripal/Drupal tools like Drush), there are some tasks which
must be undertaken manually.

# UI Preliminaries

The Bootstrap theme styles Panels and Panels organize content. Panels is an interface that can more directly WYSIWYG
UI look and feel without having to write your own theme. 

That said, they must be configured as follows:

1. Log into an "administrative" account of the site, to see the admin "Dashboard".
2. then...

# The Data Directory

The divseek-canada-portal project **data** subdirectory is actually deliberately (largely) empty in the repository.
Each deployment of the docker subsystem here is actually a modular site for one specific crop. As such, the data
directory should be populated by a site administrator with crop-specific configuration, meta-data (e.g. ontology) and 
data in a form to be preloaded into the site.  Note that, normally, such data files should be designated as 
**.gitignored** (e.g. by file extension exclusion)so that they are not committed to the divseek-canada-portal 
repository.


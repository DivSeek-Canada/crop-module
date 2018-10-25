# Loading Trait Ontology

Pre-requisite: Obtain the crop-specific Trait ontology in **OBO** format (see /data/README.md for detailed instruction)

1. Put the obtained .OBO file in an accessible path and set up proper permission (readable for everyone). 
2. Log into an "administrative" account of the site, to see the admin panel at the top.
3. Click "Tripal" tab at the top admin panel and find and click on "Data Loaders".
4. In "Data loaders", find and click on "Chado Vocabularies", then "OBO Vocabulary Loader".
5. In "OBO Vocabulary Loader", click on "ADD A NEW ONTOLOGY OBO REFERENCE".
6. Enter the name for the trait ontology in "New Vocabulary Name" field and put the path to the .OBO file in the "Local File" field. 
7. Double-check that the path to the OBO file is correct, then click "Import OBO file" - this should enqueue a Tripal job into the job list.
8. Navigate to "Tripal" tabs from the top admin panel again, and click "Jobs".
9. In the "Jobs" list, find the Job named "Import OBO File" and click **Execute** on the right.
10. The Trait Ontology should be loaded into Chado after the job is successfully executed.


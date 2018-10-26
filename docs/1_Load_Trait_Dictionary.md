# Loading Trait Ontology

Trait dictionary ontology can be obtained from **http://www.cropontology.org/ontology/**. Each crop has a Crop Ontology
identifier which, when added to the path, gives access to the associated trait dictionary as a downloadable file.
Click **"DOWNLOAD"** on the crop page and select to download the **OBO** formatted file. Save this file inside the
the **data** subdirectory of your target crop-specific DivSeek Canada Portal ("Portal") deployment project directory.

For the DivSeek Canada pilot project crops - sunflower, lentil and flax -, the following three dictionaries will be 
available by adding the following suffixes to the base URL **http://www.cropontology.org/ontology/**:

1. CO_359/Sunflower (currently offline for iterative refinement, as of October 2018)

2. CO_339/Lentil (based on ICARDA compilation)

3. CO_362/Flax (under development)

After the trait dictionary is loaded into the Portal **data** subdirectory, the following steps will load it into the
system. 

## Loading via the Tripal Dashboard

Trait data loading is not yet fully automated by the Portal Docker Compose build but requires user interaction with 
the Tripal web site.  Thus, it is assumed that the crop-specific DivSeek Canada Portal Docker containers are running 
so that the web site is accessible, for the following sequence of "administrative" user initiated operations.

1. Ensure that the obtained **.OBO** file file permissions are set to the user account running the loading script.
2. Log into an "administrative" account of the site, to see the admin panel at the top.
3. Click **"Tripal"** tab at the top admin panel and find and click on **"Data Loaders"**.
4. In **"Data loaders"**, find and click on **"Chado Vocabularies"**, then **"OBO Vocabulary Loader"**.
5. In **"OBO Vocabulary Loader"**, click on **"ADD A NEW ONTOLOGY OBO REFERENCE"**.
6. Enter the name for the trait ontology in **"New Vocabulary Name"** field and put the path to the **data** folder
containing the **.OBO** file, in the **"Local File"** field. 
7. Double-check that the path to the OBO file is correct, then click **"Import OBO file"** - this should enqueue 
a Tripal job into the job list.
8. Navigate to **"Tripal"** tabs from the top admin panel again, and click **"Jobs"**.
9. In the **"Jobs"** list, find the Job named **"Import OBO File"** and click **Execute** on the right.
10. The Trait Ontology should be loaded into Chado after the job is successfully executed.


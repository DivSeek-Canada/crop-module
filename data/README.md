# Data Subdirectory

This directory is empty (except for a **.gitignore** file) in the repository but should be populated with crop specific
data, including trait dictionaries, genomic and mapping data, or directives on where to get such data.

As the DivSeek Canada Portal ("Portal") project evolves, this README file will document what is needed in terms of site-specific
configuration and (meta-)data for loading, to support the user interface and scientific workflows on the site, 
for the given crop.

For the construction of a complete Portal site, **data** directory will contain the following inventory of files.

## site_config.yml

**Under Construction**

A copy of the _site_config.yml-template_ file should be made into _site_config.yml_ and the resulting file (which will
be **.gitignored**) should be edited for site-specific needs.  The template file contains inline comments to guide this. 

## Meta-Data

* Crop Specific Trait Dictionary in OBO ontology formatted text file

## Data

A given site may contain most of the following types of data

* Reference genome,with one FASTA sequence file per linkage group (chromosome) plus general annotation provided as a 
[**G**ene **F**eature **F**ormat version 3 (GFF3) formatted text file](http://gmod.org/wiki/GFF3)
* Markers annotated onto the reference genome, provided as a GFF3 file
* Passport data of germplasm documented by the system
* Genotype data associated with documented germplasm
* Phenotypic data associated with documented germplasm (perhaps, qualified by environment conditions and treatments). 
This data should be classified as values within the available crop specific trait dictionary (see meta-data above)
* Quantitative Trait Locus (QTL) or equivalent Breeding Value data associated with markers or genomic regions, properly
annotated by genotypes within which they were measured, provided as a GFF3 file.
* Additional association Genetics (e.g. GWAS) generated genetic map data, provided as a GFF3 file




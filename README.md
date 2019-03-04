# Man vs Machine - analyses  
___

This repository (R project) contains all data and scripts necessary to run the analyses and produce the figures from the study  **Man against machine: Do fungal fruitbodies and eDNA metabarcoding give similar biodiversity assessments across broad environmental gradients?.**  (for publication in Biological Conservation).  
All steps/processes for this study can be carried out on the same computer/platform. But, in practise all analyses were carried out on a linux server setup with 64 processors (AMD Opteron(tm) 6380), except R-scripts, which were run on a MacBook Pro (2.9 GHz Intel Core i7, 16 GB 2133 MHz LPDDR3).
All analyses were carried out in one directory and sub-directories of this.

## Sequencing data
The Illumina sequence data is deposited here: https://sid.erda.dk/public/archives/b0d2b22cb7804ff23d1612f4afdc29ae/published-archive.html

## Bioinformatic tools
### CLI tools were used for this study  

 * VSEARCH v.2.9 (or later) (https://github.com/torognes/vsearch) 
 * Cutadapt v 1.17 (https://cutadapt.readthedocs.io/en/stable/)  
 * blastn v2.4.0+ (ftp://ftp.ncbi.nlm.nih.gov/blast/executables/blast+/LATEST/) 
 
Various R-packages were used for this study (see in the relevant markdown files).  

## Description of the sub directories  

 * in_data : contains all initial data not produced as part of the analyses here  
 * data : contains all the data produced as part of the analyses here  
 * seq_processing : contains all the scripts and files necessary to perform the initial sequence processing  
 * tables : output directory for (text) tables produced in the analyses  
 * R : contains a few functions used in the analyses  
 * plots : output directory for the plots/figures produced in the analyses
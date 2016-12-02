##Introduction
* Coho as non-model organism
* Impotance in small urban streams
* Need for transcriptome 

##Methods
###Field Sampling
Sampling for wild juvenile Coho salmon took place at 4 different streams through out the puget sound. Stream selection criteria was based on landuse within the watershed and spanned a gradient from low to high anthropogenic impact defined by land area (need to look into this in greater detail). For the purpose of next-generation sequencing the four sites that were sampled included Swamp Creek (% urban), Jenkins Creek (% urban), Issaquah Creek (% urban), and Coulter Creek (% Urban). Each sampling reach in the stream was 150 meters in length. Backpack electroshocking was used to sample each reach length twich, once in the upstream and once in the downstream direction. All fish were retained in arretated buckets until processing could take place. An attempt was made to pull ten Coho from each site that spanned the range of sizes sampled in the reach for lethal takes. Ten fish were euthanized with blunt trauma and livers immediately excized, placed in RNAlater and stored on wet ice until they could be placed in a freezer. Liver samples were stored long term in RNAlater at -20 deg C. 

###RNA Isolation and Sequencing
Livers were removed from the freezer and immediately transfered into 1.5mL snap-tubes for tissue homginization. Tissues were hommogenized using teflon pestals in RNAzol RT solution. Manufacures protocols were used to issolate total RNA from each of the livers using RNAzol RT. Issolated RNA was dissolved in 50uL of .1% DEPC treated water. Concentrations and qualitywere checked using a Nanodrop. Issolated RNA was further treated with Turbo DNA-free to remove genomic DNA contamination from the sample. DNase'd samples were diluted to 100ng/L and transfered to the Univeristy of Washington Genomics facility for library preperation and sequencing. All RNA samples were run on an aligent Bioanalyzer to check for degredation. All samples passed with a RIN >8. Libraries were created with an Illumina RNA TrueSeq kit v. (lookup version number). Insert sizes were less than 300 base pairs. Libraries for all 24 samples were multiplex indexed with unique barcodes and run over 4 lanes on an Illumina NextSeq500 resulting in nearly 300 million paired-end reads. 

###Data Analysis
A summary of the data analysis is available for download from GitHub, including all code used in the quality control, transcriptome assembly, differential expression analysis, and geneontology analysis. Raw sequencing files are available on request and all analysis should be reproducable with these files and code. A summary of this analysis follows. First raw files were concatenated by each individual across the 4 lanes of sequencing resulting in two fastq files for each individual, one for each read direction. These FASTQ files were runt through FastQC (source) and then trim galore (source) to to first idnetify the quality of the reads and to trim files to improve their quality. Default setting were used in both, and only paired reads retained after trimming. Trimmed files for each individual were retained for later differential expression analysis. All files were concatenated together, resulting in a forward and reverse read file with all paired reads for the entire sequencing set. These two files were used for the transcriptome assembly in Trinity (source). The high performance computer cluster at Indiana univeristy was used for the assembly of the transcriptome (url-linked: usegalaxy.org but for indiana). The assembled transcriptome was checked with Transrate or Busco(source). Individual reads were mapped back to the transcriptome using Kalisto (source) <need to find a better term than mapped>, counts for each individual were pulled together in a count matrix that consisted of unormalized rounded counts for each contig for each individual. DESeq2 (source) was used to conduct differential expression analysis by site, with individuals as bilogical replicates for each site. Comparisons were made against Coulter creek which is considered a reference site for this analysis. Additional comparisons were made against Issaquah creek for Swamp and Jenkins creeks, as Issaquah creek represents nearly as "clean" of stream as Coulter (little to no chemical detetcts in water chemistry). 

###Annotation of transcriptome

###Gene Ontology


##Results
###Transcriptome and Annotation
###Differential Expression Analysis
###Gene Ontology Analysis

##Disscusion

###How to manage gene ontology analysis
**Take enriched terms and then simplifiy with revigo.**
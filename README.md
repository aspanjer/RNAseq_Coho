#Coho Differential Expression Analysis


##Background

Coho Salmon (_Oncorhynchus kisutch_) are heavily dependent on small stream habitat for rearing, spending over a year in these habitats before out migrating. These fresh water habitats are susceptible to anthropogenic impact from structural changes to habitat, temperature effects from increased runoff and reduced canopy cover, flow changes, and an increased presence of toxicants both from point and non-point sources. As such, Coho health can serve of an indication of anthropogenic influence in these habitats and are of great interest due to their cultural and commercial importance. 

This project uses sequencing data from coho collected at four streams spanning an urban impact gradient. The objectives are:

1. Construct a de novo transcriptome for a non-sequenced species.
2. Use the annotated Rainbow Trout and Atlantic Salmon genomes to annotate the	resulting transcriptome.
3. Conduct differential expression analysis between habitat conditions with the intent of identifying biomarkers indicative of toxicant exposure, immune deficiencies, and temperature stress.
4. Use Gene Ontology analysis to explore the biological function of observed gene expression differences and to help explain the transcriptome in the context of other sequencing work that’s been completed on coho. 


##Directory 

Analyses: the results of each analytical step to complete the above objectives (e.g. FastQC results, trimmed sequencing files, etc)

BlastDB: the unique species specific blast databases used for annotating the transcriptome 

Data: the 48 raw PE sequencing files for each of the 24 sampled individual fish. 

Jupyter: contains the notebook for my main class project. Focuses on the de novo assembly of a coho transcriptome and subsequent differential expression analysis and annotation. 

Scripts: Scripts used for analysis that aren’t download directly to my computer through Anaconda (these will be documented in my notebook). 

##Timeline

###Week 4
Hopefully this weekend I will get the Trinity assembly for all 24 individuals started, as this will likely take the full week to run. While this is running I plan to write up the background methods section of my transcriptome paper, thus laying out the ground work for the rest of the quarter. 

###Week 5
This week will be about conducting differential expression analysis with the samples from the different sites and running blast to annotate the transcriptome. 
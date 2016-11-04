#Coho Differential Expression Analysis


##Background

Coho Salmon (_Oncorhynchus kisutch_) are heavily dependent on small stream habitat for rearing, spending over a year in these habitats before out migrating. These fresh water habitats are susceptible to anthropogenic impact from structural changes to habitat, temperature effects from increased runoff and reduced canopy cover, flow changes, and an increased presence of toxicants both from point and non-point sources. As such, Coho health can serve of an indication of anthropogenic influence in these habitats and are of great interest due to their cultural and commercial importance. 

This project uses sequencing data from coho collected at four streams spanning an urban impact gradient. The objectives are:

1. Construct a de novo transcriptome for a non-sequenced species.
2. Use the annotated Rainbow Trout and Atlantic Salmon genomes to annotate the	resulting transcriptome.
3. Conduct differential expression analysis between habitat conditions with the intent of identifying biomarkers indicative of toxicant exposure, immune deficiencies, and temperature stress.
4. Use Gene Ontology analysis to explore the biological function of observed gene expression differences and to help explain the transcriptome in the context of other sequencing work that’s been completed on coho. 


##Directory 

Analysis: the results of each analytical step to complete the above objectives (e.g. FastQC results, trimmed sequencing files, etc)

BlastDB: the unique species specific blast databases used for annotating the transcriptome 

Data_raw: the 48 raw PE sequencing files for each of the 24 sampled individual fish. (available on request)

Jupyter_notebook: contains the notebooks for my class project. Focuses on the de novo assembly of a coho transcriptome and subsequent differential expression analysis and annotation:

1. [DataQC and Trinity Prep](www.github.com)
2. [Differential Expression](www.github.com)
3. [Annotation](www.github.com)
4. [Gene Ontology](www.github.com)

Scripts: Scripts used for analysis that aren’t download directly to my computer through Anaconda (these will be documented in my notebook).

Screenshots: pictures for analysis documentation

##Release Versions

v.01- Initial project realease. The analyses are ongoing, but includes the basic framework for my class project. Currently waiting on complete transcriptome assembly to finish and still working on framework for GO enrichment analysis. 
 

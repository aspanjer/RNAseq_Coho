#Coho Differential Expression Analysis


##Background

Coho Salmon (_Oncorhynchus kisutch_) are heavily dependent on small stream habitat for rearing, spending over a year in these habitats before out migrating. These fresh water habitats are susceptible to anthropogenic impact from structural changes to habitat, temperature effects from increased runoff and reduced canopy cover, flow changes, and an increased presence of toxicants both from point and non-point sources. As such, Coho health can serve of an indication of anthropogenic influence in these habitats and are of great interest due to their cultural and commercial importance. 

This project uses sequencing data from coho collected at four streams spanning an urban impact gradient. The objectives are:

1. Construct a de novo transcriptome for a non-sequenced species.
2. Use the annotated Rainbow Trout and Atlantic Salmon genomes to annotate the	resulting transcriptome.
3. Conduct differential expression analysis between habitat conditions with the intent of identifying biomarkers indicative of toxicant exposure, immune deficiencies, and temperature stress.
4. Use Gene Ontology analysis to explore the biological function of observed gene expression differences and to help explain the transcriptome in the context of other sequencing work that’s been completed on coho. 

The final figures produced for the class project can be found in [FinalFigures](https://github.com/aspanjer/RNAseq_Coho/tree/master/FinalFigures). This includes a readme file containing captions for the numbered figures. 

[Manuscript.md](https://github.com/aspanjer/RNAseq_Coho/blob/master/Manuscript.md) is the start of a manuscript draft and currently includes methods and results. This is actively being worked on and subject to revison. 

##Directory 

[Analysis](https://github.com/aspanjer/RNAseq_Coho/tree/master/analysis): the results of each analytical step to complete the above objectives (e.g. FastQC results, trimmed sequencing files, etc)

[BlastDB](https://github.com/aspanjer/RNAseq_Coho/tree/master/BlastDB): the unique species specific blast databases used for annotating the transcriptome 

[Data_raw](https://github.com/aspanjer/RNAseq_Coho/tree/master/data_raw): the 48 raw PE sequencing files for each of the 24 sampled individual fish. (available on request)

[Jupyter_notebook](https://github.com/aspanjer/RNAseq_Coho/tree/master/jupyter_notebooks): contains the notebooks for my class project. Focuses on the de novo assembly of a coho transcriptome and subsequent differential expression analysis and annotation:

1. [DataQC and Trinity Prep](https://github.com/aspanjer/RNAseq_Coho/blob/master/jupyter_notebooks/1.%20DataQC%20and%20Trinity%20Prep.ipynb)
2. [Differential Expression](https://github.com/aspanjer/RNAseq_Coho/blob/master/jupyter_notebooks/2.%20Differential%20Expression.ipynb)
3. [Annotation](https://github.com/aspanjer/RNAseq_Coho/blob/master/jupyter_notebooks/3.Annotation.ipynb)
4. [Gene Ontology](http://localhost:8888/notebooks/RNAseq_Coho/jupyter_notebooks/4.%20Gene%20Ontology%20Enrichment%20Analysis.ipynb)

[Scripts](https://github.com/aspanjer/RNAseq_Coho/tree/master/scripts): Scripts used for analysis that aren’t download directly to my computer through Anaconda (these will be documented in my notebook).

[Screenshots](https://github.com/aspanjer/RNAseq_Coho/tree/master/scripts): pictures for analysis documentation

##Release Versions

v.01- Initial project realease. The analyses are ongoing, but includes the basic framework for my class project. Currently waiting on complete transcriptome assembly to finish and still working on framework for GO enrichment analysis. 

v.03- This final class version of my release includes the addition of the final analysis figures, updates to notebooks documenting analysis, and draft start for manuscript. 
 

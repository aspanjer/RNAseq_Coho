#based on https://wikis.utexas.edu/display/bioiteam/Go+Enrichment+analysis+using+goseq

#load libraries
source("https://bioconductor.org/biocLite.R")
biocLite("goseq")
library("geneLenDataBase")
library("BiasedUrn")
library("goseq")
library("GO.db")
library("lattice")

#Set working directory
setwd("/Users/hputnam/MyProjects/Taiwan_Larval_Transcripts/RAnalysis/Data") #set working directory

#Analysis for All DE (both Host and Sym together)

#read in data files
ALL<-read.table("5_ALL.txt", header = FALSE) #reads in list of all sequence ids
HOST.DEG <-read.table("6_HOST_DEG.txt", header = FALSE) #reads in list of host DEG
SYM.DEG <-read.table("7_SYM_DEG.txt", header = FALSE) #reads in list of sym DEG
LENGTH <-read.table("8_length.txt", sep = ",", header=TRUE) #reads in a list of gene lengths
GO <- read.table("9_GO_terms.txt", sep = "", header=TRUE)
IDs <- read.table("10_ids_mapping.txt", sep = "", header=TRUE)
Blast.name <- read.table("11_blast.txt", sep = "", header=TRUE)

#Merge files by ids
BLAST <- merge(Blast.name, IDs, by="pdam_id",  sort = FALSE)
GO.terms <- merge(GO, IDs, by="pdam_id",  sort = FALSE)

#write.csv(GO.terms, file = "GO.terms_by_transcript_id.csv")
GO.terms <- GO.terms[,2:3]


# To subset the genes in a GO Term of Interest
# x <- as.data.frame(hololist)
# GO.0005634 <-subset(x, GO_term=="GO:0005634", select=c("transcript_id", "GO_term"))

#change contig lists to vectors
HOST.vector <- c(t(HOST.DEG))
SYM.vector <- c(t(SYM.DEG))
ALL.vector <-c(t(ALL))
ID.vector <- LENGTH$transcript_id
LENGTH.vector <-LENGTH$length


#Construct new vector with 1 for DEG and 0 for others
#Host
host.gene.vector=as.integer(ALL.vector%in%HOST.vector)
names(host.gene.vector)=ALL.vector 
#explore this new vector 
head(host.gene.vector)
tail(host.gene.vector)

#Symbiont
sym.gene.vector=as.integer(ALL.vector%in%SYM.vector)
names(sym.gene.vector)=ALL.vector 
#explore this new vector 
head(sym.gene.vector)
tail(sym.gene.vector)

#weight vector by length of gene
host.pwf<-nullp(host.gene.vector, ID.vector, bias.data=LENGTH.vector)
sym.pwf<-nullp(sym.gene.vector, ID.vector, bias.data=LENGTH.vector)

#Find enriched GO terms, "selection-unbiased testing for category enrichment amongst differentially expressed (DE) genes for RNA-seq data"
Host.GO.wall<-goseq(host.pwf, ID.vector, gene2cat=GO.terms, test.cats=c("GO:CC", "GO:BP", "GO:MF"), method="Sampling", use_genes_without_cat=TRUE)
Sym.GO.wall<-goseq(sym.pwf, ID.vector, gene2cat=GO.terms, test.cats=c("GO:CC", "GO:BP", "GO:MF"), method="Sampling", use_genes_without_cat=TRUE)

#How many enriched GO terms do we have
#Host
class(Host.GO.wall)
head(Host.GO.wall)
nrow(Host.GO.wall)

#Symbiont
class(Sym.GO.wall)
head(Sym.GO.wall)
nrow(Sym.GO.wall)

#Find only enriched GO terms that are statistically significant at cutoff 
#Host
host.enriched.GO.05.a<-Host.GO.wall$category[Host.GO.wall$over_represented_pvalue<.05]
host.enriched.GO.05<-data.frame(host.enriched.GO.05.a)
colnames(host.enriched.GO.05) <- c("category")
host.enriched.GO.05 <- merge(host.enriched.GO.05, Host.GO.wall, by="category")

host.go.ontology  <- if(length(Host.GO.wall) > 0){
  # Get the ontology for the first element of df
  Ontology(Host.GO.wall[[1]])
}

host.go.term <- if(length(Host.GO.wall) > 0){
  # Get the TERMS for the first element of df
  Term(Host.GO.wall[[1]])
}
host.go.term <- as.data.frame(host.go.term)
host.go.term$GO.Term <- rownames(host.go.term)
colnames(host.go.term) <- c("Go.Term", "category")
rownames(host.go.term) <- NULL

host.go.ontology <- as.data.frame(host.go.ontology)
host.go.ontology$GO.Ontology <- rownames(host.go.ontology)
colnames(host.go.ontology) <- c("Go.Term", "category")
rownames(host.go.ontology) <- NULL

Host.Ontology <- merge(host.enriched.GO.05, host.go.ontology, by="category")
Host.Ontology <- merge(Host.Ontology, host.go.term, by="category")
colnames(Host.Ontology) <- c("category",  "over_represented_pvalue",	"under_represented_pvalue",	"numDEInCat",	"numInCat",	"Ontology",	"GO.Term")

write.csv(Host.Ontology, file = "Host_Sig_Enriched_GO.05.csv")

#Host
capture.output(for(go in host.enriched.GO.05.a[1:255]) { print(GOTERM[[go]])
                                                       cat("--------------------------------------\n")}, 
               file="Host_Sig_Enriched_GO.05_details.txt")

#Find only enriched GO terms that are statistically significant
#Symbiont
#Sym
sym.enriched.GO.05.a<-Sym.GO.wall$category[Sym.GO.wall$over_represented_pvalue<.05]
sym.enriched.GO.05<-data.frame(sym.enriched.GO.05.a)
colnames(sym.enriched.GO.05) <- c("category")
sym.enriched.GO.05 <- merge(sym.enriched.GO.05, Sym.GO.wall, by="category")

sym.go.ontology  <- if(length(Sym.GO.wall) > 0){
  # Get the ontology for the first element of df
  Ontology(Sym.GO.wall[[1]])
}

sym.go.term <- if(length(Sym.GO.wall) > 0){
  # Get the TERMS for the first element of df
  Term(Sym.GO.wall[[1]])
}
sym.go.term <- as.data.frame(sym.go.term)
sym.go.term$GO.Term <- rownames(sym.go.term)
colnames(sym.go.term) <- c("Go.Term", "category")
rownames(sym.go.term) <- NULL

sym.go.ontology <- as.data.frame(sym.go.ontology)
sym.go.ontology$GO.Ontology <- rownames(sym.go.ontology)
colnames(sym.go.ontology) <- c("Go.Term", "category")
rownames(sym.go.ontology) <- NULL

Sym.Ontology <- merge(sym.enriched.GO.05, sym.go.ontology, by="category")
Sym.Ontology <- merge(Sym.Ontology, sym.go.term, by="category")
colnames(Sym.Ontology) <- c("category",  "over_represented_pvalue",  "under_represented_pvalue",	"numDEInCat",	"numInCat",	"Ontology",	"GO.Term")

write.csv(Sym.Ontology, file = "Sym_Sig_Enriched_GO.05.csv")

#Sym
capture.output(for(go in sym.enriched.GO.05.a[1:216]) { print(GOTERM[[go]])
                                                         cat("--------------------------------------\n")}, 
               file="Sym_Sig_Enriched_GO.05_details.txt")



#################################
#GO SLIM was completed using CateGOrizer
#Zhi-Liang Hu, Jie Bao and James M. Reecy (2008) "CateGOrizer: A Web-Based Program to Batch Analyze Gene Ontology Classification Categories". Online Journal of Bioinformatics. 9 (2):108-112.
#Zhi-Liang Hu, Jie Bao and James M. Reecy (2007). "A Gene Ontology (GO) Terms Classifications Counter". Plant & Animal Genome XV Conference, San Diego, CA, January 13-17, 2007.
#Using personalzed GO Slim list
#GO.ID  GO.Term	GO.Cat
# GO:0008152	metabolic process	BP
# GO:0009987	cellular process	BP
# GO:0051179	localization	BP
# GO:0065007	biological regulation	BP
# GO:0050896	response to stimulus	BP
# GO:0051704	multi-organism process	BP
# GO:0023052	signaling	BP
# GO:0040011	locomotion	BP
# GO:0032502	developmental process	BP
# GO:0002376	immune system process	BP
# GO:0000003	reproduction	BP
# GO:0040007	growth	BP
# GO:0003824	catalytic activity	MF
# GO:0005488	binding	MF
# GO:0005215	transporter activity	MF
# GO:0005179	hormone activity	MF
# GO:0016020	membrane	CC
# GO:0043226	organelle	CC
# GO:0032991	macromolecular complex	CC

slim.data <- read.table("GO_SLIM_Results.csv", header=TRUE, sep=",") 
Host.BP <- slim.data[1:12,]
Host.CC <- slim.data[13:15,]
Host.MF <- slim.data[16:19,]

Sym.BP <- slim.data[20:31,]
Sym.CC <- slim.data[32:34,]
Sym.MF <- slim.data[35:38,]


par(mfrow = c(3, 2)) #3 rows by 2 columns
par(mar = c(4,12,1,1)) #set margins
barplot(Host.BP$Count, main="HOST",
        xlim = c(0, 140), 
        axes=FALSE, 
        beside=FALSE, 
        xpd=FALSE, 
        horiz=TRUE, 
        las=2, 
        names.arg=Host.BP$GO.Term, 
        col = 0, 
        cex.axis = 1, 
        cex.lab = 1, 
        cex = 1)
axis(side =1, cex.axis = 1)
mtext("Biological Process", side=1, line=2, cex=0.5)

barplot(Sym.BP$Count, main="SYMBIONT",
        xlim = c(0, 140), 
        axes=FALSE, 
        beside=FALSE, 
        xpd=FALSE, 
        horiz=TRUE, 
        las=2, 
        names.arg=Sym.BP$GO.Term, 
        col = 0, 
        cex.axis = 1, 
        cex.lab = 1, 
        cex = 1)
axis(side =1, cex.axis = 1)
mtext("Biological Process", side=1, line=2, cex=0.5)

barplot(Host.CC$Count, 
        xlim = c(0, 25), 
        axes=FALSE, 
        beside=FALSE, 
        xpd=FALSE, 
        horiz=TRUE, 
        las=2, 
        names.arg=Host.CC$GO.Term, 
        col = 0, 
        cex.axis = 1, 
        cex.lab = 1, 
        cex = 1)
axis(side =1, cex.axis = 1)
mtext("Cellular Component", side=1, line=2, cex=0.5)

barplot(Sym.CC$Count, 
        xlim = c(0, 25), 
        axes=FALSE, 
        beside=FALSE, 
        xpd=FALSE, 
        horiz=TRUE, 
        las=2, 
        names.arg=Sym.CC$GO.Term, 
        col = 0, 
        cex.axis = 1, 
        cex.lab = 1, 
        cex = 1)
axis(side =1, cex.axis = 1)
mtext("Cellular Component", side=1, line=2, cex=0.5)

barplot(Host.MF$Count, 
        xlim = c(0, 25), 
        axes=FALSE, 
        beside=FALSE, 
        xpd=FALSE, 
        horiz=TRUE, 
        las=2, 
        names.arg=Host.MF$GO.Term, 
        col = 0, 
        cex.axis = 1, 
        cex.lab = 1, 
        cex = 1)
axis(side =1, cex.axis = 1)
mtext("Molecular Function", side=1, line=2, cex=0.5)

barplot(Sym.MF$Count, 
        xlim = c(0, 25), 
        axes=FALSE, 
        beside=FALSE, 
        xpd=FALSE, 
        horiz=TRUE, 
        las=2, 
        names.arg=Sym.MF$GO.Term, 
        col = 0, 
        cex.axis = 1, 
        cex.lab = 1, 
        cex = 1)
axis(side =1, cex.axis = 1)
mtext("Molecular Function", side=1, line=2, cex=0.5)





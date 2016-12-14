#This file contains the code needed to perform differential expresion analysis on the 
#Coho_counts.txt data and subsequent visualization. Coho_counts.txt can be found here: 
#https://media.githubusercontent.com/media/aspanjer/RNAseq_Coho/master/analysis/Differential%20Expression/Coho_counts.txt 

source("https://bioconductor.org/biocLite.R")
biocLite("DESeq2")
library(DESeq2)
data<- read.table ("Coho_counts.txt", header=T)
rownames(data) <- data$target_id
data<-data[,-1]
deseq2.colData <- data.frame(condition=factor(c(rep("Coulter", 6), rep("Issaquah", 6), 
                                                rep("Jenkins",6), rep("Swamp",6))), 
                             type=factor(rep("paired-end", 24)))
rownames(deseq2.colData) <- colnames(data)

#make the data matrix
deseq2.dds <- DESeqDataSetFromMatrix(countData = data,
                                     colData = deseq2.colData, 
                                     design = ~ condition)

#run statistical model and get DE results
deseq2.dds <- DESeq(deseq2.dds)

#call results table for Issaquah v. Coulter
deseq2.IssCoulterres <- results(deseq2.dds, contrast= c("condition", "Issaquah", "Coulter"))
write.table(deseq2.IssCoulterres, file="ISvCO.txt")

#call results table for Jenkins v. Coulter
deseq2.JenkCoultres<- results (deseq2.dds, contrast = c("condition", "Jenkins", "Coulter"))
write.table(deseq2.JenkCoultres, file="JEvCO.txt")

#call results table for Swamp v Coulter
deseq2.SwampCoultres<-results(deseq2.dds, contrast = c("condition", "Swamp", "Coulter"))
write.table(deseq2.SwampCoultres, file="SWvCO.txt")

#Results files are used for all downstream analysis. The remainder of this code was used 
#to create figures that show the general pattern of DEGs:

###PCA grpah of individual counts
#instal pcaExploreer
source("https://bioconductor.org/biocLite.R")
biocLite("pcaExplorer")
library(pcaExplorer)
pcaExplorer() #to create PCA graph open pcaExplorer (which is a shiny app) using this comand, and follow instructions using Coho_counts.txt as the main input. 


###Heatmap for DE genes, Site-site comparison

#Read in files of differentially expressed genes:
Issaquah.DE<-read.table(file="IssaquahDE.txt", header=F)
Jenkins.DE<-read.table(file="JenkinsDE.txt", header=F)
Swamp.DE<-read.table(file="SwampDE.txt", header=F)

#Create a matrix of all DE genes for comparison
DE.mat<-cbind(Issaquah.DE[,c(1,3)],Jenkins.DE[,3],Swamp.DE[,3])
rownames(DE.mat)<-DE.mat$V1
colnames(DE.mat)<-c("Issaquah", "Jenkins", "Swamp")
DE.mat<-DE.mat[,-1]
#heatmap of DE genes across all sites
pheatmap(DE.mat,fontsize_col=20, show_rownames=F, main="Log-fold change for differentially expressed genes as compared to refrence site (Coulter)")

#create 3 plot volcano graph
par(mfrow=c(1,3),oma = c(4, 4, 2, 0), mar=c(2,0,2,.4) )
# The main plot
tmp <- deseq2.IssCoulterres
plot(tmp$baseMean, tmp$log2FoldChange, pch=20, cex=0.45, ylim=c(-3, 3), log="x", col="darkgray",
     main="Issaquah v. Coulter", xlab="", ylab="")
mtext("log2 Fold Change", side=2, line=2.2)
mtext("mean of normalized counts", side=1, line=2.3)

# Getting the significant points and plotting them again so they're a different color for each site comparison
tmp.sig <- deseq2.IssCoulterres[!is.na(deseq2.IssCoulterres$padj) & deseq2.IssCoulterres$padj <= 0.05, ]
points(tmp.sig$baseMean, tmp.sig$log2FoldChange, pch=20, cex=0.45, col="red")

#Jenkins pts
tmp2 <- deseq2.JenkCoultres
plot(tmp2$baseMean, tmp2$log2FoldChange, yaxt="n", pch=20, cex=0.45, ylim=c(-3, 3), log="x", col="darkgray",
     main="Jenkins v. Coulter")

tmp2.sig <- deseq2.JenkCoultres[!is.na(deseq2.JenkCoultres$padj) & deseq2.JenkCoultres$padj <= 0.05, ]
points(tmp2.sig$baseMean, tmp2.sig$log2FoldChange, pch=20, cex=0.45, col="red")

#Swamp pts
tmp3 <- deseq2.SwampCoultres
plot(tmp3$baseMean, tmp3$log2FoldChange, pch=20, yaxt="n", cex=0.45, ylim=c(-3, 3), log="x", col="darkgray",
     main="Swamp v. Coulter")

tmp3.sig <- deseq2.SwampCoultres[!is.na(deseq2.SwampCoultres$padj) & deseq2.SwampCoultres$padj <= 0.05, ]
points(tmp2.sig$baseMean, tmp2.sig$log2FoldChange, pch=20, cex=0.45, col="red")

mtext("DEG in Different Streams  (pval <= 0.05)", outer = TRUE, cex = 1.5)


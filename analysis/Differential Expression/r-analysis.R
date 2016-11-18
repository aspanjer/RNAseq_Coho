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
deseq2.dds <- DESeqDataSetFromMatrix(countData = data,
                                     colData = deseq2.colData, 
                                     design = ~ condition)
?results
deseq2.dds <- DESeq(deseq2.dds)
#call results table for Issaquah v. Coulter
deseq2.IssCoulterres <- results(deseq2.dds, contrast= c("condition", "Issaquah", "Coulter"))
write.table(deseq2.IssCoulterres, file="ISvCO.txt")

#call results table for Jenkins v. Coulter
deseq2.JenkCoultres<- results (deseq2.dds, contrast = c("condition", "Coulter", "Jenkins"))
write.table(deseq2.JenkCoultres, file="JEvCO.txt")

#call results table for Swamp v Coulter
deseq2.SwampCoultres<-results(deseq2.dds, contrast = c("condition", "Coulter", "Swamp"))
write.table(deseq2.SwampCoultres, file="SWvCO.txt")

head(deseq2.res, n=30)

dim(deseq2.res[!is.na(deseq2.res$padj) & deseq2.res$padj <= 0.05, ])

tmp <- deseq2.res
# The main plot
plot(tmp$baseMean, tmp$log2FoldChange, pch=20, cex=0.45, ylim=c(-3, 3), log="x", col="darkgray",
     main="DEG Virus Exposure  (pval <= 0.05)",
     xlab="mean of normalized counts",
     ylab="Log2 Fold Change")
# Getting the significant points and plotting them again so they're a different color
tmp.sig <- deseq2.res[!is.na(deseq2.res$padj) & deseq2.res$padj <= 0.05, ]
points(tmp.sig$baseMean, tmp.sig$log2FoldChange, pch=20, cex=0.45, col="purple")
# 2 FC lines
abline(h=c(-1,1), col="green")

head(tmp)
sig<-deseq2.res[!is.na(deseq2.res$padj) & deseq2.res$padj <= 0.05, ]
head(sig)
?write.table
write.table(sig, file="sig.txt")

#Gene Clustering 
library("genefilter")
library("pheatmap")
library("grid")
library("gpar")
rld<- rlog((deseq2.dds))
topVarGenes<-head(order(rowVars(assay(rld)),decreasing=TRUE),200)
?assay
mat<- assay(rld)[topVarGenes,]
mat<- mat - rowMeans(mat)
SWAMP<-mat[,-c(7:18)]
ISSAQUAH<-mat[,-c(13:24)] 
mat<-mat[,]
df<- as.data.frame(colData(rld)[,c("condition","type") ])
?colData
pheatmap(ISSAQUAH, annotation_col=df)

#Gene Clustering Pairwise Comparisons
#SWAMPvCoulter
data<- read.table ("Coho_counts.txt", header=T)
rownames(data) <- data$target_id
data<-data[,-1]
Swamp<-data[,-c(7:18)]
deseq2.colData.sw <- data.frame(condition=factor(c(rep("Coulter", 6), rep("Swamp",6))), 
                             type=factor(rep("paired-end", 12)))
rownames(deseq2.colData.sw) <- colnames(Swamp)
deseq2.dds.sw <- DESeqDataSetFromMatrix(countData = Swamp,
                                     colData = deseq2.colData.sw, 
                                     design = ~ condition)
deseq2.dds <- DESeq(deseq2.dds.sw)
rld.sw<- rlog((deseq2.dds.sw))
topVarGenes.sw<-head(order(rowVars(assay(rld.sw)),decreasing=TRUE),500)
mat.sw<- assay(rld.sw)[topVarGenes.sw,]
mat.sw<- mat.sw - rowMeans(mat.sw)
df.sw<- as.data.frame(colData(rld.sw)[,c("condition","type") ])
pheatmap(mat.sw, annotation_col=df.sw)

#IssaquahvCoulter
#data<- read.table ("Coho_counts.txt", header=T)
#rownames(data) <- data$target_id
#data<-data[,-1]
Issaquah<-data[,-c(13:24)]
deseq2.colData.IS <- data.frame(condition=factor(c(rep("Coulter", 6), rep("Issaquah",6))), 
                                type=factor(rep("paired-end", 12)))
rownames(deseq2.colData.IS) <- colnames(Issaquah)
deseq2.dds.IS <- DESeqDataSetFromMatrix(countData = Issaquah,
                                        colData = deseq2.colData.IS, 
                                        design = ~ condition)
deseq2.dds.IS <- DESeq(deseq2.dds.IS)
rld.IS<- rlog((deseq2.dds.IS))
topVarGenes.IS<-head(order(rowVars(assay(rld.IS)),decreasing=TRUE),200)
mat.IS<- assay(rld.IS)[topVarGenes.IS,]
mat.IS<- mat.IS[-1,]
mat.IS<- mat.IS - rowMeans(mat.IS)
df.IS<- as.data.frame(colData(rld.IS)[,c("condition","type") ])
pheatmap(mat.IS, annotation_col=df.IS)

#JenkinsvCoulter
#data<- read.table ("Coho_counts.txt", header=T)
#rownames(data) <- data$target_id
#data<-data[,-1]
Jenkins<-data[,-c(7:12, 19:24)]
deseq2.colData.JE <- data.frame(condition=factor(c(rep("Coulter", 6), rep("Jenkins",6))), 
                                type=factor(rep("paired-end", 12)))
rownames(deseq2.colData.JE) <- colnames(Jenkins)
deseq2.dds.JE <- DESeqDataSetFromMatrix(countData = Jenkins,
                                        colData = deseq2.colData.JE, 
                                        design = ~ condition)
deseq2.dds.JE <- DESeq(deseq2.dds.JE)
rld.JE<- rlog((deseq2.dds.JE))
topVarGenes.JE<-head(order(rowVars(assay(rld.JE)),decreasing=TRUE),200)
mat.JE<- assay(rld.JE)[topVarGenes.JE,]
mat.JE<- mat.JE - rowMeans(mat.JE)
mat.JE<-mat.JE[-1,]
df.JE<- as.data.frame(colData(rld.JE)[,c("condition","type") ])
pheatmap(mat.JE, annotation_col=df.JE)

#instal pcaExploreer
source("https://bioconductor.org/biocLite.R")
biocLite("pcaExplorer")
library(pcaExplorer)
?pcaExplorer
pcaExplorer()

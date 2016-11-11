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
summary(deseq2.IssCoulterres)
deseq2.IssCoultsig<-deseq2.IssCoulterres[!is.na(deseq2.IssCoulterres$padj) & deseq2.IssCoulterres$padj <= 0.05,]
write.table(deseq2.IssCoultsig, file="ISvCO.txt")

#call results table for Jenkins v. Coulter
deseq2.JenkCoultres<- results (deseq2.dds, contrast = c("condition", "Coulter", "Jenkins"))
deseq2.JenkCoultres<-deseq2.res[order(rownames(deseq2.JenkCoultres)),]
dim(deseq2.JenkCoultres[!is.na(deseq2.JenkCoultres$padj) & deseq2.JenkCoultres$padj <= 0.05,])

#call results table for Swamp v Coulter
deseq2.SwampCoultres<-results(deseq2.dds, contrast = c("condition", "Coulter", "Swamp"))
deseq2.SwampCoultres<-deseq2.SwampCoultres[order(rownames(deseq2.SwampCoultres)),]
dim(deseq2.SwampCoultres[!is.na(deseq2.SwampCoultres$padj) & deseq2.SwampCoultres$padj <=0.05,])

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

#instal pcaExploreer
source("https://bioconductor.org/biocLite.R")
biocLite("pcaExplorer")
library(pcaExplorer)
?pcaExplorer
pcaExplorer()

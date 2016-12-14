####GO Enrichment###

mf.JE.enrich<-read.delim(file="MF_Jenkins.txt", header=T)
mf.JE.order.enrich<-mf.JE.enrich[order(mf.JE.enrich$PValue),]
mf.JE.order.enrich.20<-mf.JE.enrich[c(1:15),]
mf.JE.order.enrich.20<-mf.JE.order.enrich.20[order(mf.JE.order.enrich.20$Count, decreasing= FALSE),]


#barplot for erichment molecular function
par(mfrow=c(3,1), oma=c(4,21,4,0), mar=c(.5,.5,.5,1))
barplot(mf.JE.order.enrich.20$Count, 
        names.arg = mf.JE.order.enrich.20$GO_Term, 
        horiz=TRUE, las=1, cex.names=1, xaxt="n")
mtext("Molecular Function", side=3, line=-14)

#cc
cc.JE.enrich<-read.delim(file="CC_Jenkins.txt", header=T)
cc.JE.order.enrich<-cc.JE.enrich[order(cc.JE.enrich$PValue),]
cc.JE.order.enrich.20<-cc.JE.enrich[c(1:15),]
cc.JE.order.enrich.20<-cc.JE.order.enrich.20[order(cc.JE.order.enrich.20$Count, decreasing=FALSE),]


#barplot for erichment
barplot(cc.JE.order.enrich.20$Count, 
        names.arg = cc.JE.order.enrich.20$GO_Term, 
        horiz=TRUE, las=1, cex.names=1, xaxt="n")
mtext("Cellular Component", side=3, line=-14.5)

#bp
bp.JE.enrich<-read.delim(file="BP_Jenkins.txt", header=T)
bp.JE.order.enrich<-bp.JE.enrich[order(bp.JE.enrich$PValue),]
bp.JE.order.enrich.20<-bp.JE.enrich[c(1:15),]
bp.JE.order.enrich.20<-bp.JE.order.enrich.20[order(bp.JE.order.enrich.20$Count, decreasing= FALSE),]


#barplot for erichment
barplot(bp.JE.order.enrich.20$Count, 
        names.arg = bp.JE.order.enrich.20$GO_Term, 
        horiz=TRUE, las=1, cex.names=1)
mtext("Biological Process", side=3, line=-14)
mtext("Number of DEGs belonging to GO term", side=1, outer=TRUE, line=2, at=.435)
mtext("B) Jenkins v Coulter", outer=TRUE,line=1, cex=1.5, adj=0, at=.03 )
mtext("GO Term", outer=TRUE, line=-1, cex=1, adj=1, at=-.03)


#barplot for revigo condensed terms (might be easier to write about)

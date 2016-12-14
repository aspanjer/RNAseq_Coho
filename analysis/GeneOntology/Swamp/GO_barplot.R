####GO Enrichment###
mf.SW.enrich<-read.delim(file="MF_Swamp.txt", header=T)
mf.SW.order.enrich<-mf.SW.enrich[order(mf.SW.enrich$PValue),]
mf.SW.order.enrich.20<-mf.SW.enrich[c(1:15),]
mf.SW.order.enrich.20<-mf.SW.order.enrich.20[order(mf.SW.order.enrich.20$Count, decreasing= FALSE),]
#barplot for erichment molecular function
par(mfrow=c(3,1), oma=c(4,22,4,0), mar=c(.5,.5,.5,1))
barplot(mf.SW.order.enrich.20$Count,
names.arg = mf.SW.order.enrich.20$GO_Term,
horiz=TRUE, las=1, cex.names=1, xaxt="n")
mtext("Molecular Function", side=3, line=-10)
#cc
cc.SW.enrich<-read.delim(file="CC_Swamp.txt", header=T)
cc.SW.order.enrich<-cc.SW.enrich[order(cc.SW.enrich$PValue),]
cc.SW.order.enrich.20<-cc.SW.enrich[c(1:15),]
cc.SW.order.enrich.20<-cc.SW.order.enrich.20[order(cc.SW.order.enrich.20$Count, decreasing= FALSE),]
#barplot for erichment
barplot(cc.SW.order.enrich.20$Count,
names.arg = cc.SW.order.enrich.20$GO_Term,
horiz=TRUE, las=1, cex.names=1, xaxt="n")
mtext("Cellular Component", side=3, line=-10)
#bp
bp.SW.enrich<-read.delim(file="BP_Swamp.txt", header=T)
bp.SW.order.enrich<-bp.SW.enrich[order(bp.SW.enrich$PValue),]
bp.SW.order.enrich.20<-bp.SW.enrich[c(1:15),]
bp.SW.order.enrich.20<-bp.SW.order.enrich.20[order(bp.SW.order.enrich.20$Count, decreasing= FALSE),]
#barplot for erichment
barplot(bp.SW.order.enrich.20$Count,
names.arg = bp.SW.order.enrich.20$GO_Term,
horiz=TRUE, las=1, cex.names=1)
mtext("Biological Process", side=3, line=-10)
mtext("Number of DEGs belonging to GO term", side=1, outer=TRUE, line=2, at=.435)
mtext("C) Swamp v Coulter", outer=TRUE,line=1, cex=1.5, adj=0, at=.03 )
mtext("GO Term", outer=TRUE, line=-1, cex=1, adj=1, at=-.03)

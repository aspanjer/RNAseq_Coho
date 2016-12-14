####GO Enrichment###
mf.IS.enrich<-read.delim(file="MF_Issaquah.txt", header=T)
mf.IS.order.enrich<-mf.IS.enrich[order(mf.IS.enrich$PValue),]
mf.IS.order.enrich.20<-mf.IS.enrich[c(1:15),]
mf.IS.order.enrich.20<-mf.IS.order.enrich.20[order(mf.IS.order.enrich.20$Count, decreasing= FALSE),]
#barplot for erichment molecular function
par(mfrow=c(3,1), oma=c(4,25,4,0), mar=c(.5,.5,.5,1))
barplot(mf.IS.order.enrich.20$Count,
names.arg = mf.IS.order.enrich.20$GO_Term,
horiz=TRUE, las=1, cex.names=1, xaxt="n")
mtext("Molecular Function", side=3, line=-10)
#cc
cc.IS.enrich<-read.delim(file="CC_Issaquah.txt", header=T)
cc.IS.order.enrich<-cc.IS.enrich[order(cc.IS.enrich$PValue),]
cc.IS.order.enrich.20<-cc.IS.enrich[c(1:15),]
cc.IS.order.enrich.20<-cc.IS.order.enrich.20[order(cc.IS.order.enrich.20$Count, decreasing= FALSE),]
#barplot for erichment
barplot(cc.IS.order.enrich.20$Count,
names.arg = cc.IS.order.enrich.20$GO_Term,
horiz=TRUE, las=1, cex.names=1, xaxt="n")
mtext("Cellular Component", side=3, line=-10)
#bp
bp.IS.enrich<-read.delim(file="BP_Issaquah.txt", header=T)
bp.IS.order.enrich<-bp.IS.enrich[order(bp.IS.enrich$PValue),]
bp.IS.order.enrich.20<-bp.IS.enrich[c(1:15),]
bp.IS.order.enrich.20<-bp.IS.order.enrich.20[order(bp.IS.order.enrich.20$Count, decreasing= FALSE),]
#barplot for erichment
barplot(bp.IS.order.enrich.20$Count,
names.arg = bp.IS.order.enrich.20$GO_Term,
horiz=TRUE, las=1, cex.names=1)
mtext("Biological Process", side=3, line=-10)
mtext("Number of DEGs belonging to GO term", side=1, outer=TRUE, line=2, at=.435)
mtext("A) Issaquah v Coulter", outer=TRUE,line=1, cex=1.5, adj=0, at=.03 )
mtext("GO Term", outer=TRUE, line=-1, cex=1, adj=1, at=-.03)

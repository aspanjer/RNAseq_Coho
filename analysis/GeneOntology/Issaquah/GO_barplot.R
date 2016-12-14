##Barplots for REVIGO molecular function
#import files and reduce down to top 20 by frequency
mf.IS<-read.csv(file="REVIGOmf.csv", header=T)
mf.IS.order<-mf.IS[order(mf.IS$frequency, decreasing= TRUE),]
mf.IS.order.20<-mf.IS.order[c(1:15),]
mf.IS.order.20<-mf.IS.order.20[order(mf.IS.order.20$frequency, decreasing= FALSE),]


#barplot for revigo condensed terms 
par(mfrow=c(3,1), oma=c(4,15,4,0), mar=c(.5,.5,.5,1))
barplot(mf.IS.order.20$frequency, 
        names.arg = mf.IS.order.20$description, 
        horiz=TRUE, las=1, cex.names=.7, xaxt="n")
mtext("Molecular Function", side=3, line=-10)

##Barplots for REVIGO molecular function
#import files and reduce down to top 20 by frequency
cc.IS<-read.csv(file="REVIGOcc.csv", header=T)
cc.IS.order<-cc.IS[order(cc.IS$frequency, decreasing= TRUE),]
cc.IS.order.20<-cc.IS.order[c(1:15),]
cc.IS.order.20<-cc.IS.order.20[order(cc.IS.order.20$frequency, decreasing= FALSE),]


#barplot for revigo condensed terms 
barplot(cc.IS.order.20$frequency, 
        names.arg = cc.IS.order.20$description, 
        horiz=TRUE, las=1, cex.names=.7, xaxt="n")
mtext("Cellular Component", side=3, line=-10)

##Barplots for REVIGO molecular function
#import files and reduce down to top 20 by frequency
bp.IS<-read.csv(file="REVIGObp.csv", header=T)
bp.IS.order<-bp.IS[order(bp.IS$frequency, decreasing= TRUE),]
bp.IS.order.20<-bp.IS.order[c(1:15),]
bp.IS.order.20<-bp.IS.order.20[order(bp.IS.order.20$frequency, decreasing= FALSE),]

#barplot for revigo condensed terms 
barplot(bp.IS.order.20$frequency, 
        names.arg = bp.IS.order.20$description, 
        horiz=TRUE, las=1, cex.names=.7, ylab="frequency of GO term")
mtext("Biological Process", side=3, line=-10)
mtext("frequency of GO term", side=1, outer=TRUE, line=2)
mtext("A) Issaquah v Coulter", outer=TRUE, adj=0 )


####GO Enrichment

mf.IS.enrich<-read.delim(file="BP_Issaquah.txt", header=T)
mf.IS.order.enrich<-mf.IS.enrich[order(mf.IS.enrich$PValue),]
mf.IS.order.enrich.20<-mf.IS.enrich[c(1:15),]
mf.IS.order.enrich.20<-mf.IS.order.enrich.20[order(mf.IS.order.enrich.20$Count, decreasing= FALSE),]


#barplot for erichment molecular function
par(mfrow=c(3,1), oma=c(4,18,4,0), mar=c(.5,.5,.5,1))
barplot(mf.IS.order.enrich.20$Count, 
        names.arg = mf.IS.order.enrich.20$GO_Term, 
        horiz=TRUE, las=1, cex.names=.7, xaxt="n")
mtext("Molecular Function", side=3, line=-10)

#cc
cc.IS.enrich<-read.delim(file="CC_Issaquah.txt", header=T)
cc.IS.order.enrich<-cc.IS.enrich[order(cc.IS.enrich$PValue),]
cc.IS.order.enrich.20<-cc.IS.enrich[c(1:15),]
cc.IS.order.enrich.20<-cc.IS.order.enrich.20[order(mf.IS.order.enrich.20$Count, decreasing= FALSE),]


#barplot for erichment
barplot(mf.IS.order.enrich.20$Count, 
        names.arg = mf.IS.order.enrich.20$GO_Term, 
        horiz=TRUE, las=1, cex.names=.7, xaxt="n")
mtext("Cellular Component", side=3, line=-10)

bp.IS.enrich<-read.delim(file="BP_Issaquah.txt", header=T)
bp.IS.order.enrich<-bp.IS.enrich[order(bp.IS.enrich$PValue),]
bp.IS.order.enrich.20<-bp.IS.enrich[c(1:15),]
bp.IS.order.enrich.20<-bp.IS.order.enrich.20[order(bp.IS.order.enrich.20$Count, decreasing= FALSE),]


#barplot for erichment
barplot(bp.IS.order.enrich.20$Count, 
        names.arg = bp.IS.order.enrich.20$GO_Term, 
        horiz=TRUE, las=1, cex.names=.7)
mtext("Biological Proccesst", side=3, line=-10)
mtext("Number of genes belonging to GO term", side=1, outer=TRUE, line=2)
mtext("A) Issaquah v Coulter", outer=TRUE, adj=0 )



#barplot for revigo condensed terms (might be easier to write about)

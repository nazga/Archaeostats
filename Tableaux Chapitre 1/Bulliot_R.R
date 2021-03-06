library("FactoMineR", lib.loc="~/R/win-library/3.1")
library("ggplot2", lib.loc="~/R/win-library/3.1")

#Data#
greppo <- read.csv("A MODIFIER /Bulliot_R.csv", sep=";")
summary(greppo)

#Multiple Correspondence Analysis#
res.mca = MCA(greppo, quali.sup=c(20:27), graph=FALSE)
plot.MCA(res.mca, autoLab=c("yes"), invisible=c("var","quali.sup"), cex=0.7)
plot.MCA(res.mca, autoLab=c("yes"), invisible=c("ind","quali.sup"), cex=0.7)
plot.MCA(res.mca, autoLab=c("yes"), invisible=c("ind","var"), cex=0.7)
plot.MCA(res.mca, autoLab=c("yes"), invisible=c("var","quali.sup"), cex=0.7, axes=3:4)
plot.MCA(res.mca, autoLab=c("yes"), invisible=c("ind","quali.sup"), cex=0.7, axes=3:4)
plot.MCA(res.mca, autoLab=c("yes"), invisible=c("ind","var"), cex=0.7, axes=3:4)
plot.MCA(res.mca, autoLab=c("yes"),selectMod = "cos2 10")
plot.MCA(res.mca, autoLab=c("yes"),selectMod = "contrib 10")
plot.MCA(res.mca, autoLab=c("yes"), invisible=c("ind","quali.sup"), cex=0.7, selectMod = "cos2 10")
plot.MCA(res.mca, autoLab=c("yes"), invisible=c("ind","quali.sup"), cex=0.7, selectMod = "contrib 10")
plot.MCA(res.mca, autoLab=c("yes"), invisible=c("ind","quali.sup"), cex=0.7, selectMod = "cos2 10", axes=3:4)
plot.MCA(res.mca, autoLab=c("yes"), invisible=c("ind","quali.sup"), cex=0.7, selectMod = "contrib 10", axes=3:4)
summary(res.mca)
res.hcpc <- HCPC(res.mca, nb.clust=0, conso=0, min=3, max=10)
dimdesc(res.mca)
dimdesc(res.mca,axes=1:2, proba=0.05)
dimdesc(res.mca,axes=3:4, proba=0.05)
plotellipses(res.mca)
res.mca$eig
aa=as.factor(rep(1:10,each=100))
bb=cbind.data.frame(aa,aa,aa,aa,aa,aa,aa,aa,aa,aa)
colnames(bb)=paste("a",1:10,sep="")
res=MCA(bb,graph=FALSE)
res$eig[1:10,]
burt=t(tab.disjonctif(greppo[,1:19]))%*%tab.disjonctif(greppo[,1:27])
res.burt=CA(burt, graph=FALSE)
res.burt$eig[1:10,]
res.mca$ind$contrib
res.mca$ind$cos2
res.mca$var$contrib
res.mca$var$cos2

#Clustering
library(cluster)
classif = agnes(res.mca$ind$coord,method="ward")
plot(classif,main="Dendrogram",ask=F,which.plots=2,labels=T)
clust = cutree(classif,k=3)
greppo.comp = cbind.data.frame(greppo,res.mca$ind$coord[,1:3],factor(clust))
res.aux = MCA(greppo.comp, quali.sup=c(21:27,28,29,30,31), graph=T)
plot(res.aux,invisible=c("quali.sup","var","quanti.sup"),habillage=31)
catdes(greppo.comp,ncol(greppo.comp))

#3D Plot
library(scatterplot3d)
with(greppo.com, {
  scatterplot3d(Dim 1,   # x axis
                Dim 2,     # y axis
                Dim 3,    # z axis
                main="3-D Scatterplot Example 1")
})

# Factorial Analysis on mixed data
library("FactoMineR", lib.loc="~/R/win-library/3.1")
greppo <- read.csv("D:/Travail/Tableaux/Statistiques/R/greppo_analyse.csv", sep=";")
res <- FAMD(greppo)
summary(res)
plot(res,habillage=1)
res.hcpc <- HCPC(res, nb.clust=0, conso=0, min=3, max=10)
#Panggil library yang diperlukan dan pastikan sudah install library tersebut
library(cluster)

#import data akreditasi sekolah
data <- read.csv(file.choose(),header = T) 
attach(data)

#Metode Hirarki
#matriks jarak
d<-dist(S1,S3,method="euclidean")
d

#dendogram
#Metode Nearest Neighbor
#penentuan kelompok
fit1<-hclust(d,method = "single")
#dendogram
plot(fit1,labels=data$NAMA.SEKOLAH,cex=0.5,main="Metode Nearets Neighbor")
#pemotongan dendogram (penentuan kelompok)
rect.hclust(fit1,k=4,border="red")
#daftar kelompok
groups<-cutree(fit1,k=4)
groups
#k=4 menyatakan dibagi kedalam 4 kelompok
a<-as.matrix(groups)
rownames(a)<-data$NAMA.SEKOLAH
a

#Metode Furtrest Neighbor
#penentuan kelompok
fit2<-hclust(d,method = "complete")
#dendogram
plot(fit2,labels=data$NAMA.SEKOLAH,cex=0.5,main="Metode Furthest Neighbor")
#pemotongan dendogram (penentuan kelompok)
rect.hclust(fit2,k=4,border="red")
#daftar kelompok
groups<-cutree(fit2,k=4)
groups
#k=4 menyatakan dibagi kedalam 4 kelompok
a<-as.matrix(groups)
rownames(a)<-data$NAMA.SEKOLAH
a

#Metode Centroid Linkage
#penentuan kelompok
fit2<-hclust(d,method = "centroid")
#dendogram
plot(fit2,labels=data$NAMA.SEKOLAH,cex=0.5,main="Metode Centroid Linkage")
#pemotongan dendogram (penentuan kelompok)
rect.hclust(fit2,k=4,border="red")
#daftar kelompok
groups<-cutree(fit2,k=4)
groups
#k=4 menyatakan dibagi kedalam 4 kelompok
a<-as.matrix(groups)
rownames(a)<-data$NAMA.SEKOLAH
a

#Metode Median Linkage
#penentuan kelompok
fit2<-hclust(d,method = "median")
#dendogram
plot(fit2,labels=data$NAMA.SEKOLAH,cex=0.5,main="Metode Median Linkage")
#pemotongan dendogram (penentuan kelompok)
rect.hclust(fit2,k=4,border="red")
#daftar kelompok
groups<-cutree(fit2,k=4)
groups
#k=4 menyatakan dibagi kedalam 4 kelompok
a<-as.matrix(groups)
rownames(a)<-data$NAMA.SEKOLAH
a

#Metode Average Linkage
#penentuan kelompok
fit2<-hclust(d,method = "average")
#dendogram
plot(fit2,labels=data$NAMA.SEKOLAH,cex=0.5,main="Metode Average Linkage")
#pemotongan dendogram (penentuan kelompok)
rect.hclust(fit2,k=4,border="red")
#daftar kelompok
groups<-cutree(fit2,k=4)
groups
#k=4 menyatakan dibagi kedalam 4 kelompok
a<-as.matrix(groups)
rownames(a)<-data$NAMA.SEKOLAH
a

#Metode Non-Hirarki
#K-Means
dataku<-cbind(S1,S3)
dataku
kluster<-kmeans(dataku,4,iter.max=1000)
kluster
names(kluster)
h<-data.frame(dataku,kluster[1])
h

#memplot kelompok
plot(h[,1:2],col=h$cluster,pch=20,main="K-Means")
text(data1,labels=(as.vector(data$NAMA.SEKOLAH)),cex=0.5,pos=1)
points(kluster$centers,col=c(1:2),pch=8,cex=1)
##cex adalah ukuran text, pos adalah posisi text, labels adalah nama text, pch adalah ketebalan titik, main adalah judul

#mencari tahu cluster yang cocok dengan akreditasi
library(car)
rowMeans(kluster$center)
h$cluster<-recode(h$cluster, '1="A"')
h$cluster<-recode(h$cluster, '2="B"')
h$cluster<-recode(h$cluster, '3="C"')
h$cluster<-recode(h$cluster, '4="TT"')
summary.factor(h$cluster)

#Clustering Biplot
pca<-princomp(dataku,cor=T,score=T)
pca
library(factoextra)
fviz_pca_biplot(pca,geom=c("point","text"),label="all",
                habillage = h$cluster,palette = palette(rainbow(24)),
                addEllipses = T,title = "Clustering Biplot")
hasil<-cbind(h$cluster,NAMA.SEKOLAH)
hasil
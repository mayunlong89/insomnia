#Rscript
#Author: Yunlong Ma
#E-mail: glb-biotech@zju.edu.cn
#Co-expression patterns by using the Pearson correlation analysis for Insomina-associated genes

#Tittle: Integrative genomics analysis identifies 5 promising genes implicated in insomnia risk based on multiple omics datasets

#Set up the working directory
setwd("C:\\Users\\Administrator\\Desktop\\corplot")

#Part I install package

#Installing corrplot package of R platform 
if(!require("corrplot"))install.packages("corrplot")

#Load the corrplot package
library(corrplot)


#Part II read relevant RNA expression data of co-expression analysis

#Read and re-organized insomnia-related expression data
pearson<- read.delim("insomnia.txt",header = T)
pearson_new2<-pearson[,c(-1,-2)] 
mat_pearson<-as.matrix(pearson_new2)
row.names(mat_pearson)<- pearson[,2]
correlation_insomnia <- cor(t(mat_pearson))


#Read and re-organized Control-related expression data
pearson_new<- read.delim("Control.txt",header = T)
pearson_new3<-pearson_new[,c(-1,-2)]
mat_pearson1<-as.matrix(pearson_new3)
row.names(mat_pearson1)<- pearson_new[,2]
correlation_Control <- cor(t(mat_pearson1))


#Part III Visualization

#Ploting the identified genes co-expression patterns in the insomnia group
corrplot(correlation_insomnia, method = "pie",tl.col = "black",tl.cex=0.8)

#Ploting the identified genes co-expression patterns in the control group
corrplot(correlation_Control, method = "pie",tl.col = "black",tl.cex=0.8,number.cex = 0.8)


#End

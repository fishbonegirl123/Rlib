###################################################
###cor, code corp, $df should be replaced
###################################################
#data example
n<-10
df<-data.frame(y1=abs(rnorm(n)),y2=abs(rnorm(n)),y3=abs(rnorm(n)))

library(ggplot2)
#列相关性
cor.matrix <- cor(df)
correlations <- as.numeric(cor.matrix)
ggplot(data.frame(Correlation = correlations),        
       aes(x = Correlation, fill = 1)) +  
  geom_density() +  
  theme(legend.position = 'none')


#pca
library(caret)
pca <- princomp(df[,2:ncol(df)])
pca
#观察第一载荷的分布
principal.component <- pca$loadings[,1]
loadings <- as.numeric(principal.component)
ggplot(data.frame(Loading = loadings), 
       aes(x = Loading, fill = 1)) +
  geom_density() +
  theme(legend.position = 'none')
#把主成分转换为1列
df.index<- predict(pca)[,1]

#removing highly correlated variables
high_cor <- findCorrelation(cor.matrix, cutoff = 0.99)
high_cor
df <- df[,-c(high_cor)]
df

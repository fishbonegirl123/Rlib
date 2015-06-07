###################################################
###cor, code corp, $df should be replaced
###################################################
#data example
df<-matrix(1:12, ncol=4, byrow=T)

library(ggplot2)
#列相关性
cor.matrix <- cor(df)
correlations <- as.numeric(cor.matrix)
ggplot(data.frame(Correlation = correlations),        
       aes(x = Correlation, fill = 1)) +  
  geom_density() +  
  theme(legend.position = 'none')
#列正相关，可以使用pca
pca <- princomp(df[,2:ncol(df)])
pca
#观察第一载荷的分布
principal.component <- pca$loadings[,1]
loadings <- as.numeric(principal.component)
ggplot(data.frame(Loading = loadings), 
       aes(x = Loading, fill = 1)) +
  geom_density() +
  theme(legend.position = 'none')

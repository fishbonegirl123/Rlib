###################################################
###cor, code corp, $df should be replaced
###################################################
#data example
df<-matrix(1:12, ncol=4, byrow=T)

library(ggplot2)
#�������
cor.matrix <- cor(df)
correlations <- as.numeric(cor.matrix)
ggplot(data.frame(Correlation = correlations),        
       aes(x = Correlation, fill = 1)) +  
  geom_density() +  
  theme(legend.position = 'none')
#������أ�����ʹ��pca
pca <- princomp(df[,2:ncol(df)])
pca
#�۲��һ�غɵķֲ�
principal.component <- pca$loadings[,1]
loadings <- as.numeric(principal.component)
ggplot(data.frame(Loading = loadings), 
       aes(x = Loading, fill = 1)) +
  geom_density() +
  theme(legend.position = 'none')
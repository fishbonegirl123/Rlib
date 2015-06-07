###source(mylib/libDataView.R)

###################################################
###whole view
###################################################
wholeView <- function(dataframe)
{
  print(summary(dataframe))
}

data(algae)
wholeView(algae)


###################################################
###data hist and boxplot, dis=distribuiton
###################################################
dataDis <- function(colname,title) 
{
  print(summary(colname))
  #hist
  par(mfrow=c(1,2))
  hist(colname,main=title,xlab=title,prob=T)
  lines(density(colname,na.rm=T))
  rug(jitter(colname))
  
  #boxplot
  boxplot(colname,main=title,ylab=title)
  rug(jitter(colname),side=2)
  abline(h=mean(colname,na.rm=T),lty=2)
  par(mfrow=c(1,1))
}

dataDis(algae$Cl,"Cl")
dataDis(algae$a1,"a1")

###################################################
###data-type bwplot, dis=distribuiton
###################################################
dataTypeDis <- function(dataframe,datacol,typecol,xlab,ylab) 
{
  bwplot(typecol ~ datacol, data=dataframe,ylab=ylab,xlab=xlab)
}

dataTypeDis(algae,algae$a1,algae$size,"a1","size")

boxplot(summary(algae$season))



###################################################
###cor, code corp, df should be replaced
###################################################
#数据准备
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

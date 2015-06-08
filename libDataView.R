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
###date processing, code corp, panel should be replaced
###################################################
panel$year <- substr(as.character(panel$Open.Date),7,10)
panel$month <- substr(as.character(panel$Open.Date),1,2)
panel$day <- substr(as.character(panel$Open.Date),4,5)

panel$Date <- as.Date(strptime(panel$Open.Date, "%m/%d/%Y"))

panel$days <- as.numeric(as.Date("2014-02-02")-panel$Date)

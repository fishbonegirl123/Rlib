###source(mylib/libEva.R)

###################################################
###PRcurve
###################################################
library(ROCR)

PRcurve <- function(preds,trues,...) {
  require(ROCR,quietly=T)
  pd <- prediction(preds,trues)
  pf <- performance(pd,'prec','rec')
  pf@y.values <- lapply(pf@y.values,function(x) rev(cummax(rev(x))))
  plot(pf,...)
}

data(ROCR.simple)
PRcurve(ROCR.simple$predictions, ROCR.simple$labels )

###################################################
###CRchart-Cumulative Recall Chart
###################################################
library(ROCR)
CRchart <- function(preds,trues,...) {
  require(ROCR,quietly=T)
  pd <- prediction(preds,trues)
  pf <- performance(pd,'rec','rpp')
  plot(pf,...)
}  

CRchart(ROCR.simple$predictions, ROCR.simple$labels, 
        main='Cumulative Recall Chart')


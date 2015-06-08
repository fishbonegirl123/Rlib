###source(mylib/libModule.R)

###################################################
###linear regression module-lm(code corp,$* should be replaced)
###################################################
lm.de1 <- lm($dependent ~ .,data=$dataframe)

#optimization 1
anova(lm.de1)
lm.de2 <- update(lm.de1,.~.-$least_contribution)
anova(lm.de1,lm.de2)

#optimization 2
lm.de3<-step(lm.de1)
summary(lm.de3)

###################################################
###RandomFroest CV(cross validation),code corp, X_train/X_test should be replaced 
###################################################
source("./libRandomForest_R.R")

# 5-fold cross validation and scoring
model_rf_1 <- RandomForestRegression_CV(X_train,result,X_test,cv=5,ntree=25,nodesize=5,seed=235,metric="rmse")
model_rf_2 <- RandomForestRegression_CV(X_train,result,X_test,cv=5,ntree=25,nodesize=5,seed=357,metric="rmse")
model_rf_3 <- RandomForestRegression_CV(X_train,result,X_test,cv=5,ntree=25,nodesize=5,seed=13,metric="rmse")
model_rf_4 <- RandomForestRegression_CV(X_train,result,X_test,cv=5,ntree=25,nodesize=5,seed=753,metric="rmse")
model_rf_5 <- RandomForestRegression_CV(X_train,result,X_test,cv=5,ntree=25,nodesize=5,seed=532,metric="rmse")

## submission
test_rf_1 <- model_rf_1[[2]]
test_rf_2 <- model_rf_2[[2]]
test_rf_3 <- model_rf_3[[2]]
test_rf_4 <- model_rf_4[[2]]
test_rf_5 <- model_rf_5[[2]]

submit <- data.frame("Id" = test_rf_1$Id,
                     "Prediction" = 0.2*exp(test_rf_1$pred_rf) + 0.2*exp(test_rf_2$pred_rf) + 0.2*exp(test_rf_3$pred_rf) + 0.2*exp(test_rf_4$pred_rf) + 0.2*exp(test_rf_5$pred_rf))

write.csv(submit, "./submit.csv", row.names=F)

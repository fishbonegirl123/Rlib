###source(mylib/libModule.R)

###################################################
###linear regression module-lm(code corp,$* should be replace)
###################################################
lm.de1 <- lm($dependent ~ .,data=$dataframe)

#optimization 1
anova(lm.de1)
lm.de2 <- update(lm.de1,.~.-$least_contribution)
anova(lm.de1,lm.de2)

#optimization 2
lm.de3<-step(lm.de1)
summary(lm.de3)

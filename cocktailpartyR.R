library(tuneR)
library(MASS)
library(pracma)
sndObj <- readWave('mic1.wav')
str(sndObj)
s1 <- sndObj@left
sndObj2 <- readWave('mic2.wav')
str(sndObj2)
s2 <- sndObj2@left
X <- matrix(c(s1, s2), ncol=2)
Y <- repmat(sum(t(X) %*% X,1),size(X,1),1)
Z <- t(Y)%*%X
S <- Z%*%t(X)
E <- svd(S)
write.csv(E$v, file = "MyData.csv")

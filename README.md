# ICA_Audio
Machine learning algorithm for cocktail party problem. 

In this short project, I tried to combine matlab and R inorder to solve a cocktail party problem. The file named cocktailpartyR.R reads the two wav files then use Singular value decomposition (sdv) function. It is widely used in statistics where it is related to principal component analysis and here I use it to separate the mixed audio signals. Later I saved the new signal as a CSV file. 

R:

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

matlab:

clear all
clc
close all

filename1 = 'mic1.wav';
[y1, Fs1] = wavread(filename1);

filename2 = 'mic2.wav';
[y2, Fs2] = wavread(filename2);

%sound(yy)

 filename = 'MyData.csv';
 M = csvread(filename,1,1);
 sound(abs(M))

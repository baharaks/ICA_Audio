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

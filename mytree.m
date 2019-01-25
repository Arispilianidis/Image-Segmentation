%% arxika
clear all;
close all;
clc;
load('dip_hw_3.mat');
rng(1);
%fila=exoyn 1 h kanena paidi
%% d2a me T1
disp('Calculating 1o peirama...');
img=d2a;
tic;
W=Image2Graph(img);
%imshow(W1,[]);
time1=toc;
%%

myfun(W,img,k,T1)

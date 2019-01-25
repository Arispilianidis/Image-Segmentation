%% arxika
clear all;
close all;
clc;
load('dip_hw_3.mat');
rng(1);

%% Spectral Clustering k=2
tic
k=2;
clusterId2 = mySpectralClustering(d1a,k);
time1=toc;

%% Spectral Clustering k=3
tic
k=3;
clusterId3 = mySpectralClustering(d1a,k);
time2=toc;

%% Spectral Clustering k=4 
tic
k=4;
clusterId4 = mySpectralClustering(d1a,k);
time3=toc;

%% display

disp(['clust2 clust3 clust4']);
disp([clusterId2 clusterId3 clusterId4]);
disp(['    time2     time3     time4']);
disp([time1 time2 time3]);
%posa=length(find(clusterId2==1));








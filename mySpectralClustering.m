function [ clusterIdx ] = mySpectralClustering(anAffinityMat , k)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
%% 
W=anAffinityMat;
D=zeros(length(W));

%% D
for i=1:length(W)
    D(i,i)=sum(W(i,:));
end

%% L
L=D-W;

%U pinakas me k idiodianismata san stiles, V diagonios me tis k mikroteres idiotimes
[U,~]=eigs(L,k,'SM');

clusterIdx =kmeans(U,k);

end


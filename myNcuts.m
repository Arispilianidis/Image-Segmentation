function [ clusterIdx ] = myNcuts(anAffinityMat,k)
%MYNCUTS Summary of this function goes here
%   Detailed explanation goes here
W=anAffinityMat;
D=zeros(length(W));

%% D
for i=1:length(W)
    D(i,i)=sum(W(i,:));
end

%% To (D-W)*y= lambda*D*y ginetai D^(-1/2)*(D-W)*D^(-1/2)*x=lamda*x
sth=D^(-1/2);
L=sth*(D-W)*sth;

%U pinakas me k idiodianismata san stiles, V diagonios me tis k mikroteres idiotimes
[U,~]=eigs(L,k,'SM');

clusterIdx =kmeans(U,k);

end


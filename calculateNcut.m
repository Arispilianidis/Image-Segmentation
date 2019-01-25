function [ nCutValue ] = calculateNcut( anAffinityMat , clusterIdx)
%CALCULATENCUT Summary of this function goes here
%   Detailed explanation goes here

%assocAA=a8roisma twn barwn twn kombwn me etiketa A
%NassocAB=1+2
%ncutValue=2-NassocAB

W=anAffinityMat;
A=find(clusterIdx==1);
B=find(clusterIdx==2);

%assocAA= a8roisma twn barwn twn akmwn poy anikoyn sto 1o cluster
assocAA=0;
for i=1:length(A)
    for j=1:length(A)
        assocAA= assocAA + W(A(i),A(j));
    end
end

%assocBB= a8roisma twn barwn twn akmwn poy anikoyn sto 2o cluster
assocBB=0;
for i=1:length(B)
    for j=1:length(B)
        assocBB= assocBB + W(B(i),B(j));
    end
end

%assocAV=a8roisma twn barwn twn akmwn twn kombwn sto 1o cluster me olous
%tous kombous tou grafou
assocAV=0;
for i=1:length(A)
    for j=1:length(W)
        assocAV =assocAV + W(A(i),j) ;  
    end
end

%assocBV=a8roisma twn barwn twn akmwn twn kombwn sto 2o cluster me olous
%tous kombous tou grafou
assocBV=0;
for i=1:length(B)
    for j=1:length(W)
        assocBV =assocBV + W(B(i),j) ;  
    end
end


NassocAB =(assocAA/assocAV) + (assocBB/assocBV);

nCutValue=2-NassocAB;


end


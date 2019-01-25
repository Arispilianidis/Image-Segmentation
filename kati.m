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
%% anadromiki me8odos
%tic
k=2;
global count;
count=0;
global p;
p=struct;
T1=1300;%1500 gia 1 bima mono
T2=0.20;
global sth;
sth=1;
level=0;
global c;
c=0;
global filo;

%% apo edw ksekiname
%1h fora. prepei na einai ektos anadromis giati xreiazomai ta proigoymena
%WA kai WB ta opoia den iparxoyn stin arxi.
tic
count=count+1;%count=1;
p(count).W=W;
clusterIdx=myNcuts(p(count).W,k);
p(count).nCutValue=calculateNcut(p(count).W,clusterIdx);
perioxesA=find(clusterIdx==1);
perioxesB=find(clusterIdx==2);

p(count).imOutA=print(perioxesA,img);
WA= Image2Graph(p(count).imOutA);

p(count).imOutB=print(perioxesB,img);
WB= Image2Graph(p(count).imOutB);

%des an 8a sinexisei i dixotomisi apo to 1o kommati
if (length(perioxesA)>T1)
    p(count).WA=WA;
  
else  
    p(count).WA=[];
   
end
%des an 8a sinexisei i dixotomisi apo to 2o kommati
if (length(perioxesB)>T1) 
    p(count).WB=WB;   
else  
    p(count).WB=[];
end

%     if p(count).WA==0
%         if p(count).WB==0
%          c=c+1;
%          filo(c)=count;  
%         end
%     end 

%bazoyme ston pinaka filo, tis eikones pou 8a xwristoun ,estw mono apo tin mia
%meria
%an einai adio to WA tote elenxoyme an einai adio kai to WB gia na
%ektiposoyme tis antistixes eikones
     if (isempty(p(count).WA))
         if (~isempty(p(count).WB))
            imshow(p(count).imOutA);
         end
         imshow(p(count).imOutA);
         imshow(p(count).imOutB);
     else
         if (isempty(p(count).WB))
             imshow(p(count).imOutB);
         end   
     end

time2=toc;
%% 
tic;

global teloscounter;
teloscounter=0;
while 1
 
    
    for i=1:2^level
        
      myRecNcutsA(k,T1,p((count+1)-sth).imOutA);%k=2,p(1),count=1;
      myRecNcutsB(k,T1,p((count)-sth).imOutB);%k=2,p(1),count=1;
           
    end 
    level=level+1;
    
    if teloscounter==2^(level) %an exw midenika osa einai to level simainei oti exw mono fila kai sinepws prepei na teliwsei i anadromi
          break;
    else
        teloscounter=0;
    end
     
end
timerec=toc;

%printare oles tis eikones poy prokiptoyn apo fila
tic;
for i=1:length(filo) % pame me bima 2 dioti sto pinaka filo
 
    figure;
    imshow(p(filo(i)).imOutA);
   
    figure;
    imshow(p(filo(i)).imOutB);
  
end
timeend=toc;




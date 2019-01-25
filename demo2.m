
%% arxika
clear all;
close all;
clc;
load('dip_hw_3.mat');
rng(1);

%% 1o peirama (d2a)
img=d2a;

tic;
W1=Image2Graph(img);
%imshow(W1,[]);
time1=toc;

%% Spectral Clustering k=2
disp('Calculating 1o peirama...');
tic
k=2;
clusterId2 = mySpectralClustering(W1,k);
time2=toc;
%% Gia na doume se pies perioxes xwrizetai h eikona
%briskoyme arxika ta indexes poy antistoixoyn stis
%perioxes "1","2" ktl kai ftiaxnoyme enan pinaka poy 
%exei 1 se autes tis 8eseis kai 0 stis ipoloipes kai stin sinexeia
%pollaplasiasoyme stoixeio pros stoixio ton pinaka me tin eikona
for l=1:k
    
im1=find(clusterId2==l);
filt=zeros(size(img,1),size(img,2));

for i=1:length(im1)
    
      sth=im1(i)/size(img,1);
      row=floor(sth);
      fract =sth-row;
      
       if row==0
          row=1;
       end
      
      if fract==0
          fract=1;
      end
      col= fract * size(img,2);
      filt(row,round(col))=1;
end
filt(:,:,2)=filt;
filt(:,:,3)=filt(:,:,1);

imOutB=filt.*img;
figure;
imshow(imOutB);
    
end


%% Spectral Clustering k=3
tic
k=3;
clusterId3 = mySpectralClustering(W1,k);
time3=toc;
for l=1:k
    
im1=find(clusterId3==l);
filt=zeros(size(img,1),size(img,2));

for i=1:length(im1)
    
      sth=im1(i)/size(img,1);
      row=floor(sth);
      fract =sth-row;
      
       if row==0
          row=1;
       end
      
      if fract==0
          fract=1;
      end
      col= fract * size(img,2);
      filt(row,round(col))=1;
end
filt(:,:,2)=filt;
filt(:,:,3)=filt(:,:,1);

imOutB=filt.*img;
figure;
imshow(imOutB);
    
end

%% Spectral Clustering k=4 
tic
k=4;
clusterId4 = mySpectralClustering(W1,k);
time4=toc;

for l=1:k
    
im1=find(clusterId4==l);
filt=zeros(size(img,1),size(img,2));

for i=1:length(im1)
    
      sth=im1(i)/size(img,1);
      row=floor(sth);
      fract =sth-row;
      
       if row==0
          row=1;
       end
      
      if fract==0
          fract=1;
      end
      col= fract * size(img,2);
      filt(row,round(col))=1;
end
filt(:,:,2)=filt;
filt(:,:,3)=filt(:,:,1);

imOutB=filt.*img;
figure;
imshow(imOutB);
    
end

%% display apotelesmata 1ou peiramatos

disp('1o peirama');
disp(['clust2 clust3 clust4']);
disp([clusterId2 clusterId3 clusterId4]);
disp(['    time2     time3     time4']);
disp([time2 time3 time4]);
%posa=length(find(clusterId2==1));

%% 2o peirama (d2b)
img=d2b;

tic;
W2=Image2Graph(img);
%imshow(W2,[]);
time1=toc;

%% Spectral Clustering k=2
disp('Calculating 2o peirama...');
tic
k=2;
clusterId2 = mySpectralClustering(W2,k);
time2=toc;
for l=1:k
    
im1=find(clusterId2==l);
filt=zeros(size(img,1),size(img,2));

for i=1:length(im1)
    
      sth=im1(i)/size(img,1);
      row=floor(sth);
      fract =sth-row;
      
       if row==0
          row=1;
       end
      
      if fract==0
          fract=1;
      end
      col= fract * size(img,2);
      filt(row,round(col))=1;
end
filt(:,:,2)=filt;
filt(:,:,3)=filt(:,:,1);

imOutB=filt.*img;
figure;
imshow(imOutB);
    
end

%% Spectral Clustering k=3
tic
k=3;
clusterId3 = mySpectralClustering(W2,k);
time3=toc;
for l=1:k
    
im1=find(clusterId3==l);
filt=zeros(size(img,1),size(img,2));

for i=1:length(im1)
    
      sth=im1(i)/size(img,1);
      row=floor(sth);
      fract =sth-row;
      
       if row==0
          row=1;
       end
      
      if fract==0
          fract=1;
      end
      col= fract * size(img,2);
      filt(row,round(col))=1;
end
filt(:,:,2)=filt;
filt(:,:,3)=filt(:,:,1);

imOutB=filt.*img;
figure;
imshow(imOutB);
    
end


%% Spectral Clustering k=4 
tic
k=4;
clusterId4 = mySpectralClustering(W2,k);
time4=toc;

for l=1:k
    
im1=find(clusterId4==l);
filt=zeros(size(img,1),size(img,2));

for i=1:length(im1)
    
      sth=im1(i)/size(img,1);
      row=floor(sth);
      fract =sth-row;
      
       if row==0
          row=1;
       end
      
      if fract==0
          fract=1;
      end
      col= fract * size(img,2);
      filt(row,round(col))=1;
end
filt(:,:,2)=filt;
filt(:,:,3)=filt(:,:,1);

imOutB=filt.*img;
figure;
imshow(imOutB);
    
end
%% display apotelesmata 2ou peiramatos

disp('2o peirama');
disp(['clust2 clust3 clust4']);
disp([clusterId2 clusterId3 clusterId4]);
disp(['    time2     time3     time4']);
disp([time2 time3 time4]);
%posa=length(find(clusterId2==1));



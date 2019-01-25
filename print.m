function [imOutB] = print(im1,img)
%PRINT Summary of this function goes here
%   sinartisi mesw tis opoias pernoyme tis epimeroys eikones twn eikonwn poy
%   xwrisame


%im1=find(clusterId2==l);
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
% figure;
% imshow(imOutB);
    
end




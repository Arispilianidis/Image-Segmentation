function myAffinityMat = Image2Graph(imIn)
%IMAGE2GRAPH Summary of this function goes here
%   Detailed explanation goes here


% pernoyme to 1o-2o-3o kanali tis eikonas
im1=imIn(:,:,1);
im2=imIn(:,:,2);
im3=imIn(:,:,3);

% fernoume ta kanalia se morfi dianismatos(ana seira)
im1=reshape(im1',[],1);
im2=reshape(im2',[],1);
im3=reshape(im3',[],1);

% ftiaxnoume ton pinaka eksodou mege8oys (mxn) x (mxn)
len=size(imIn,1)*size(imIn,2);
myAffinityMat=zeros(len);


%ipologizoume to Affinity(i,j) mono an den to exoume ipologisei
% proigoymenos logw simetrias
for i=1:len
    for j=1:len
        if(myAffinityMat(i,j)==0)
            dist= sqrt( (im1(i)-im1(j))^2 + (im2(i)-im2(j))^2 + (im3(i)-im3(j))^2);
            myAffinityMat(i,j)= 1 /(exp(dist));
            myAffinityMat(j,i)=myAffinityMat(i,j);
        end
    end
end

%% elenxos gia simmetria. Simmetrikos an A=A'

% kati=myAffinityMat';
% if kati==myAffinityMat
%     disp('simmetrikos');
% else
%     disp('oxi simmetrikos');
% end
% 
% % elenxos an iparxei mideniko ston pinaka
% kati=find(myAffinityMat==0);
% if size(kati,1)==0
%     disp('den iparxei mideniko ara fully-connected');
% else
%     disp('iparxei mideniko');
% end


end


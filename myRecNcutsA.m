function [ ] = myRecNcutsA(k,T1,img)
%MYRECNCUTSA Summary of this function goes here
%   Detailed explanation goes here

global count;
global p;
global sth;
global c;
count=count+1;
global teloscounter;
global filo;

%an den einai adios o pinakas toy patera
if (~isempty(p(count-sth).WA))
    
    p(count).W=p(count-sth).WA;
    
    %gia memory efficient
        p(count-sth).WA=1;
    %efoson to pirame, den mas xreiazetai peretairw opote toy bazoyme tin
    %timi 1 gia na min exoyme pinaka 2500x2500(47 MB) poy den xrisimopiite
    %kai pianei mono mnimi
    
    clusterIdx=myNcuts(p(count).W,k);
    p(count).nCutValue=calculateNcut(p(count).W,clusterIdx);
    
    % gia memory efficient
    %p(count).W=1;
    p(count-sth).W=1;
     %efoson to pirame, den mas xreiazetai peretairw opote toys bazoyme tin
    %timi 1 gia na min exoyme pinaka 2500x2500(47 MB) poy den xrisimopiite
    %kai pianei mono mnimi
    
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
    if (length(perioxesB)>T1) %sinexizei i dixotomisi? an > 5 naimipws den xreiazetai tin proti fora?
        p(count).WB=WB;   
    else  
        p(count).WB=[];
    end
    
    
%% an exei estw kai ena paidi o kombos, tote ginetai filo     
   if (isempty(p(count).WA))
       if (isempty(p(count).WB))
            % den exei timi sta WA,WB ara den xreiazetai na apo8ikeusoyme
           % tin eikona gia ektipwsi
       else
           c=c+1;
           filo(c)=count;
       end   
   else
       if (isempty(p(count).WB))
         c=c+1;
         filo(c)=count;  
       else
          c=c+1;
          filo(c)=count;
       end
   end 
          
else %an einai adios o pinakas toy patera tote 8a einai kai tou paidiou
       teloscounter = teloscounter+1;
        p(count).WA=[]; 
        p(count).WB=[]; 
       
end


end 


function eig_vec= PCA( traindata )
%UNTITLED5 Summary of this function goes here
%   Detailed explanation goes here

size(traindata)
meandata=mean(traindata,1);%平均值
size(meandata)
%减去平均值
diffdata=zeros(size(traindata));
for i=1:size(traindata,1)
    diffdata(i,:)=traindata(i,:)-meandata;
end

%协方差
Covar=diffdata'*diffdata/(size(traindata,2)-1);
[V,D]=eig(Covar);
cols=size(V,2);
d1=diag(D);
[ftvadsort,index]=sort(d1,'descend');%特征值降序排列

ftvedsort=zeros(size(V,2),cols);
for i=1:cols
    ftvedsort(:,i)=V(:,index(i));
end

sum_fva=sum(ftvadsort);
sum_ex=0;
num_fva=0;
    while ((sum_ex/sum_fva)<0.95)
        num_fva=num_fva+1;
        sum_ex=sum(ftvadsort(1:num_fva));
    end
    
for i=1:num_fva
    if(ftvadsort(i)>0)
          eig_vec(:,i) =  ftvedsort(:,i);   
    end
end
end


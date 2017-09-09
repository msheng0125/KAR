clear all;
close all;
clc;

load('train_data.mat');
[datarows,datacols]=size(yidali_train);
label=cell(datarows,datacols);
for row=1:datarows
    for col=1:datacols
        [drows,dcols]=size(yidali_train{row,col});
        label{row,col}=zeros(1,dcols)+col;
    end
end

trainmat=cell2mat(yidali_train);
trainmatt=trainmat';
% [coeff, score, latent, tsquare]=princomp(trainmatt);
% sum_fva=sum(latent);
% sum_ex=0;
% num_fva=0;
%     while ((sum_ex/sum_fva)<0.85)
%         num_fva=num_fva+1;
%         sum_ex=sum(latent(1:num_fva));
%     end
% eig_vec=coeff(:,1:num_fva);
%eig_vec=coeff;
testmat=yidali_train{1,2}(:,1:200);
labeltest=label{1,2}(1:200);
labeltrain=cell2mat(label);
KNN(9,testmat',labeltest',trainmatt,labeltrain')
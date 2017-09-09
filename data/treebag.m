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
tic;
testmat=yidali_train{1,3}(:,1:200);
labeltest=label{1,3}(1:200);
labeltrain=cell2mat(label);
B = TreeBagger(20,trainmatt,labeltrain');
predict_label=predict(B,testmat');
predict_label=str2double(predict_label);
accuacy=length(find(predict_label==labeltest'))/length(labeltest');
timetotal=toc
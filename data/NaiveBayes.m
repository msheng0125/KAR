function [ output_args ] = NaiveBayes( traindata,trainlabel )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here


end

%�����������
function prior=priorprobability(trainlabel)
uniquelabel=unique(trainlabel);
totalclass=length(uniquelabel);

end
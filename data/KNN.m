function accuracy = KNN( num,test,testlabel,train,trainlabel )
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here

if mod(num,2)==0
    sprintf('第一个参数应该为奇数');
    return;
end
match_num=0;
size(test,1)
distance=zeros(1,size(train,2));
classifylabel=zeros(1,num);
tic;
for i=1:size(test,1)
    for j=1:size(train,1)
        distance(j)=(norm(test(i,:)-train(j,:)))^2;
    end
    %[dissort,index]=sort(distance);
    [dissort,index]=sortk(distance,num);
    for k=1:num
        classifylabel(k)=trainlabel(index(k));
    end
    label=mode(classifylabel,2);
    if label==testlabel(i)
        match_num=match_num+1;
    end
end
timetotal=toc
match_num
accuracy=match_num/size(test,1)
end




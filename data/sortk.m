function [ dsort,index ] = sortk( distance,k )
%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here
kdis=distance(1:k);
[dsort,index]=sort(kdis);
for i=k+1:size(distance,2)
    if distance(i)<dsort(k)
        dsort(k)=distance(i);
        index(k)=i;
        x=k;
        while x>1&&dsort(x)<dsort(x-1)
            temp=dsort(x);
            dsort(x)=dsort(x-1);
            dsort(x-1)=temp;
            temp=index(x);
            index(x)=index(x-1);
            index(x-1)=temp;
            x=x-1;
        end
    end
end
end


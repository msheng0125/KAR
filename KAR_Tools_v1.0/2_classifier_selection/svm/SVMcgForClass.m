function [bestacc,bestc,bestg] = SVMcgForClass(train_label,train,cmin,cmax,gmin,gmax,v,cstep,gstep,accstep)
%SVMcg cross validation by faruto
%Email:farutoliyang@gmail.com QQ:516667408 http://blog.sina.com.cn/faruto BNU
%last modified 2009.8.23
%Super Moderator @ www.ilovematlab.cn
%% about the parameters of SVMcg 
if nargin < 10
    accstep = 4.5;
end
if nargin < 8
    cstep = 1;
    gstep = 1;
end
if nargin < 7
    v = 3;
    cstep = 1;
    gstep = 1;
end
if nargin < 6
    v = 3;
    cstep = 1;
    gstep = 1;
    gmax = 5;
end
if nargin < 5
    v = 3;
    cstep = 1;
    gstep = 1;
    gmax = 5;
    gmin = -5;
end
if nargin < 4
    v = 3;
    cstep = 1;
    gstep = 1;
    gmax = 5;
    gmin = -5;
    cmax = 5;
end
if nargin < 3
    v = 3;
    cstep = 1;
    gstep = 1;
    gmax = 5;
    gmin = -5;
    cmax = 5;
    cmin = -5;
end
%% X:c Y:g cg:acc
[X,Y] = meshgrid(cmin:cstep:cmax,gmin:gstep:gmax);
[m,n] = size(X);
cg = zeros(m,n);
%% record acc with different c & g,and find the bestacc with the smallest c
bestc = 0;
bestg = 0;
bestacc = 0;
basenum = 2;
for i = 1:m
    for j = 1:n
        cmd = ['-v ',num2str(v),' -c ',num2str( basenum^X(i,j) ),' -g ',num2str( basenum^Y(i,j) )];
        cg(i,j) = svmtrain(train_label, train, cmd);
        
        if cg(i,j) > bestacc
            bestacc = cg(i,j);
            bestc = basenum^X(i,j);
            bestg = basenum^Y(i,j);
        end
        if ( cg(i,j) == bestacc && bestc > basenum^X(i,j) )
            bestacc = cg(i,j);
            bestc = basenum^X(i,j);
            bestg = basenum^Y(i,j);
        end
        
    end
end
%% to draw the acc with different c & g
% figure;
% [C,h] = contour(X,Y,cg,80:accstep:100);
% clabel(C,h,'Color','r');
% xlabel('log2c','FontSize',12);
% ylabel('log2g','FontSize',12);
% title('参数选择结果图(等高线图)','FontSize',12);
% grid on;

% figure;
% meshc(X,Y,cg);
% % mesh(X,Y,cg);
% % surf(X,Y,cg);
% axis([cmin,cmax,gmin,gmax,30,100]);
% xlabel('log2c','FontSize',12);
% ylabel('log2g','FontSize',12);
% zlabel('Accuracy(%)','FontSize',12);
% title('参数选择结果图(3D视图)','FontSize',12);


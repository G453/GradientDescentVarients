clear all
close all
clc
a = 1; b = 21; c=0;
x=-2:0.1:2;
y=-2:0.1:2;
lr_rate=0.001;
[X Y] = meshgrid(x,y);

Z = a* X.^2 + b* Y.^2+c;

surf(X,Y,Z,gradient(Z))
hold on;
colormap(gray);
meshgrid off

x0(1,:) = [2 2];
momemtum=[0,0];
x0(1,:)
plot3(x0(1,1),x0(1,2),ploy_3(x0(1,:),a,b,c),'m*','MarkerSize',20);
zHist_old=9^9; max_itr=0;
i=2;

pause
while(1)
    %pause(0.2);
    % Gradient descent equation..
    x0(i,:) = x0(i-1,:) - lr_rate*poly_3_grad(x0(i-1,:),a,b)- 0.9*momemtum;
    momemtum = x0(i,:);
    zHist(i-1) = ploy_3(x0(i,:),a,b,c);
    plot3(x0(i,1),x0(i,2),zHist(i-1),'m*','MarkerSize',20)
    if(zHist(i-1)>= zHist_old || abs(sum(x0(i-1,:)-x0(i,:),2))<0.0001)
        max_itr= i-1;
        break;
    else
        zHist_old= zHist(i-1);
    end
    i=i+1;    
end
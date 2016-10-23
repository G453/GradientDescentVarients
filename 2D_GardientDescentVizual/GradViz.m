clear all;
close all;
clc;
a = 1; b = 1; c= -2;
x = -9*b:0.1:9*b;
Fx = poly_2(x,a,b,c);
Gx = poly_2_grad(x,a,b);


xt0 = -20;
[fHist, xHist, itr_count] = SimpleSGD(a,b,c,xt0,0.01,700);
disp('Min::'),fHist(end)
disp('X Min::'),xHist(end)
disp('itr Count::'),itr_count
figure, subplot(1,2,1),plot(x,Fx);
hold on, plot(x,Gx,'*');
plot(x,Fx),hold on,p =plot(xHist,poly_2(xHist,a,b,c),'*');set(p,'Color','red','LineWidth',2);
hold off;

[fHist, xHist, itr_count] = SimpleSGD(a,b,c,xt0,0.01,700);
disp('Min::'),fHist(end)
disp('X Min::'),xHist(end)
disp('itr Count::'),itr_count
subplot(1,2,2),plot(x,Fx);
hold on,plot(x,Gx,'*');
plot(x,Fx),hold on,p =plot(xHist,poly_2(xHist,a,b,c),'*');set(p,'Color','red','LineWidth',2);
hold off;
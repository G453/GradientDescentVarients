%Simple Image Registration
close all;
clear all;
clc;
I = rgb2gray(imread('face.jpg'));
xform = [ 1  0  0
          0  1  0
         10 -10  1 ];
T_form = maketform('affine',xform);
J = imtransform(I, T_form, ...
    'XData',[1 size(I,2)], 'YData',[1 size(I,1)]);
Ifinal = I;
figure,subplot(1,3,1),imshow(I,[]), title('Test Image');
subplot(1,3,2),imshow(J), title('Fixed Image');
%figure;

%I = I(64:128+64,64:128+64);
%J = J(64:128+64,64:128+64);
J = double(J)/255;
I = double(I)/255;
I_ = I;
T = [-0.3,3];
cost = (J - I).^2;
cost = sum(cost(:))/(size(I,2)*size(I,1));
itr =2;
while(itr<12)
 [gx, gy]=gradient(I_);
 dx=sum(2*(gx(:)).*(J(:)-I_(:)));
 dy=sum(2*(gy(:)).*(J(:)-I_(:)));
 T = T + 0.01*[dx dy];
 xform = [ 1  0  0
          0  1  0
          T(1) T(2)  1 ];
T_form = maketform('affine',xform);
I_ = imtransform(I_, T_form, ...
    'XData',[1 size(I_,2)], 'YData',[1 size(I_,1)]);
itr = itr+1;
end
 xform = [ 1  0  0
          0  1  0
          -T(1) -T(2)  1 ];
T_form = maketform('affine',xform);
Ifinal = imtransform(Ifinal, T_form, ...
    'XData',[1 size(Ifinal,2)], 'YData',[1 size(Ifinal,1)]);
subplot(1,3,3),imshow(Ifinal,[]),title('Result');
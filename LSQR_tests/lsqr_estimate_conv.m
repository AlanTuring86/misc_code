clc;clear all;close all;
%%

M=256;
x=imresize(im2double(imread('text.png')),[M M]);%phantom(M);
h=fspecial('gauss',11,5.5);
y = conv2(x,h);

A = convmtx2(h,M,M);

%%debug chk
% figure;
% subplot(121);
% imagesc(x);
% subplot(122);
% imagesc(y);
% colormap('gray');

x_orig=x;
y_orig=y;
y=y(:);


dx = @(A,x,y,lambda) 2*A'*(A*x-y) + lambda*sign(x)

nb_iter=333
lambda=0.145;%regularization
gamma = 0.2%1e-1;%learning rate
x_hat = randn(M^2,1)*0.01;

for i=1:nb_iter
    g = dx(A,x_hat,y,lambda);
    
    x_hat = x_hat-gamma*g;
    
    g_norm(i) = norm(g);
    loss(i) = norm(A*x_hat(:)-y);
    
    imagesc(reshape(x_hat,[M M]))
    pause(0.25);
    i
    
    if mod(i,40)==0
        gamma=gamma/2
    end
    
end

figure;
plot(loss);
hold on;
plot(g_norm);
legend('loss','gradient norm');
title('Loss');

figure;
subplot(131);
imagesc(x_orig);title('x orig');
subplot(132);
imagesc(y_orig);title('x corrupted');
subplot(133);
imagesc(reshape(x_hat, [M M]));title('x^');
colormap('gray');
clc;clear all;close all;
%%
M=16;
x=phantom(M);
y = imrotate(x,33,'crop');
x=x(:);
y=y(:);

%% derivative w.r.t. matrix
% https://www.matrixcalculus.org/
%f = norm2(A*x-y)^2
% df/dA = 2*(A*x-y)*x'
%-> with regularization : f = norm2(A*x-y)^2 + lambda*norm2(A)
%
%
%dA = @(A,x,y,lambda) 2*(A*x-y)*x' + (lambda/norm(A(:)))*A

%with L1 regularization: norm2(A*x-y)^2+k*norm1(A)
%df/dA : 2*(A*x−y)*x'+k*sign(A)

dA = @(A,x,y,lambda) 2*(A*x-y)*x' + lambda*sign(A)


nb_iter=150;
A= rand(M^2,M^2)*0.01;
gamma = 0.001;%learning rate
lambda= 0.9;

for i=1:nb_iter
   
    
    subplot(121);
    imagesc(reshape(A,[M^2 M^2]));
    subplot(122);
    imagesc(reshape(A*x,[M M]))
    drawnow;
    pause(0.25);
    
    A = A-gamma*dA(A,x,y,lambda);
     
    i
    
    loss(i) = norm(A*x-y)^2
end


%% 

figure;plot(loss)


figure;
subplot(151);
imagesc(reshape(x,[M M]));title('x');pbaspect([1 1 1]);
subplot(152);
imagesc(reshape(y,[M M]));title('y');pbaspect([1 1 1]);
subplot(153);
imagesc(reshape(A*x,[M M]));title('A*x');pbaspect([1 1 1]);
subplot(154);
imagesc( reshape(A*x,[M M]) - reshape(y,[M M]) );colorbar;title('A*x-y');pbaspect([1 1 1]);
subplot(155);
imagesc(A);title('A');pbaspect([1 1 1]);
colormap('gray');


%% what happends if i apply A on another image?

u = imresize(im2double(imread('cameraman.tif')),[M M])

v = A*u(:);

figure;
subplot(121);
imagesc(u);title('u');
subplot(122);
imagesc(reshape(v,[M M]));title('A*u');
colormap('gray');

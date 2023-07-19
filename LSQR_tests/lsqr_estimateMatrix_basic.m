clc;clear all;close all;
%%

theta = 25;

x = [-3;2]

M = [cosd(theta) -sind(theta); sind(theta) cosd(theta)]

y=M*x

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

%dA = @(A,x,y,lambda) 2*(A*x-y)*x' + lambda*sign(A)

rotMtx = @(t) [cosd(t) -sind(t); sind(t) cosd(t)];
dA = @(t,x,y,lambda) 2*(rotMtx(t)*x-y)*x' %+ lambda*sign(rotMtx(t))

nb_iter=15;
t=0.1;
A= rand(2,2)*0.01;
gamma = 0.01;%learning rate
lambda= 0.01;

figure;xlim([-4 4]);ylim([-4 4]);

for i=1:nb_iter
   
    
    %g=dA(A,x,y,lambda);
    g=dA(t,x,y,lambda);
    A = A-gamma*g;
    t = rad2deg(acos(A(1,1)))
    
    i
    
    plotVect2D([0 0],A*x, 'b'); hold on; plotVect2D([0 0],M*x,'g'); hold off;
    
    pause(0.7);
    
    g_norm(i) = norm(g);
    loss(i) = norm(A*x-y)^2
end


figure;
plot(loss);
hold on;
plot(g_norm);
legend('loss','gradient norm');



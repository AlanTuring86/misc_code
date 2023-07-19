clc;clear all;close all;

%% Initialize variables
x = [-3;2];
theta_true = 25;
M = [cosd(theta_true) -sind(theta_true); sind(theta_true) cosd(theta_true)];
y = M*x;

% Definition of the rotation matrix and its derivative
rotMtx = @(t) [cosd(t) -sind(t); sind(t) cosd(t)];
dRotMtx = @(t) [-sind(t) -cosd(t); cosd(t) -sind(t)];

% Gradient of loss function w.r.t. theta
dL = @(t,x,y) 2*(rotMtx(t)*x-y)' * (dRotMtx(t)*x);

% Gradient descent parameters
nb_iter = 50;
t = rand()*180;  % Initial guess for theta, a random angle
gamma = 0.1;    % Learning rate

% Plotting setup
figure; xlim([-4 4]); ylim([-4 4]);

% Initialize loss array for plotting
loss = zeros(1, nb_iter);

%% Gradient Descent Loop
for i=1:nb_iter
    % Compute gradient
    g = dL(t,x,y);
    
    % Update theta
    t = t - gamma*g;
    
    % Compute loss (optional, for plotting)
    loss(i) = norm(rotMtx(t)*x-y)^2;
    
    % Plotting
    plotVect2D([0 0], rotMtx(t)*x, 'b'); hold on; plotVect2D([0 0], M*x,'g'); hold off;
    pause(0.1);
end

%% Plot loss over time
figure;
plot(loss);
legend('loss');

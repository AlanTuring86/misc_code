%chatGPT generated

% Create an NxN grayscale image
N = 64; % You can set this to any value you want
I = phantom(N)+randn(N,N)*0.01;

% Define the rotation angle
theta = 30 * pi / 180; % 30 degrees in radians

% Calculate the coordinates of the center of the image
center = size(I) / 2 + 0.5;

% Initialize an NxN rotation matrix
R = zeros(N*N, N*N);

% Loop over each pixel in the output image
for i = 1:N*N
    % Calculate the row and column indices of the pixel in the output image
    [out_row, out_col] = ind2sub([N, N], i);
    
    % Calculate the coordinates relative to the center of the image
    x = out_col - center(2);
    y = center(1) - out_row;
    
    % Apply the rotation transformation
    x_rot = cos(theta) * x + sin(theta) * y;
    y_rot = -sin(theta) * x + cos(theta) * y;
    
    % Shift the coordinates back to the original system
    in_col = round(x_rot + center(2));
    in_row = round(center(1) - y_rot);
    
    % If the coordinates are outside the bounds of the image, skip this pixel
    if in_row < 1 || in_row > N || in_col < 1 || in_col > N
        continue;
    end
    
    % Calculate the linear index of the input pixel
    in_idx = sub2ind([N, N], in_row, in_col);
    
    % Set the corresponding entry in the rotation matrix to 1
    R(i, in_idx) = 1;
end

% Vectorize the image
I_vec = I(:);

% Apply the rotation
I_rot_vec = R * I_vec;

% Reshape the vectorized rotated image back into a matrix
I_rot = reshape(I_rot_vec, [N, N]);


%% 

figure;
subplot(151);
imagesc(R); 
title('Special rot. matrix');pbaspect([1 1 1]);
subplot(152);
imagesc(I);title('Orig.');pbaspect([1 1 1]);
subplot(153);
imagesc(I_rot);title('Rotated with special matrix');pbaspect([1 1 1]);

subplot(154);
imagesc(imrotate(I,rad2deg(theta),'crop'));title('Rotated with imrotate');pbaspect([1 1 1]);

subplot(155);
imagesc( imrotate(I,rad2deg(theta),'crop') - I_rot);colorbar;pbaspect([1 1 1]);
colormap('gray');


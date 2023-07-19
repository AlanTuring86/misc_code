clear all;close all;clc;
%%

%direcly appy special rot matrix on pixel INTENSITIES rather than
%coordinates - trying to understand the matrix formalism of P. Batchelor


I = phantom(96); 

I_vec = I(:);

%build rot matrix
N = numel(I);
R = zeros(N); 
for i = 1:N
    [r, c] = ind2sub(size(I), i);  
    rot_r = c;
    rot_c = size(I, 1) - r + 1;
    j = sub2ind(size(I), rot_r, rot_c);
    R(j, i) = 1;
end

%% -> same number of pixels at value 1 in the R matrix as there are pixels in the image
sum(R(:)) == 96^2
%%

%R=eye(size(R)); % if R were the identity matrix then -> no change; so for
%the 90 degrees case (no interpolation) R is like a permutation matrix

%Apply the rotation to the vectorized image
I_rot_vec = R * I_vec;

I_rot = reshape(I_rot_vec, size(I));

%% display
figure;

subplot(131);
imshow(R);
title('Special rot. matrix');

subplot(132);
imshow(I);
title('Orig');

subplot(133);
imshow(I_rot);
title('Rotated');


%% GPT explanation
% Certainly! The goal of the for loop is to construct a rotation matrix that maps each pixel in the input image to its corresponding position in the rotated image. This is a multi-step process that involves several coordinate transformations.
% 
%     We start with a linear index i that ranges from 1 to N, where N is the total number of pixels in the image. We use this index to iterate over every pixel in the image.
% 
%     For each i, we use the ind2sub function to convert i into row and column indices (r, c) in the original image. This is equivalent to treating i as an index into the vectorized form of the image and converting it into an index into the 2D form of the image.
% 
%     We then calculate the row and column indices (rot_r, rot_c) of the pixel in the rotated image. For a 90 degree clockwise rotation, the row index in the rotated image is the same as the column index in the original image, and the column index in the rotated image is calculated as the total number of rows minus the row index in the original image (plus 1 due to 1-based indexing in MATLAB).
% 
%     Next, we use the sub2ind function to convert (rot_r, rot_c) into a linear index j into the vectorized form of the rotated image. This is the opposite of what we did with ind2sub earlier.
% 
%     Finally, we set R(j, i) = 1, which means that pixel i in the input image maps to pixel j in the rotated image. This constructs our rotation matrix R.
% 
% In essence, this for loop is creating a big matrix R where each column corresponds to a pixel in the input image and 
% each row corresponds to a pixel in the output (rotated) image. 
% The values in the matrix tell us where each pixel from the input image ends up in the rotated image. 
% Most of the entries in R are zero because each input pixel maps to exactly one output pixel. 
% This process effectively rotates the image 90 degrees clockwise 
% when the matrix R is multiplied with the vectorized form of the image.

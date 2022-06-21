%% Title: Image Sharpening Using a Novel Kernels Set

%% Created by Zohair Al-Ameen.
% Department of Computer Science, 
% College of Computer Science and Mathematics,
% University of Mosul, 
% Mosul, Nineveh, Iraq

%% Please report bugs and/or send comments to Zohair Al-Ameen.
% Email: qizohair@uomosul.edu.iq

%% When you use this code or any part of it, please cite the following article:  
% Zohair Al-Ameen, Ghazali Sulong, and Md Gapar Md Johar. 
% "Fast deblurring method for computed tomography medical images using a novel kernels set." 
% International Journal of Bio-Science and Bio-Technology, vol. 4, no. 3, (2012): pp. 9-19.
%% INPUTS
% x --> is a given unclear image
% w9 -- > kernels 1-20

%% OUTPUT
% g9 --> sharpened image.


%% Starting implementation %%
clear all; close all; clc

%% reading image


% Save all images name in a  sequence manner before doing the operation 
% names for example im1,im2,im3...
%Save the folder of images in the current directory
%location = 'C:\Users\shubham sharma\Desktop\sharpning tech\input_images\*.jpg';  
%  folder in which your images exists



%working Fine
path_directory='C:\Users\shubham sharma\Desktop\sharpning tech\input_images\';
original_files=dir([path_directory '/*.jpg']); 
ImageFolder='C:\Users\shubham sharma\Desktop\sharpning tech\kernel_output_images\';
for k=1:length(original_files)
  filename=[path_directory '/' original_files(k).name];
  
  x=imread(filename);
  figure;
  subplot(1,2,1),imshow(x);
  title('Original');
  
  % Image read is done
    w9 = [0 -1 0; -1 5 -1; 0 -1 0;];
  
    g9 = imfilter(x, w9, 'symmetric', 'conv');

    %% Display the results and save them
    %figure;
    subplot(1,2,2), imshow(g9);
    title('Sharpened')
    baseFileName = sprintf('Image #%d.jpg', k);
    fullFileName = fullfile(ImageFolder, baseFileName);
    imwrite(g9, fullFileName);
    % imwrite(g9,'out_Kernel.jpg')
    %%Image Operation as per your work
end
    

    






%x = im2double(imread('CT.jpg'));


%% Kernels 
% w9 = [0 -1 0; 0 3 0; 0 -1 0;]; % K1
% w9 = [-1 0 -1; 0 5 0; -1 0 -1;]; % K2
% w9 = [-1 2 -1; 0 1 0; -1 2 -1;]; % K3
% w9 = [-1 0 -1; 2 1 2;  -1 0 -1;]; % K4
% w9 = [-1 0 -1; -1 7 -1; -1 0 -1;]; % K5
% w9 = [-1 -1 -1; 0 7 0; -1 -1 -1;]; % K6
% w9 = [-1 -1 -1; 1 5 1; -1 -1 -1;]; % K7
% w9 = [-1 1 -1; 0 3 0; -1 1 -1;]; % K8
% w9 = [0 -2 0; 0 5 0; 0 -2 0;]; % K9
% w9 = [-2 0 -2; 0 9 0; -2 0 -2;]; % K10
 % K11
% w9 = [-1 0 -1; -2 9 -2; -1 0 -1;]; % K12
% w9 = [-2 -1 -2; 0 11 0; -2 -1 -2;]; % K13
% w9 = [-1 -2 -1; 0 9 0; -1 -2 -1;]; % K14
% w9 = [-1 -2 -1; -1 11 -1; -1 -2 -1;]; % K15
% w9 = [0 -2 0; -1 7 -1; 0 -2 0;]; % K16
% w9 = [0 0 0; -1 3 -1; 0 0 0;]; % K17
% w9 = [-2 0 -2; -1 11 -1; -2 0 -2;]; % K18
% w9 = [0 -1 0; -2 7 -2; 0 -1 0;]; % K19
% w9 = [-2 0 -2; 1 7 1; -2 0 -2;]; % K20

%% Convolution Process

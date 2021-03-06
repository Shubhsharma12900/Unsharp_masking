clear all;
clc;
%wroking Fine

path_directory='C:\Users\shubham sharma\Desktop\sharpning tech\input_images\';
original_files=dir([path_directory '/*.jpg']); 
ImageFolder='C:\Users\shubham sharma\Desktop\sharpning tech\unsharp_code1_output_images\';
for k=1:length(original_files)
    filename=[path_directory '/' original_files(k).name];
  
    input_image=imread(filename);
    %input_image=imread('childsample.jpg');
    figure(),imshow(input_image,[]); % Showing the input image
    input_image = imresize(input_image,[569 760]);
    [x, y]=size(input_image);

    title('Input Image');
    input_image=double(input_image); % Converting image to double 
    [x1, y1]=size(input_image);
    input_image=input_image(:,:,1); % Separating the 3rd channel  
    [x2, y2]=size(input_image);
    box_filter=(1/(7*7)) * ones(7,7); % Box filter of 7x7

    blurred_image=conv2(input_image,box_filter); % Obtaining the blurred image by convolving it with the 7x7 Box Filter
    [x3, y3]=size(blurred_image);
    input_image=[input_image ones(569,6)]; % Zero padding to match the blurred image size
    input_image=[input_image;ones(6,766)];

    unsharp_image=(input_image) - (blurred_image); % Obtaining the masked image by subtracting the original image with the convoluted blurred image
    sharp_image=(input_image) + (unsharp_image); % Obtaining the unmasked or sharp image by adding the original image with the unsharped image

    %figure,imshow(input_image,[]); to match  to
    %figure,imshow(blurred_image,[]);
    figure,imshow(unsharp_image,[]);

    figure(),imshow((uint8(sharp_image)),[]);
    title('Output Image');
    name=['folder' num2str(k)];%new folder name
    mkdir('C:\Users\shubham sharma\Desktop\sharpning tech\unsharp_code1_output_images',name);%create new folder
    for i=1:2
   
    
    baseFileName = sprintf('Image #%d.jpg', i);
%     ImageFolder='C:\Users\shubham sharma\Desktop\sharpning tech\unsharp_code2_output_images';

    fullFileName = fullfile(ImageFolder,name, baseFileName);
    if i==1
        imwrite(unsharp_image, fullFileName);
    elseif i==2
        imwrite((uint8(sharp_image)), fullFileName);
        
    end
    end
end;

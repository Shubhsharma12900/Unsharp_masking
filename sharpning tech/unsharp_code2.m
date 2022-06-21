clear all
close all
path_directory='C:\Users\shubham sharma\Desktop\sharpning tech\input_images\';
original_files=dir([path_directory '/*.jpg']); 
ImageFolder='C:\Users\shubham sharma\Desktop\sharpning tech\unsharp_code2_output_images\';
%working Fine

for k=1:length(original_files)
    filename=[path_directory '/' original_files(k).name];
    I=imread(filename);
    figure;
    subplot(221)
    imshow(I)
    title('Original Image')

    %Gaussian Low pass Filter
    Lp=1/9*[1 1 1 ; 1 1 1; 1 1 1];

    I1=imfilter(I,Lp);
    subplot(222)
    imshow(I1)
    title('Image after Low Pass Filtering')

    % Edge Detection(High pass filtering)
    I2=I-I1;
    subplot(223)
    imshow(I2)
    title('High pass filtering')

    % Unsharp masking
    lambda=3;
    I3=I+lambda*I2;
    
    subplot(224)
    imshow(I3)
    title('Unsharp Masking')

    figure;
    %figure(2)
    subplot(131)
    imshow(I)
    title('Original Image')

    %Laplacian
    L=[1 1 1;1 -8 1; 1 1 1  ];

    %Laplacian Edge Detection
    I4=imfilter(I,L);
    subplot(132)
    imshow(I4)
    title('Laplacian Edge Detection')

    % Unsharp masking
    lambda=0.3;
    I5=I+lambda*I4;
    subplot(133)
    imshow(I5)
    title('Unsharp Masking')
    name=['folder' num2str(k)];%new folder name
    mkdir('C:\Users\shubham sharma\Desktop\sharpning tech\unsharp_code2_output_images',name);%create new folder
    for i=1:5
   
    
    baseFileName = sprintf('Image #%d.jpg', i);
%     ImageFolder='C:\Users\shubham sharma\Desktop\sharpning tech\unsharp_code2_output_images';

    fullFileName = fullfile(ImageFolder,name, baseFileName);
    if i==1 
        imwrite(I1, fullFileName);
    elseif i==2
        imwrite(I2, fullFileName);
    elseif i==3
        imwrite(I3, fullFileName);
    elseif i==4
        imwrite(I4, fullFileName);
    elseif i==5
        imwrite(I5, fullFileName);
    end
    end
    
    

end;

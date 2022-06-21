%% MyMainScript

%% Demo of Shrink Image By Factor 2
tic;
myUnsharpMasking('C:\Users\shubham sharma\Desktop\sharpning tech\Unsharp-Masking-Digital-Image-Processing-master\data\lionCrop.mat');
toc;
%% Tuned parameters are Window size 21 and ScaleFactor = 0.1
%% Demo of Shrink Image By Factor 2
figure();
tic;
myUnsharpMasking('C:\Users\shubham sharma\Desktop\sharpning tech\Unsharp-Masking-Digital-Image-Processing-master\data\superMoonCrop.mat');
toc;
% figure();
tic;
myUnsharpMasking('C:\Users\shubham sharma\Desktop\sharpning tech\Unsharp-Masking-Digital-Image-Processing-master\data\CT1655468740.mat');
toc;
%% Tuned parameters are Window size 21 and ScaleFactor = 0.1

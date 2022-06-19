%% Clear console and variables
clc, clear, close all;

%% Variables
fps =3.0;
inputFolder='dataset/';
imagesExtension='*.tif';
outputFolder= 'videos/';


%% Load an image
image = imread("dataset/t000.tif");


%% Image histogram display
figure, imhist(image),title('Original image histogram');


%% Converting image from NDG to BW
% Using Otsu's threshold
imageOtsu = imbinarize(image);

% Using pixels' median
imageMedian = median_thresholding(image);

% Using pixels' mean
imageMean = mean_thresholding(image);

figure;
subplot(2,2,1), imshow(image), title('Original');
subplot(2,2,2), imshow(imageOtsu), title("Otsu's threshold");
subplot(2,2,3), imshow(imageMedian), title('Median threshold');
subplot(2,2,4), imshow(imageMean), title('Mean threshold');
% - Otsu' method has less noise than the other but less cells
% - Image with median threshold has the more cells but the more noise
% - Image with mean threshold has less cells than median thereshold method
% but less noise as well

% I choose to use the mean thresholding method to try to extract all cells
%processingImagesFunc=@imbinarize;
%processingImagesFunc=@median_thresholding;
im2bwMyFunc=@mean_thresholding;


%% My threshold
imageMyThreshold = manual_thresholding(image, 1);
figure, imshow(imageMyThreshold),title('My image threshold');

% Delete noises and try to re-create complete cells from set of points by
% using opening and closing images processing methods

% Median filter to correct noise (Salt-and-pepper noise)
imageMyThreshold= medfilt2(imageMyThreshold);
imageMyThreshold= medfilt2(imageMyThreshold);
imageMyThreshold= medfilt2(imageMyThreshold);
figure, imshow(imageMyThreshold), title('My Image median filtered')

% Opening and closing operation
SE = strel('disk', 8);
imageMyThreshold= imerode(imageMyThreshold, SE);

SE = strel('disk', 12);
imageMyThreshold= imdilate(imageMyThreshold, SE);

SE = strel('disk', 4);
imageMyThreshold= imerode(imageMyThreshold, SE);

% Fills holes in image
imageMyThresholdFinal= imfill(imageMyThreshold, 'holes');

% Display my final image with my owen threshold
figure, imshow(imageMyThresholdFinal), title('My Image processed')


%% Create video from dataset images
create_video_from_images(fps, inputFolder, imagesExtension, outputFolder, 'cells-1.avi', im2bwMyFunc);


%% Play video
%implay(fullfile(outFolder, outVideoName));


%{
%% Process image
% Delete noises and try to re-create complete cells from set of points by
% using opening and closing images processing methods
imageProcessed = im2bwMyFunc(image);

% Median filter to correct noise (Salt-and-pepper noise)
imageProcessed = medfilt2(imageProcessed);
figure, imshow(imageProcessed), title('Image median filtered')

% In image processing there
SE = strel('disk', 2);
imageProcessed = imerode(imageProcessed, SE);

SE = strel('disk', 2);
imageProcessed = imdilate(imageProcessed, SE);


% Fills holes in image
%imFinale = imfill(imageDilate, 'holes');
%figure, imshow(imFinale)

figure, imshow(imageProcessed),title('Processed image');
%}


%% Find regions in image
stats = regionprops(imageMyThresholdFinal, 'Area', 'Eccentricity', 'Centroid');
imageMyThresholdFinal = bwlabel(imageMyThresholdFinal); % étiqueter les cellules
nombreCells = max(max(imageMyThresholdFinal)); % Calculate the number of cells (number of connected spaces)

figure, imagesc(imageMyThresholdFinal), title(['Number of cells ', num2str(nombreCells)]);


%% Create video with processed images
create_video_from_images(fps, inputFolder, imagesExtension, outputFolder, 'cells-2-processed.avi', im2bwMyFunc);

%{
%% Follow each cells

curImage = imread("Database\t000.tif");

B = bwboundaries(curImage);
stat = regionprops(curImage,'Perimeter');
imlabel = bwlabel(curImage);
imshow(curImage); hold on
for k = 1 : max(max(imlabel))
    b = B{k};
    plot(b(:,2),b(:,1),'g','linewidth',2);
end
title("question 8");
%% question 9

nImage = 90;                                                        
fps = 3.0;                                                           
addToInFolder = 'Database/';                    
addToOutFolder = './';                   

oVideo = VideoWriter(fullfile(addToOutFolder, 'cells_segmentation.avi'));       
oVideo.FrameRate = fps;                                              
open(oVideo);

for i = 1:nImage                                                     
    fname = ['t' num2str(i, '%.3d') '.tif'];                     
    curImage = imread(fullfile(addToInFolder,fname));
    curImage = im2uint8(curImage > seuil);
    
    SE = strel('disk', 8);
    curImage = imdilate(curImage, SE);
        
    SE = strel('disk', 10);
    curImage = imerode(curImage, SE);
       
    SE = strel('disk', 2);
    curImage = imdilate(curImage, SE);
   
    curImage = imbinarize(curImage);

    B = bwboundaries(curImage);
    stat = regionprops(curImage,'Perimeter');
    imlabel = bwlabel(curImage);
    imshow(curImage); hold on
    for k = 1 : max(max(imlabel))
        b = B{k};
%         c = stat(k).Centroid;
        plot(b(:,2),b(:,1),'g','linewidth',2);
    end
    curImage = getframe(gcf);

    writeVideo(oVideo, curImage);                                    
end                                                                  
close(oVideo)  

implay("cells_segmentation.avi");

%}
%% Clear console and variables
clc, clear, close all;


%% Load an image
image = imread("dataset/\t000.tif");


%% Image histogram display
figure, imhist(image),title('Original image histogram');


%% Converting image from NDG to BW:
% Using Otsu's threshold
imageOtsu = imbinarize(image);

% Using pixels' median
threshold_median = median(image,'all');
imageMedian = image > threshold_median;

% Using pixels' mean
threshold_mean = mean(image,'all');
imageMean = image > threshold_mean;

figure;
subplot(2,2,1), imshow(image), title('Original');
subplot(2,2,2), imshow(imageOtsu), title("Otsu's threshold");
subplot(2,2,3), imshow(imageMedian), title('Median threshold');
subplot(2,2,4), imshow(imageMean), title('Mean threshold');
% - Otsu' method has less noise than the other but less cells
% - Image with median threshold has the more cells but the more noise
% - Image with mean threshold has less cells than median thereshold method
% but less noise as well

% By looking at the histogram, perhaps selecting manually the thereshold
% could be interesting.
threshold = 14
imageMyThreshold = image > threshold;
figure, imshow(imageMyThreshold), title('Image with my threshold');
% By selecting a threshold that separate the pixels close to 0 and the rest
% we get a picture pretty clear with a lot of cells.

%{
%% Create video from dataset images
outFolder='videos';
outVideoName='cells.avi'
inputFolder='dataset/';
imagesExtension='*.tif';
%nImage = numel(dir(strcat(inputfolder,'/*'))); % Get number of images
imagesList = dir(strcat(inputFolder, imagesExtension));
fps = 3.0;

% Create video
oVideo = VideoWriter(fullfile(outFolder, outVideoName));       
oVideo.FrameRate = fps;                                              
open(oVideo);

for i = 1:length(imagesList)
    image = imread(strcat(inputFolder,imagesList(i).name));
    image = im2uint8(image > threshold); %Median or mean binarization
    %image = im2uint8(imbinarize(image)); %Otsu binarization
    writeVideo(oVideo, image);
end

close(oVideo);


%% Play video
%implay(fullfile(outFolder, outVideoName));


%% Process image
% Delete noises and try to re-create complete cells from set of points by
% using opening and closing images processing methods


% Median filter
imageMean = medfilt2(imageMean);
figure, imshow(imageMean)


preprocessedImage = imread(strcat(inputFolder,imagesList(1).name));
preprocessedImage = im2uint8(preprocessedImage > threshold); %Median or mean binarization
%preprocessedImage = im2uint8(imbinarize(preprocessedImage)); %Otsu binarization

% In image processing there
SE = strel('disk', 2);
preprocessedImage = imerode(preprocessedImage, SE);

SE = strel('disk', 8);
preprocessedImage = imdilate(preprocessedImage, SE);

SE = strel('disk', 8);
preprocessedImage = imerode(preprocessedImage, SE);

SE = strel('disk', 6);
preprocessedImage = imdilate(preprocessedImage, SE);

SE = strel('disk', 8);
preprocessedImage = imerode(preprocessedImage, SE);


% Remplir les trous à l'aide de imfill
imFinale = imfill(imageDilate, 'holes');
figure, imshow(imFinale)

imshow(preprocessedImage),title('Processed image');

%% Find regions in image
stats = regionprops(preprocessedImage, 'Area', 'Eccentricity', 'Centroid');
preprocessedImage = bwlabel(preprocessedImage); % étiqueter les cellules
imagesc(preprocessedImage);


nombreCells = max(max(preprocessedImage)); % on calcule le nombre de cellules qui est 
% exactement le nombre d'objets connexes
title(['Le nombre de cellules est égal à ', num2str(nombreCells)])



%% Question 7

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

    imshow(curImage);
    curImage = getframe(gcf);

    writeVideo(oVideo, curImage);                                    
end                                                                  
close(oVideo)  

%% Question 8

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
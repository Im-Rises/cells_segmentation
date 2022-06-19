image = imread("dataset/t000.tif");
cellsArray = {@imbinarize};

image = pipe(image,cellsArray);
hold on
figure, imshow(image),title("Test pipe");

%% Clear console and variables
clc, clear, close all;

%{
%% Variables
fps = 3.0;
inputFolder='dataset/';
imagesExtension='*.tif';
outputFolder= 'videos/';


%% Load an image
image = imread("dataset/t000.tif");


%% Display image histogram
figure, imhist(image),title('Original image histogram');


%% Converting image from NDG to BW
% Using Otsu's method
imageOtsu = imbinarize(image);

% Using pixels' median
imageMedian = im2bw_median(image);

% Using pixels' mean
imageMean = im2bw_mean(image);

% Plot to screen
figure;
subplot(2,2,1), imshow(image), title('Original image (Grayscale)');
subplot(2,2,2), imshow(imageOtsu), title("Image BW (Otsu's threshold)");
subplot(2,2,3), imshow(imageMedian), title('Image BW (Median threshold)');
subplot(2,2,4), imshow(imageMean), title('Image BW (Mean threshold)');

% - Otsu' method has less noise than the other but less cells
% - Image with median threshold has the more cells but the more noise
% - Image with mean threshold has less cells than median thereshold method
%   but less noise as well


%% My threshold
%Another solution is to choose the threshold according to the image's
%histogram
imageMyThreshold = image > 1;
figure, imshow(imageMyThreshold),title('Image BW');


%% Choosing the thresholding method
%im2bwSelected=@imbinarize;
%im2bwSelected=@im2bw_median;
%im2bwSelected=@im2bw_mean;
im2bwSelectedFunc=@im2bw_my_version;

imageBW = im2bwSelectedFunc(image);


%% Create video from dataset images
create_video_from_images(fps, inputFolder, imagesExtension, outputFolder, 'cells-1-bw.avi', im2bwSelectedFunc, @pipe_im2bw);
%implay(fullfile(outFolder, outVideoName));


%% Image processing
imageBwProcessed=image_processing(imageBW);
figure, imshow(imageBwProcessed), title('Image BW processed')


%% Create video with processed images
create_video_from_images(fps, inputFolder, imagesExtension, outputFolder, 'cells-2-bw-processed.avi', im2bwSelectedFunc, @pipe_im2bw_processed);


%% Find regions in image
figure, image_regions(imageBwProcessed);


%% Create video with images' regions
create_video_from_images(fps, inputFolder, imagesExtension, outputFolder, 'cells-3-bw-processed-regions.avi', im2bwSelectedFunc,@pipe_im2bw_processed_regions);


%% Segment all cells for one image
figure, imageBwProcessedSegmented = image_segmentation(imageBwProcessed);


%% Create videos with segmented cells
create_video_from_images(fps, inputFolder, imagesExtension, outputFolder, 'cells-4-bw-processed-segmented.avi', im2bwSelectedFunc,@pipe_im2bw_processed_segmented);
%}
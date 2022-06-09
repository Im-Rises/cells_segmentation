%% TP 

%% Question 1

image = imread("Database\t000.tif");

%% Question 2

imhist(image);

%% Question 3

% on choisi un seuil à 14

seuil = 14;

image = image > seuil;
% imagesc(image);
colormap gray;

%% Question 4
nImage = 90;                                                        
fps = 3.0;                                                           
addToInFolder = 'Database/';                    
addToOutFolder = './';                   

oVideo = VideoWriter(fullfile(addToOutFolder, 'cells.avi'));       
oVideo.FrameRate = fps;                                              
open(oVideo);

for i = 1:nImage                                                     
    fname = ['t' num2str(i, '%.3d') '.tif'];                     
    curImage = imread(fullfile(addToInFolder,fname));
    curImage = im2uint8(curImage > seuil);

    writeVideo(oVideo, curImage);                                    
end                                                                  
close(oVideo)  

%% Question 5

implay('cells.avi');

%% Question 6

curImage=  imread("Database/t000.tif");
curImage = im2uint8(curImage > seuil);

SE = strel('disk', 8);
curImage = imdilate(curImage, SE);
    
SE = strel('disk', 10);
curImage = imerode(curImage, SE);
   
SE = strel('disk', 2);
curImage = imdilate(curImage, SE);

% imagesc(curImage);
stats = regionprops(curImage, 'Area', 'Eccentricity', 'Centroid');
curImage = bwlabel(curImage); % étiqueter les cellules

figure, imagesc(curImage);

nombreCells = max(max(curImage)); % on calcule le nombre de cellules qui est 
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


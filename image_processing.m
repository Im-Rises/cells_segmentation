function imageMyThresholdFinal = image_processing(image)
    % Delete noises and try to re-create complete cells from set of points by
    % using opening, closing images processing methods and median filter.
    
    % Median filter to correct noise (Salt-and-pepper noise)
    imageMyThreshold= medfilt2(image);
    %figure, imshow(imageMyThreshold), title('My Image median filtered')
    
    % Opening and closing operation
    SE = strel('disk', 8);
    imageMyThreshold= imerode(imageMyThreshold, SE);
    
    SE = strel('disk', 12);
    imageMyThreshold= imdilate(imageMyThreshold, SE);
    
    SE = strel('disk', 4);
    imageMyThreshold= imerode(imageMyThreshold, SE);
    
    % Fills holes in image
    imageMyThresholdFinal= imfill(imageMyThreshold, 'holes');
end
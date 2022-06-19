function thresholdedImage = mean_thresholding(image)
    meanThreshold = mean(image,'all');
    thresholdedImage = image > meanThreshold ;
end
function thresholdedImage = median_thresholding(image)
    medianThreshold = median(image,'all');
    thresholdedImage = image > medianThreshold;
end
function thresholdedImage = mean_thresholding(image)
    threshold_mean = mean(image,'all');
    thresholdedImage = image > threshold_mean;
end
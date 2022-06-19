function thresholdedImage = median_thresholding(image)
    threshold_median = median(image,'all');
    thresholdedImage = image > threshold_median;
end
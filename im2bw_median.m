function thresholdedImage = im2bw_median(image)
    threshold_median = median(image,'all');
    thresholdedImage = image > threshold_median;
end
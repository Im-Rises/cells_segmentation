function thresholdedImage = im2bw_mean(image)
    threshold_mean = mean(image,'all');
    thresholdedImage = image > threshold_mean;
end
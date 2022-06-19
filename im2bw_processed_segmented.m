function imBwProcessedSegmented = im2bw_processed_segmented(image)
    imageBW = im2bw_my_version(image);
    imBwProcessed = image_processing(imageBW);
    imBwProcessedSegmented = image_segmentation(imBwProcessed);
end
function imBwProcessedSegmented = pipe_im2bw_processed_segmented(image, im2bwFunc)
    imageBW = im2bwFunc(image);
    imBwProcessed = image_processing(imageBW);
    imBwProcessedSegmented = image_segmentation(imBwProcessed);
end
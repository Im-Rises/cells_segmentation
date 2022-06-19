function imBwProcessedRegions = pipe_im2bw_processed_regions(image,im2bwFunc)
    imageBW = im2bwFunc(image);
    imBwProcessed = image_processing(imageBW);
    imBwProcessedRegions = image_regions(imBwProcessed);
end
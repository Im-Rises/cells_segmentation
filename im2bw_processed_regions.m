function imBwProcessedRegions = im2bw_processed_regions(image)
    imageBW = im2bw_my_version(image);
    imBwProcessed = image_processing(imageBW);
    imBwProcessedRegions = image_regions(imBwProcessed);
end
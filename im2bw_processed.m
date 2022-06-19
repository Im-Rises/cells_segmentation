function imBwProcessed = im2bw_processed(image)
    imageBW = im2bw_my_version(image);
    imBwProcessed = image_processing(imageBW);
end
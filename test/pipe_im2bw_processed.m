function imBwProcessed = pipe_im2bw_processed(image,im2bwFunc)
    imageBW = im2bwFunc(image);
    imBwProcessed = image_processing(imageBW);
end
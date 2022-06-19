function create_video_from_images(fps, inputFolder, imagesExtension, outputFolder, outputFileName, im2bwFunc, pipeFunc)
    % Get images' name
    imagesList = dir(strcat(inputFolder, imagesExtension));
    % Create video
    oVideo = VideoWriter(fullfile(outputFolder, outputFileName));       
    oVideo.FrameRate = fps;                                              
    open(oVideo);
    
    for i = 1:length(imagesList)
        image = imread(strcat(inputFolder,imagesList(i).name));
        image = im2uint8(pipeFunc(image, im2bwFunc));% Use processing function send as parameter
        writeVideo(oVideo, image);
    end
    
    close(oVideo);
end
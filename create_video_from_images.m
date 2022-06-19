function create_video_from_images(fps, inputFolder, imagesExtension, outputFolder, outputFileName, functionsCellsArray)
    % Get images' name
    imagesList = dir(strcat(inputFolder, imagesExtension));
    % Create video
    oVideo = VideoWriter(fullfile(outputFolder, outputFileName));       
    oVideo.FrameRate = fps;                                              
    open(oVideo);
    
    for i = 1:length(imagesList)
        image = imread(strcat(inputFolder,imagesList(i).name));
        image = pipe(image, functionsCellsArray);
        image = im2uint8(image);% Use functions send as parameter on image with the pipe help
        writeVideo(oVideo, image);
    end
    
    close(oVideo);
end
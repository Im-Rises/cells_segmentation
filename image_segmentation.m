function imageSegmented = image_segmentation(image)
    imageLabeled = bwlabel(image); % Label the cells
    nombreCells = max(max(imageLabeled)); % Calculate the number of cells (number of connected spaces)    
    imagesc(imageLabeled), title(['Image segmented, number of cells ', num2str(nombreCells)]);
    B = bwboundaries(image);
    imlabel = bwlabel(image);
    imshow(image); hold on
    for k = 1 : max(max(imlabel))
        b = B{k};
        plot(b(:,2),b(:,1),'g','linewidth',2);
    end
    imageSegmented = getframe(gcf).cdata;
end
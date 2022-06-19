function imageRegions = image_regions(image)
    imageLabeled = bwlabel(image); % Label the cells
    nombreCells = max(max(imageLabeled)); % Calculate the number of cells (number of connected spaces)
    imagesc(imageLabeled), title(['Image regions, number of cells ', num2str(nombreCells)]);
    axis off
    imageRegions = getframe(gcf).cdata;
end
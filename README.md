# cells_segmentation

<p align="center">
    <a href="https://www.mathworks.com/matlabcentral/images/matlab-file-exchange.svg" alt="MatLabBadge"></a>
</p>

## Description

Cells segmentation program made in Matlab.
This program is made for educational purpose. 
Anaylyse group of cells from pictures with image conversion, thresholding, filtering, regions separation and segmentation.

## Images

|| |
|---|---|
|![cellsImage](dataset/t000.tif) | ![cellsImage](dataset/t030.tif)|
|![cellsImage](dataset/t060.tif)|![cellsImage](dataset/t090.tif)|

## Videos

A set of videos are available in the video dolfer. They show the different main step of the image processing.

PLACEHOLDER

## Quick start

First thing to do is to have MatLab, you can find it below:  
<https://fr.mathworks.com/products/matlab.html>

To run the project, you need to install the MatLab packages:
- [Image Processing Toolbox](https://fr.mathworks.com/products/image.html)
- [Signal Processing Toolbox](https://fr.mathworks.com/products/signal.html)
- [Image Acquisition Toolbox](https://fr.mathworks.com/products/image-acquisition.html)

To start the project, start the `main.m` script in MatLab.

## Project architecture

The project is compose of one main script `main.m` that will call all the others script.
The other importants scripts are :
- `create_video_from_images.m` to create video from a set of images
- `image_processing` to process images
- `image_regions` to display regions in a image
- `image_segmentation` to segment cells in a image

The three following files are just functions to call a set of functions:
- `im2bw_processed` image to black and white and processing
- `im2bw_processed_regions` image to black and white and processing with regions
- `im2bw_processed_segmentation` image to black and white and processing with segmentation

The last three other files are a set of functions for different way to convert an image to black and white (BW):
- `im2bw_mean` image to BW by using mean
- `im2bw_median` image to BW by using median
- `im2bw_my_version` image by manually changing threshold

You can also use in the script the Otsu's method.

## Documentation

Datacorner image processing course :  
<https://www.datacorner.fr/image-processing-1/>

## Authors

Quentin MOREL :

- @Im-Rises
- <https://github.com/Im-Rises>

[![GitHub contributors](https://contrib.rocks/image?repo=Im-Rises/cells_segmentation)](https://github.com/Im-Rises/cells_segmentation/graphs/contributors)
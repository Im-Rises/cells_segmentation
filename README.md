# cells_segmentation

<p align="center">
    <img src="https://www.mathworks.com/matlabcentral/images/matlab-file-exchange.svg" alt="MatLabBadge">
</p>

## Description

Cells segmentation program made in Matlab.
This program is made for educational purpose. 
Anaylyse group of cells from pictures with image conversion, thresholding, filtering, regions separation and segmentation.
The goal is to create video with the maximum of cells visible.

## Images

|Image 000|Image 030|
|---|---|
|![t000](https://user-images.githubusercontent.com/59691442/174499468-cc84d8b5-6d31-46a0-bbd4-3127c611e084.png)|![t090](https://user-images.githubusercontent.com/59691442/174499479-88b99f06-42f1-413c-b96d-13fbb81b208e.png)|
| | |

<!--
|Image 060|Image 090|
|---|---|
|![t060](https://user-images.githubusercontent.com/59691442/174499477-7c6cee2d-3039-44c5-b90a-75e859641261.png)|
![t030](https://user-images.githubusercontent.com/59691442/174499475-f706296f-4c82-47ac-bd36-ef4fbeab92d9.png)|
-->

## Videos

A set of videos are available in the video folfer. They show the different main step of the image processing.

PLACEHOLDER

## Quick start

First thing to do is to have MatLab, you can find it below:  
<https://fr.mathworks.com/products/matlab.html>

To run the project, you need to install the MatLab packages:
- [Image Processing Toolbox](https://fr.mathworks.com/products/image.html)
- [Signal Processing Toolbox](https://fr.mathworks.com/products/signal.html)
- [Image Acquisition Toolbox](https://fr.mathworks.com/products/image-acquisition.html)

Once you have installed everything, you can start the project opening the root folder as a project and starting the `main.m` script in MatLab.

## Project architecture

The project is compose of one main script `main.m` that will call all the others script.

The other importants scripts are :
- `create_video_from_images.m` to create video from a set of images
- `image_processing.m` to process images
- `image_regions.m` to display regions in a image
- `image_segmentation.m` to segment cells in a image

The three other following files are a set of functions for different way to convert an image to black and white (BW):
- `im2bw_mean` image to BW by using mean
- `im2bw_median` image to BW by using median
- `im2bw_my_version` image by manually changing threshold

**Note**
> You can also use the Otsu's method to convert an image from grayscale to BW.

The `pipe.m` file is to use several functions on one variable 
For example, a conversion from grayscale to BW, processing and segmenting image.
To use it there is four example in the code:  

```matlab
create_video_from_images(fps, inputFolder, imagesExtension, outputFolder, 'cells-4-bw-processed-segmented.avi', {im2bwSelectedFunc, @image_processing,@image_segmentation});
```

Usage:

```matlab
image = pipe(image, {@func1,@func2,@func3});
```

## Documentation

Datacorner image processing course :  
<https://www.datacorner.fr/image-processing-1/>

## Authors

Quentin MOREL :

- @Im-Rises
- <https://github.com/Im-Rises>

[![GitHub contributors](https://contrib.rocks/image?repo=Im-Rises/cells_segmentation)](https://github.com/Im-Rises/cells_segmentation/graphs/contributors)

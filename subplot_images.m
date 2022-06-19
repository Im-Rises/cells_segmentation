function subplot_images()
subplot(2,2,1), imshow(image), title('Original');
subplot(2,2,2), imshow(imageOtsu), title("Otsu's threshold");
subplot(2,2,3), imshow(imageMedian), title('Median threshold');
subplot(2,2,4), imshow(imageMean), title('Mean threshold');
end
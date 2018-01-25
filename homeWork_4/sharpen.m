close all 
clear all
image=imread('test.jpg');
image_double = im2double(image);


image_sobel = sobel_sharpen(image);
image_sobel = hsi2rgb(image_sobel);
image_sobel = image_double+image_sobel;

image_laplacian = laplacian_sharpen(image);
image_laplacian = hsi2rgb(image_laplacian);
image_laplacian=image_double+image_laplacian;


figure();
subplot(1,3,1);
imshow(image);
xlabel('Raw image');

subplot(1,3,2);
imshow(image_sobel);
xlabel('Image With Sobel');

subplot(1,3,3);
imshow(image_laplacian);
xlabel('Image With Laplacian');


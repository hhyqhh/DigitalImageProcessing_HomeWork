close all 
clear all
image=imread('test.jpg');
imageWithNoise = add_gaussian_niose(image,0,0.05);
image_RGB_fliter = mean_filter_rgb(imageWithNoise,3);
image_HSI_fliter = mean_filter_hsi(imageWithNoise,3);
image_HSI_fliter = hsi2rgb(image_HSI_fliter);

figure();
subplot(2,2,1);
imshow(image);
xlabel('Raw image');

subplot(2,2,2);
imshow(imageWithNoise);
xlabel('Image With Noise');

subplot(2,2,3);
imshow(image_RGB_fliter);
xlabel('Image RGBfliter');

subplot(2,2,4);
imshow(image_HSI_fliter);
xlabel('Image HSIfliter');




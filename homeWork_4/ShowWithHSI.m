close all 
clear all
image=imread('test_low.jpg');
hsi = rgb2hsi(image);

image_H = image(:,:,1);
image_S = image(:,:,2);
image_I = image(:,:,3);


figure();
subplot(2,2,1);
imshow(image);
xlabel('Raw image');

subplot(2,2,2);
imshow(image_H);
xlabel('H channel');

subplot(2,2,3);
imshow(image_S);
xlabel('S channel');

subplot(2,2,4);
imshow(image_I);
xlabel('I channel');
close all 
clear all
image=imread('test.jpg');
image_R = image(:,:,1);
image_G = image(:,:,2);
image_B = image(:,:,3);

figure();
subplot(2,2,1);
imshow(image);
xlabel('Raw image');

subplot(2,2,2);
imshow(image_R);
xlabel('R channel');

subplot(2,2,3);
imshow(image_G);
xlabel('G channel');

subplot(2,2,4);
imshow(image_B);
xlabel('B channel');

close all 
clear all
image=imread('test.jpg');
image_R = image(:,:,1);
image_G = image(:,:,2);
image_B = image(:,:,3);

image_C = 255-image_R;
image_M = 255-image_G;
image_Y = 255-image_B;

figure();
subplot(2,2,1);
imshow(image);
xlabel('Raw image');

subplot(2,2,2);
imshow(image_C);
xlabel('C channel');

subplot(2,2,3);
imshow(image_M);
xlabel('M channel');

subplot(2,2,4);
imshow(image_Y);
xlabel('Y channel');

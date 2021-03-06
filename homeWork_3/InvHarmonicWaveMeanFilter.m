close all 
clear all
image=imread('filtering.tif');

figure();
subplot(2,2,1);
imshow(image);
xlabel('Raw image');

image_mean_3 = Inv_harmonic_wave_mean_filter(image,3);
subplot(2,2,2);
imshow(image_mean_3)
xlabel('Inv harmonic wave mean filter/3 Q=1.5');

image_mean_5 = Inv_harmonic_wave_mean_filter(image,5);
subplot(2,2,3);
imshow(image_mean_5)
xlabel('Inv harmonic wave mean filter/5 Q=1.5');

image_mean_9 = Inv_harmonic_wave_mean_filter(image,9);
subplot(2,2,4);
imshow(image_mean_9)
xlabel('Inv harmonic wave mean filter/9 Q=1.5');


%%
function [result_imag]= Inv_harmonic_wave_mean_filter(image,filter_size)
    Ex_image = extend_imag(image);
    result_imag = image;
    [M,N]=size(Ex_image);
    helf_size = (filter_size-1)/2;
    Q=1.5;
    for x=1+helf_size:1:M-helf_size
        for y=1+helf_size:1:N-helf_size
            slid=Ex_image(x-helf_size:1:x+helf_size,y-helf_size:1:y+helf_size);
            result_imag(x,y) = sum(slid(:).^(Q+1))/sum(slid(:).^(Q));
        end
    end
end
%%
function [result_imag] = extend_imag(image)
    [M,N] = size(image);
    temp = zeros(M+2,N+2);
    for x = 1:M
        temp(x+1,:) = [image(x,1) image(x,:) image(x,N)];
    end
    temp(1,:) = temp(2,:);
    temp(M+2,:) = temp(M+1,:);
    result_imag = temp;
end
function [result_image]= sobel_sharpen(image)
Mask = 3;
image_HSI = rgb2hsi(image);
h = image_HSI(:,:,1);
s = image_HSI(:,:,2);
i = image_HSI(:,:,3);


Temp = padarray(i, [(Mask-1)/2 (Mask-1)/2]);    
[j,k] = size(i);
i_result = zeros(j,k);
SobelOperatorsX = [
                    -1 -2 -1    
                     0  0  0
                     1  2  1
                    ];
SobelOperatorsY = [
                    -1  0  1
                    -2  0  2
                    -1  0  1
                    ];
for x = 2:j+1
    for y = 2:k+1
        Part = double(Temp(x - 1 : x + 1, y - 1 : y + 1));
        i_result(x - 1, y - 1) =  abs(sum(sum(times(Part,SobelOperatorsX)))) + abs(sum(sum(times(Part,SobelOperatorsY))));
    end
end

result_image = cat(3, h, s, i_result);
end
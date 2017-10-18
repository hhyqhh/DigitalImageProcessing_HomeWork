f = imread('C:\Users\hh\Documents\MATLAB\homeWork_1\Test_gray.jpg');
f = mat2gray(f,[0 255]);

T1 = add_gaussian_niose(f,0,0.05);
T2 = add_SaltPepper_noise(f,0.01);

R1 = mean_filter(T1,3);
R2 = mean_filter(T1,5);
R3 = mean_filter(T2,3);
R4 = mean_filter(T2,5);


R5 = median_filter(T1,3);
R6 = median_filter(T1,5);
R7 = median_filter(T2,3);
R8 = median_filter(T2,5);

%imshow(imag4,[0,1])

imwrite(T1,'gs.jpg');
imwrite(T2,'sp.jpg');
imwrite(R1,'gs_mean_3.jpg');
imwrite(R2,'gs_mean_5.jpg');
imwrite(R3,'sp_mean_3.jpg');
imwrite(R4,'sp_mean_5.jpg');
imwrite(R5,'gs_median_3.jpg');
imwrite(R6,'gs_median_5.jpg');
imwrite(R7,'sp_median_3.jpg');
imwrite(R8,'sp_median_5.jpg');



%%
function [result_imag]= mean_filter(imag,L)
    winsizw = L*L;
    k=(L-1)/2;
    [M,N] = size(imag);
    Flag=1;
    for qq =1:k
        if Flag == 1
            img_Ex = imag;
            Flag = 0;
        end
        img_Ex = extend_imag(img_Ex);
    end

    temp = zeros(M,N);

    for y = 1+k:M+k
        for x = 1+k:N+k
            for i = 0-k:0+k
                for j =0-k:0+k
                    temp(x-k,y-k) = temp(x-k,y-k) + img_Ex(x+i,y+j);
                end
            end
            temp(x-k,y-k)=temp(x-k,y-k)/(winsizw);
        end
    end
    result_imag = temp;
end

%%
function [result_imag]= median_filter(imag,L)
    winsizw = L*L;
    k=(L-1)/2;
    [M,N] = size(imag);
    Flag=1;
    for qq =1:k
        if Flag == 1
            img_Ex = imag;
            Flag = 0;
        end
        img_Ex = extend_imag(img_Ex);
    end

    temp = zeros(M,N);
    temp_win = zeros(L,L);
    for y = 1+k:M+k
        for x = 1+k:N+k
            for i = 0-k:0+k
                for j =0-k:0+k
                    temp_win(k+i+1,k+j+1) = img_Ex(x+i,y+j);
                end
            end
            temp_v=reshape(temp_win,winsizw,1);
            temp_v=sort(temp_v(:));
            temp(x-k,y-k)=temp_v((winsizw+1)/2);
        end
    end
    result_imag = temp;
end


%%
function [result_imag] = extend_imag(img)
    [M,N] = size(img);
    temp = zeros(M+2,N+2);
    for x = 1:M
        temp(x+1,:) = [img(x,1) img(x,:) img(x,N)];
    end
    temp(1,:) = temp(2,:);
    temp(M+2,:) = temp(M+1,:);
    result_imag = temp;
end




%%
function [result_imag]=add_gaussian_niose(imag,mean,var) 
    a = mean;
    b = var;
    [M,N] = size(imag);
    n_gaussian = a + b .* randn(M,N);
    result_imag = imag + n_gaussian; 
end

%%
function [result_imag]=add_SaltPepper_noise(imag,pro) 
    a = pro;
    [M,N] = size(imag);
    spn = rand(M,N); 
    result_imag = imag;  
    result_imag(spn<=a) = 0;  
    result_imag(spn >(1-a)) = 1; 
end
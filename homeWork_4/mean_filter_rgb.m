function [result_imag]= mean_filter_rgb(imag,L)
    rgb = im2double(imag); 
    r = rgb(:, :, 1); 
    g = rgb(:, :, 2); 
    b = rgb(:, :, 3); 
    r = mean_filter_one_channel(r,L);
    g = mean_filter_one_channel(g,L);
    b = mean_filter_one_channel(b,L);
    result_imag = cat(3, r, g, b);

end

%%
function [result_imag]= mean_filter_one_channel(imag,L)
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
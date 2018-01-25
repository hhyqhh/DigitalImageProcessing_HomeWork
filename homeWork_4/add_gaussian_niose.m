function [result_imag]=add_gaussian_niose(imag,mean,var) 
% Extract the individual component immages. 
    rgb = im2double(imag); 
    r = rgb(:, :, 1); 
    g = rgb(:, :, 2); 
    b = rgb(:, :, 3); 
    
    a = mean;
    v = var;
    [M,N] = size(r);
    n_gaussian = a + v.* randn(M,N);
    r = r + n_gaussian; 
    
    n_gaussian = a + v.* randn(M,N);
    g = g + n_gaussian; 
    
    n_gaussian = a + v.* randn(M,N);
    b = b + n_gaussian; 
    
    result_imag = cat(3, r, g, b);
end
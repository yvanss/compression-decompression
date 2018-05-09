function X = decompress_dct(data)
num_win = size(data.coeffs, 2);
coeffs = double(data.coeffs)/(2^(data.coeff_bits-1)); % Rescale coeffs to [-1,1]
% Construct full DCT windows from sparse.
Y = zeros(data.window, num_win);
for i = 1:num_win
   Y(data.ind(:,i),i) = coeffs(:,i);  
end
 
% Inverse DCT each window.
X = idct(Y);
% Stitch windows into one long vector.
X = reshape(X, num_win*data.window, 1);
end

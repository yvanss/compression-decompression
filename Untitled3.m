window_size = 2048;
n_coeffs_keep = 100; 
coeff_n_bits = 10;
% Load wav file, must be mono, number of samples divisible by window size.
X = wavread('bach_clip.wav');
% Compress wav
comp = compress_dct(X, window_size, n_coeffs_keep, coeff_n_bits);
% Save comp structure in a binary format with extra gzip compression 
% so we can see how big it really is.
save -binary -z bach.mat comp
% Decompress and write back to wav for comparison.
Xdecomp = decompress_dct(comp);
wavwrite(Xdecomp, 44100, 16, 'bach_decomp.wav');
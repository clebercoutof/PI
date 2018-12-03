function [a,b,c] = tri_resample(fs,fs_raw,raw_a,raw_b,raw_c)
    a = resample(raw_a,fs,fs_raw);
    b = resample(raw_b,fs,fs_raw);
    c = resample(raw_c,fs,fs_raw);
end
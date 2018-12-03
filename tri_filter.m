%ap = signal ripple passband
%as = stopband atenuation
%fs = sample frequency
%fc = cutoof frequency
%fstpb = frequency stopband
function [ia,ib,ic] = tri_filter(s1,s2,s3)
ap = 0.1;
as = 60;
fs = 8000;
fc = [420];
fstpb = [430];

    fcn = tan(pi*fc/fs);
    fstpbn = tan(pi*fstpb/fs);

    %N = buttord(fcn,fstpbn,ap,as,'s');
    %[z,p,k]=buttap(N);
    
    [N, Wn] = ellipord(fcn,fstpbn,ap,as,'s');
    [z,p,k] = ellipap(N,ap,as);
    
    [a,b] = zp2tf(z,p,k);
    
    [a,b] = lp2lp(a,b,fcn);
    %sys = tf(a,b);

    [a, b] = bilinear(a,b,0.5);
    %sys = tf(a,b,-1);
    %%freqz(a,b,10000,fs);
    ia = filter(a,b ,s1);
    ib = filter(a,b ,s2);
    ic = filter(a,b ,s3);
    
end
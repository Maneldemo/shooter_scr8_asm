clear
close all
 

red   = [0,  36,  73, 109, 146, 182, 219, 255];
green = [0,  36,  73, 109, 146, 182, 219, 255];
blue  = [0,  73, 146, 255];

i=1;
for g=0:7
    for r=0:7
        for b=0:3
            pal(i,:) = ([red(r+1) green(g+1) blue(b+1)]/255);
            i=i+1;
        end
    end
end

[A2,MAP] = imread('scorebar.bmp');


A2 = imapprox(A2,MAP,pal, 'nodither');
MAP = pal;

H = 24;
W = 256;

B = A2(1:H,1:W);

H = size(B,1);
W = size(B,2);

image(B);
axis equal;
colormap(MAP);

fid = fopen('scorebar.bin','wb');
for y=1:H
    t = uint8(B(y,:));
    fwrite(fid,t,'uchar');
end
fclose(fid);

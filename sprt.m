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

[A,MAP] = imread('bmp\Sprite_Palette_OR.bmp'); sprtpaldec = round(MAP(double(A(1:16:256,1))+1,:)*7);

      %  green red blue
sprtpalgrb = [ 0 0 0
    0 0 2
    0 3 0
    0 3 2
    3 0 0
    3 0 2
    3 3 0
    3 3 2
    4 7 2
    0 0 7
    0 7 0
    0 7 7
    7 0 0
    7 0 7
    7 7 0
    7 7 7];
        
sprtpalrgb = sprtpalgrb(:,[2 1 3])/7;
        
figure;
r = uint8(kron(0:15,ones(16,1)));
t = bitor(r,r');
image(t)
colormap(sprtpalrgb);
axis equal
grid


[A,MAP] = imread('ene_code\uridium_rev9.bmp');
MAP(1,:) = [ 0 0 0];
F = A(1:16,1:16);
F1 = imapprox(F,MAP,sprtpalrgb, 'nodither');

figure;
image(F)
colormap(MAP);
axis equal
figure;
image(F1)
colormap(sprtpalrgb);
axis equal

C = cell(16,1);
%S = cell(16,1);
F1 = zeros(size(F));
F2 = zeros(size(F));
for y=1:16

    e = inf;
    for c1=1:16
        for c2=c1+1:16
            
            pal = sprtpalrgb([c1, c2, 1+bitor(c1-1,c2-1)],:)
            l = F(:,y);
            m = imapprox(l,MAP,pal, 'nodither');
            
            ne = sum(sum((MAP(1+l,:)-pal(1+m,:)).^2));

            if (ne<e) 
                e = ne;
                C{y} = [c1 c1]-1;
                F1(:,y) = ((m==0)+(m==2)>0)*(c1-1);
                F2(:,y) = ((m==1)+(m==2)>0)*(c2-1);
            end
            
        end
    end
end
        
figure;
image(bitor(F1,F2)+1)
colormap(sprtpalrgb);
axis equal


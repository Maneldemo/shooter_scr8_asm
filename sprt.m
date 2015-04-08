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

    %  green red blue
sprtpal = [ 0 0 0
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

figure;
r = uint8(kron(0:15,ones(16,1)));
t = bitor(r,r');
image(t)
colormap([sprtpal(:,2) sprtpal(:,3) sprtpal(:,1)]/7);
axis equal
grid


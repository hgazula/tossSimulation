function smoothedVec = tossSmooth(vec)

% a0 = 0.015570829; a1 = 0.031141659; a2 = 0.015570829; b1 = 1.61729493; b2 = -0.679578247;
% a0 = 0.067455274; a1 = 0.134910548; a2 = 0.067455274; b1 = 1.142980503; b2 = -0.412801598;
% a0 =1; a1=2; a2=1; b1=-2; b2=-1;

fs=1/(60);
fc=1/(1800);
wc=tan(pi*fc/fs);
k1=sqrt(2)*wc;
k2=wc^2;
a0=k2/(1+k1+k2);
a1=2*a0;
a2=a0;
k3=(2*a0)/k2;
b1=-(2*a0)+k3;
b2=1-(2*a0)-k3;


[r,c] = size(vec);
smoothedVec1 = zeros(r,c);
smoothedVec = zeros(r,c);

smoothedVec1(1:2,:) = vec(1:2,:);

for j = 1:c
    for i = 3:r
        smoothedVec1(i,j) = a0*vec(i,j) + a1*vec(i-1,j) + a2*vec(i-2,j)...
                            + b1*smoothedVec1(i-1,j) + b2*smoothedVec1(i-2,j);
    end
end

smoothedVec(end-1:end,:) = smoothedVec1(end-1:end,:);


for j = 1:c
    for i = r-2:-1:1
        smoothedVec(i,j) = a0*smoothedVec1(i,j) + a1*smoothedVec1(i+1,j) + a2*smoothedVec1(i+2,j)...
                            + b1*smoothedVec(i+1,j) + b2*smoothedVec(i+2,j);
    end
end
N = 256;
m=0;
n=1;
v0 = sqrt(1/N);
phi_vector = zeros(m+1,n+1);

for i=1:N
    for j=1:N
        for x=0:m
           for y=0:n
               vm = 1;
               vn = 1;
               if(x==0)
                  vm = v0;
               else   
                  t = pi*x*(i-0.5)/N; 
                  cosine  = cos(t);
                  vm = sqrt(2/N)*cosine;
               end
               if(y==0)
                   vn = v0;
               else
                  t = pi*y*(j-0.5)/N; 
                  cosine = cos(t);
                  vn = sqrt(2/N)*cosine;
               end   
               phi_vector(i,j) = vm*vn;
           end
        end
    end
end

K = mat2gray(phi_vector);
imshow(K);


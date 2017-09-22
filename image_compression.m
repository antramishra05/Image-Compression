mat = imread('flower.png');
%vec1 = rgb2gray(mat);
vec1 = mat;
img = double(vec1);
[row,col]=size(img);
N = row;
m=(N/2)-1;
n=m;

cosine = get_cosine(N,m);

% get the coefficients for m*n basis vectors
a = zeros(m+1,n+1);
for x=0:m
   for y=0:n
      a(x+1,y+1) = inner_product(img,cosine,x,y);
   end
end

% get the resultant image matrix by multiplying basis vector with
% coeffiencet
res = zeros(N,N);
for i=1:N
   for j=1:N
       temp=0;
       for x=0:m
           for y=0:n
               vm = 1;
               vn = 1;
               if(x==0)
                  vm = v0;
               else   
                  t = pi*x*(i-0.5)/N; 
                  cos_t  = cos(t);
                  vm = sqrt(2/N)*cos_t;
               end
               if(y==0)
                   vn = v0;
               else
                  t = pi*y*(j-0.5)/N; 
                  cos_t = cos(t);
                  vn = sqrt(2/N)*cos_t;
               end   
               %cosine(i,m+1)*cosine(j,n+1);
               temp = temp+a(x+1,y+1)*vm*vn;
           end
        end
      res(i,j) = temp;    
   end
end

K = mat2gray(res);
imshow(K);


% functions used
function cosine = get_cosine(N,m)
    vectors = zeros(N,m+1);
    for i=1:N
        for x=0:m
            if(x == 0)
                vectors(i,x+1) = sqrt(1/N);
            else
                t = pi*x*(i-0.5)/N;
                vm = sqrt(2/N)*cos(t);
                vectors(i,x+1) = vm;
            end
        end
    end
    cosine = vectors;
end

function ip=inner_product(img,cosine,freqx,freqy)
    [row,col]=size(img);
    N = row;
    temp = 0;
    
    for i=1:N
       for j=1:N
           v1 = cosine(i,freqx+1);
           v2 = cosine(j,freqy+1); 
           temp = temp+img(i,j)*v1*v2; 
       end
    end
    ip = temp;
end

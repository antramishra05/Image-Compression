
imdata1 = double(rgb2gray(imread('man.png')));
imdata2 = double(rgb2gray(imread('grayscale_binary_02.png')));
ip = inner_product(imdata1,imdata2); 
dot_prod2 =sum(ip);

norm1 = vector_norm(imdata1);
norm2 = vector_norm(imdata2);
cos = ip/(norm1*norm2);
res = acosd(cos);

function dot_prod = inner_product(v1,v2)
    ip = dot(v1,v2,2);
    dot_prod = 0;
    [row,col] = size(ip);
    for i=1:row
        dot_prod = ip(i,1);
    end  
end

function n = vector_norm(vector)
    ip = inner_product(vector,vector);
    n = sqrt(ip);
end




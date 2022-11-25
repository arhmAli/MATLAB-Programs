img=imread("coins.jpg");

BW = imbinarize(img);
mask=img;
mask(~BW)=0;
imshow(mask);
imshow(mask);
k=nnz(mask)
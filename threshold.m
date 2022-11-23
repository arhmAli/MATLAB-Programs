img=imread("coins.jpg");
imshow(img)
BW = imbinarize(img);
mask=img;
mask(~BW)=0;
imshow(mask);
imshow(mask);
k=nnz(mask)

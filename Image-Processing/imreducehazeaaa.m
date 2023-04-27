img=imread("mountain2.jpg");
img2=imreducehaze(img);
img3=mean2(img2)
img4=mean2(img)
imshow(img2)
montage({img,img2})

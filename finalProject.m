refImg = im2gray(imread("00004.jpg"));
newImg = im2gray(imread("00143.jpg"));
refThresh=graythresh(refImg);
newImgBW=imbinarize(newImg,refThresh);
new=imhistmatch(newImg,refImg);
newref=graythresh(new);
matchImgBW=imbinarize(newImg,newref);
montage({newImg, newImgBW, matchImgBW})


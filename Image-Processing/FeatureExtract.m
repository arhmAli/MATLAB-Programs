% Read in cracks and convert to grayscale
refImg = im2gray(imread("00035.jpg"));
newImg = im2gray(imread("00143.jpeg"));

refThresh=graythresh(refImg);
newImgBW=imbinarize(newImg,refThresh);
new=imhistmatch(newImg,refImg);
newref=graythresh(new);
matchImgBW=imbinarize(new,newref);




% Uncomment below to display Crack 00143 and both segmentations
montage({newImg, newImgBW, matchImgBW})
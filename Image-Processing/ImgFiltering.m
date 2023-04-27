img = imread("dash.jpg");
% Enter your code below
temp=im2gray(img);
temp_2=imrotate(temp,-1,'crop');
temp_3=imadjust(temp_2,[],[],0.5)
imgAdjusted=temp_3
imshow(imgAdjusted)
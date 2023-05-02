% read input image
img = imread('obstacle_6.jpg');
% img_2=imread('obstacle_2.jpg');
% img_2=imread('obstacle_2.jpg');
% img_2=imread('obstacle_2.jpg');
% img_2=imread('obstacle_2.jpg');
% convert to grayscale
gray_img = rgb2gray(img);

% apply threshold to create a binary image
binary_img = gray_img > 110;

% perform morphological operations to remove small objects and fill holes
binary_img = imopen(binary_img, strel('disk', 10));
binary_img = imclose(binary_img, strel('disk', 10));

% label connected components
labeled_img = bwlabel(binary_img);

% find the largest connected component
stats = regionprops(labeled_img, 'Area', 'PixelIdxList');
[~, idx] = max([stats.Area]);
    largest_comp = stats(idx).PixelIdxList;

% create a mask of the obstacle
mask = zeros(size(binary_img));
mask(largest_comp) = 1;

% apply the mask to the original image to segment the obstacle
segmented_img = bsxfun(@times, img, cast(mask, 'like', img));

% display the segmented image
imshow(segmented_img);

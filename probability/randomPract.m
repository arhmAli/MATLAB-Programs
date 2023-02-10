d=(1:52);

%probability of not being heart
nh=(length(d)-13)/length(d);

%probability of being heart
h=13/length(d);

% histogram(h,10);
% figure
% histogram(nh,10);

%drawn two times and not reshuffled.
%probability of not being heart now!
deck=(1:52);
heart=(1:13);
spades=(1:13);
diamonds=(1:13);
club=(1:13);

probHeart1=13/(length(deck));
probHeart2=12/(length(deck)-1);
probHeart3=11/(length(deck)-2);

whole=table(length(heart),probHeart1,probHeart2,probHeart3)
histogram(probHeart1);
figure
histogram(probHeart2);
figure
histogram(probHeart3);
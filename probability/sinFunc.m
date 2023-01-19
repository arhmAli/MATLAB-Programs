range=[0:0.1:100];
output=sin(range);
plot(range,output)

range=[-2:0.1:2];
output=sin(range);
plot(range,output,'r--')
hold on
output=cos(range);
plot(range,output,'g--')

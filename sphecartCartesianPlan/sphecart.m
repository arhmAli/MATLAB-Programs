function [x,y,z] = sphecart(r,thetha,rho)
%Conversion from spehrical to cartesian
%   Detailed explanation goes here
x=r*cos(rho)*cos(thetha);
y=r*cos(rho)*sin(thetha);
z=r*sin(rho);
end
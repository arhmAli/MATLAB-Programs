function [g] = gravity(alt)
%This function will give the gravity of earth at a specifice altitude.
%   The user will give the alt and the function will calculate the g which
%   is the output of the function and display it

%define the earth radius
    Re=6372000;
    %define the gravitational constant
    G=6.67e-11;
    %define the mass of earth
    Me=5.97e+24;
    %computation of the radius
    r=Re+alt;
    %calculation of the g value
            g=-G*Me./r.^2;
end


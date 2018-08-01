function [ noise ] = computeNoise( P )

% Function return noise at PD

InputParameters;
CallParameters;
temp = [];

% Thermal noise
Thermal = 8*pi*Kb*Tk*n*A*I2*(B^2)/G + 16*(pi^2)*Kb*Tk*F*(n^2)*(A^2)*I3*(B^3)/Gm

% Shot Noise
for i = 1:length(P)
    Shot = 2*q*l*P(i)*B+2*q*Ibg*I2*B
    z= Shot + Thermal
    w=sqrt(z);
    temp = [temp z];
end

noise = temp;

end


function [ PD_angle ] = createPhotodiodeArray( )
% Chuc nang: Tao 1 mang cac goc cua cac PD
global K;

%% Tao mang cac goc cua cac PD tu 1-9
angle=[];
for i=1:K
    angle=[angle pi*(i-1)/(K-1)];
end
PD_angle = angle;

end


function [ PD_angle ] = createPhotodiodeArray( )

% Function return array of PD
global K;

angle=[];
for i=1:K
    angle=[angle pi*(i-1)/(K-1)];
end
PD_angle = angle;

end


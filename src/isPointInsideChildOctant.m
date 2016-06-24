function value = isPointInsideChildOctant( point, border )
%ISPOINTINSIDECHILDOCTANT Summary of this function goes here
%   Detailed explanation goes here
    
if (point(1) >= border(1)) && (point(1) <= border(4)) && (point(2) >= border(2)) && (point(2) <= border(5)) && (point(3) >= border(3)) && (point(3) <= border(6))
    value = 1;
else
    value = 0;
end



end


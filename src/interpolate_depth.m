function [ depthMap_interp, o ] = interpolate_depth( depthMap )
%INTERPOLATE Summary of this function goes here
%   Detailed explanation goes here
[x, y] = size(depthMap);
depthMap_interp = depthMap;
o = 0;
for i = 1:x
    for j = 1:y
        if (depthMap(x,y) < 0.0101226) 
            depthMap_interp(x,y) = depthMap_interp(x-1,y);
            o = o+1;
        end
    end
end

end


function [points_000, points_001, points_010, points_011, points_100, points_101, points_110, points_111] = sortPointsToChilds( parentPoints, BorderChild )
%SORTPOINTSTOCHILDS determines which point is in which child octant
%   Detailed explanation goes here
i0 = 1;
i1 = 1;
i2 = 1;
i3 = 1;
i4 = 1;
i5 = 1;
i6 = 1;
i7 = 1;
points_000 = zeros(size(parentPoints,1),3);
points_001 = zeros(size(parentPoints,1),3);
points_010 = zeros(size(parentPoints,1),3);
points_011 = zeros(size(parentPoints,1),3);
points_100 = zeros(size(parentPoints,1),3);
points_101 = zeros(size(parentPoints,1),3);
points_110 = zeros(size(parentPoints,1),3);
points_111 = zeros(size(parentPoints,1),3);
for j = 1:size(parentPoints,1)
    if isPointInsideChildOctant(parentPoints(j,:), BorderChild(1,:));
        points_000(i0,:) = parentPoints(j,:);
        i0 = i0 + 1;
    elseif isPointInsideChildOctant(parentPoints(j,:), BorderChild(2,:));
        points_001(i1,:) = parentPoints(j,:);
        i1 = i1 + 1;
    elseif isPointInsideChildOctant(parentPoints(j,:), BorderChild(3,:));
        points_010(i2,:) = parentPoints(j,:);
        i2 = i2 + 1;
    elseif isPointInsideChildOctant(parentPoints(j,:), BorderChild(4,:));
        points_011(i3,:) = parentPoints(j,:);
        i3 = i3 + 1;
    elseif isPointInsideChildOctant(parentPoints(j,:), BorderChild(5,:));
        points_100(i4,:) = parentPoints(j,:);
        i4 = i4 + 1;
    elseif isPointInsideChildOctant(parentPoints(j,:), BorderChild(6,:));
        points_101(i5,:) = parentPoints(j,:);
        i5 = i5 + 1;
    elseif isPointInsideChildOctant(parentPoints(j,:), BorderChild(7,:));
        points_110(i6,:) = parentPoints(j,:);
        i6 = i6 + 1;
    elseif isPointInsideChildOctant(parentPoints(j,:), BorderChild(8,:));
        points_111(i7,:) = parentPoints(j,:);
        i7 = i7 + 1;
    end % if
end % for
points_000(i0:end,:) = [];
points_001(i1:end,:) = [];
points_010(i2:end,:) = [];
points_011(i3:end,:) = [];
points_100(i4:end,:) = [];
points_101(i5:end,:) = [];
points_110(i6:end,:) = [];
points_111(i7:end,:) = [];

end


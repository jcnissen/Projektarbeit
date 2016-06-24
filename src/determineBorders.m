function BorderChild = determineBorders(ParentBorders)
xmin = ParentBorders(1);
ymin = ParentBorders(2);
zmin = ParentBorders(3);
xmax = ParentBorders(4);
ymax = ParentBorders(5);
zmax = ParentBorders(6);
BorderChild = zeros(8,6);

BorderChild(1,:) = [xmin, ymin, zmin, (xmax+xmin)/2, (ymax+ymin)/2, (zmax+zmin)/2];
BorderChild(2,:) = [xmin, ymin, (zmax+zmin)/2, (xmax+xmin)/2, (ymax+ymin)/2, zmax];
BorderChild(3,:) = [xmin, (ymax+ymin)/2, zmin, (xmax+xmin)/2, ymax, (zmax+zmin)/2];
BorderChild(4,:) = [xmin, (ymax+ymin)/2, (zmax+zmin)/2, (xmax+xmin)/2, ymax, zmax];
BorderChild(5,:) = [(xmax+xmin)/2, ymin, zmin, xmax, (ymax+ymin)/2, (zmax+zmin)/2];
BorderChild(6,:) = [(xmax+xmin)/2, ymin, (zmax+zmin)/2, xmax, (ymax+ymin)/2, zmax];
BorderChild(7,:) = [(xmax+xmin)/2, (ymax+ymin)/2, zmin, xmax, ymax, (zmax+zmin)/2];
BorderChild(8,:) = [(xmax+xmin)/2, (ymax+ymin)/2, (zmax+zmin)/2, xmax, ymax, zmax];

end % function
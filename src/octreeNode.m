classdef octreeNode
    %OCTREENODE Summary of this class goes here
    %   Detailed explanation goes here
    
    properties
        xyzKey; % octant position of this node
        childID; % index of first child node
        sdf; % signed distance function
        weight; 
        points;
        borders;
    end
    
    methods
       function this = octreeNode(points, xyzKey, borders)
           this.xyzKey = xyzKey;
           this.childID = -1;
           this.sdf = 0;
           this.weight = 0;
           this.points = points;
           this.borders = borders;
       end

    end
    
end


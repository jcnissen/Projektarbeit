classdef topNode
    %TOPNODE Summary of this class goes here
    %   Detailed explanation goes here
    
    properties
        xyzKey;
        sceneGeometry; % store a boolean value to indicating if this node contains scene geometry
    end
    
    methods
        function this = topNode(xyzKey, sceneGeometry)
            this.xyzKey = xyzKey;
            this.sceneGeometry = sceneGeometry;
        end

    end
    
end


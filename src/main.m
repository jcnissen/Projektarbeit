profile on
% clear
tic
%% initial information
% In 3D computer graphics a depth map is an image or image channel that contains information relating to the distance 
% of the surfaces of scene objects from a viewpoint. Loads the variable
% depthMap, ext and K.
% load('Model1_Sequence3_Frame20.mat');
% load('depthMap.mat');
[N, M] = size(depthMap);
accuracy = 10;

% inverse camera calibration matrix
%K_inv = inv(K);

%% preprocessing from depth map to 3D point cloud
% construct image coordinates as vector 3 x N*M with ones in z coordinate
[X,Y] = meshgrid(1:M,1:N);
x = [X(:) Y(:) ones(N*M,1)]';

% identify pixels with zero disparity - these correspond to world points that are too far away to measure.
isZero=(depthMap(:)==0);

% calculate disparity (depth) vector 3 x N*M from the depth map (without zero disparity)
d = 1 ./ repmat(depthMap(~isZero)',[3 1]);

% convert depth map from a 2D image to 3D camera coordinates
x_depth = d .* x;
xc_3d = K\x_depth(:,~isZero); %K_inv * x_depth(:,~isZero);

% insert w = 1 to get 4D camera coordinates
xc_4d = [xc_3d; ones(1,size(xc_3d,2))];

% convert 4D camera coordinates with extrinsic matrix to 3D world coordinates
xw_3d = ext * xc_4d;
points_3D = xw_3d';

% norm the points
min_x = abs(min(points_3D(:,1)));
min_y = abs(min(points_3D(:,2)));

% points_3D_norm = [round(points_3D(:,1)*100/min_x*1)/1 round(points_3D(:,2)*100/min_y*1)/1 round(points_3D(:,3)*1)/1];
points_3D_norm = [round(points_3D(:,1)*accuracy)/accuracy round(points_3D(:,2)*accuracy)/accuracy round(points_3D(:,3)*accuracy)/accuracy];

%% preprocessing camera position
% calculate camera position in 3D world coordinates
P = K * ext; % projection matrix
Mc = P(1:3,1:3);
C_e = (- inv(Mc)) * P(1:3,4); % Camera center in world coordinates C_e
C = [C_e; 1]; % C 

%% building an octree
% Octree_norm = octree(points_3D_norm);
Octree = octree(points_3D);


%% view depth map

% figure(5)
% surf([1 958],[1 1278],repmat(0, [2 2]),...
%     depthMap,'facecolor','texture')

% figure(6)
% imshow(depthMap,[])


%% view octtree
% figure(2)
% binMinMax = Octree_norm.NodeBoundaries;
% ptsp = cat(1, binMinMax([...
%     1 2 3; 4 2 3; 4 5 3; 1 5 3; 1 2 3;...
%     1 2 6; 4 2 6; 4 5 6; 1 5 6; 1 2 6; 1 2 3]),...
%     nan(1,3), binMinMax([4 2 3; 4 2 6]),...
%     nan(1,3), binMinMax([4 5 3; 4 5 6]),...
%     nan(1,3), binMinMax([1 5 3; 1 5 6]));
% h = plot3(ptsp(:,1),ptsp(:,2),ptsp(:,3));
% hold on
% scatter3(points_3D_norm(:,1),points_3D_norm(:,2),points_3D_norm(:,3))

% 
% figure(3)
% binMinMax = Octree.NodeBoundaries;
% ptsp = cat(1, binMinMax([...
%     1 2 3; 4 2 3; 4 5 3; 1 5 3; 1 2 3;...
%     1 2 6; 4 2 6; 4 5 6; 1 5 6; 1 2 6; 1 2 3]),...
%     nan(1,3), binMinMax([4 2 3; 4 2 6]),...
%     nan(1,3), binMinMax([4 5 3; 4 5 6]),...
%     nan(1,3), binMinMax([1 5 3; 1 5 6]));
% h = plot3(ptsp(:,1),ptsp(:,2),ptsp(:,3));
% hold on
% scatter3(points_3D(:,1),points_3D(:,2),points_3D(:,3))

%% view pointcloud (langsam)

% figure(8)
% scatter3(points_3D(:,1),points_3D(:,2),points_3D(:,3))
% hold on
% scatter3(C_e(1,:),C_e(2,:),C_e(3,:));
% hold off

%% view pointcloud (schnell)
% ptCloud = pointCloud(xw_3d');
% 
% % Create a streaming point cloud viewer
% player3D = pcplayer([min(xw_3d(1,:)), max(xw_3d(1,:))], [min(xw_3d(2,:)), max(xw_3d(2,:))], [min(xw_3d(3,:)), max(xw_3d(3,:))], 'VerticalAxis', 'y', ...
%     'VerticalAxisDir', 'down');
% 
% % Visualize the point cloud
% view(player3D, ptCloud);
toc

profile viewer
profsave

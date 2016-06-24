function [ splitVec ] = needSplit( this, l )
%NODESNEEDSPLIT Summary of this function goes here
%   Detailed explanation goes here
splitVec = zeros(size(this.oct(l,:),2),1);
splitCounter = 1;
for i = 1:size(this.oct(l,:),2) % goes trough all nodes on the level l and check if the node needs a split
    if size(this.oct{l,i}.points,1) > 1 % true: node needs split
        splitVec(i) = splitCounter;
        splitCounter = splitCounter + 1;
        if size(this.oct{l,i}.points,1) > 2
            this.needSplitNextLevel = true;
        end
    end
end
NumberOfNodesToSplit = splitCounter - 1
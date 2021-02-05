%FINDCLOSESTCENTROIDS computes the centroid memberships for every example
%   idx = FINDCLOSESTCENTROIDS (X, centroids) returns the closest centroids
%   in idx for a dataset X where each row is a single example. idx = m x 1 
%   vector of centroid assignments (i.e. each entry in range [1..K])
%

function idx = findClosestCentroids(X, centroids)
    % Set K
    K = size(centroids, 1);
    idx = zeros(size(X,1), 1);

    for i = 1:size(X,1)
        [m, index] = min(sum(((X(i,:) - centroids).*(X(i,:) - centroids)),2));
        idx(i) = index;
    end


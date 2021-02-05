function centroids = computeCentroids(X, idx, K)

[m n] = size(X);

centroids = zeros(K, n);

for i=1:K
    items = X(find(idx == i),:);
    centroids(i,:) = (1/(size(items,1))) * sum(items,1);
end

function [J, grad] = cofiCostFunc(params, Y, R, num_users, num_movies, ...
    num_features, lambda)
X = reshape(params(1:num_movies*num_features), num_movies, num_features);
Theta = reshape(params(num_movies*num_features+1:end), ...
num_users, num_features);
J = 0;
XGrad = zeros(size(X));
ThetaGrad = zeros(size(Theta));
JOrig = sum(sum((((X*Theta') .* R)-(Y .* R)) .^ 2)) * 1/2;
regular = (lambda/2) * (sum(sum((Theta .^ 2))) + sum(sum((X .^ 2))));
J = JOrig + regular;
for i=1:size(X,1),
idx = find(R(i,:) == 1);
Theta_t = Theta(idx,:);
Yt = Y(i, idx);
Xt = (X(i,:)*Theta_t'-Yt)*Theta_t;
XGrad(i,:) = Xt' + (lambda*X(i,:))';
end
for j=1:size(Theta, 1),
idx = find(R(:,j) == 1);
Xt = X(idx,:);
Yt = Y(idx,j);
Theta_t = Xt' * (Xt*Theta(j,:)'-Yt);
ThetaGrad(j,:) = Theta_t' + (lambda*Theta(j,:));
end

grad = [XGrad(:); ThetaGrad(:)];

end
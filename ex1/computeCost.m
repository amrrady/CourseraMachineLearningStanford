%COMPUTECOST Compute cost for linear regression
%   J = COMPUTECOST(X, y, theta) computes the cost of using theta as the
%   parameter for linear regression to fit the data points in X and y


function J = computeCost(X, y, theta)
    m = length(y); % number of training examples
    h = X * theta;
    J = 1/(2*m) * sum((h-y).^2);
end

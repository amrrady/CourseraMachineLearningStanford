%LINEARREGCOSTFUNCTION Compute cost and gradient for regularized linear 
%regression with multiple variables
%   [J, grad] = LINEARREGCOSTFUNCTION(X, y, theta, lambda) computes the 
%   cost of using theta as the parameter for linear regression to fit the 
%   data points in X and y. Returns the cost in J and the gradient in grad
% ====================== YOUR CODE HERE ======================
% Instructions: Compute the cost and gradient of regularized linear 
%               regression for a particular choice of theta.
%
%               You should set J to the cost and grad to the gradient.
% =========================================================================

function [J, grad] = linearRegCostFunction(X, y, theta, lambda)

% Initialize some useful values
m = length(y); % number of training examples

h = X * theta;
J = 1/(2*m) * sum((h-y).^2) + (lambda/(2*m))* sum([0; theta(2:end).^2]);
grad = ((1/m) * (X' *(h-y))) + [0; (lambda/m)*theta(2:end)];
end

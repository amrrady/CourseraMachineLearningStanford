%COSTFUNCTIONREG Compute cost and gradient for logistic regression with regularization
%   J = COSTFUNCTIONREG(theta, X, y, lambda) computes the cost of using
%   theta as the parameter for regularized logistic regression and the
%   gradient of the cost w.r.t. to the parameters. 


function [J, grad] = costFunctionReg(theta, X, y, lambda)


% Initialize some useful values
m = length(y); % number of training examples

% You need to return the following variables correctly 
h = sigmoid(X * theta);
J = (1/m * sum((-y.*log(h))-(1-y).*log(1-h))) + ((lambda/(2*m)) * sum([0; theta(2:end).^2]));
grad = ((1/m) * (X' *(h-y))) + [0; (lambda/m)*theta(2:end)];
size(grad)

end

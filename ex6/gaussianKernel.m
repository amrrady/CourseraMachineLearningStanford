%RBFKERNEL returns a radial basis function kernel between x1 and x2
%   sim = gaussianKernel(x1, x2) returns a gaussian kernel between x1 and x2
%   and returns the value in sim

% Ensure that x1 and x2 are column vectors

function sim = gaussianKernel(x1, x2, sigma)

    x1 = x1(:); x2 = x2(:);

    diffSqr = sum(((x1-x2).^2));
    sim = exp(   (-diffSqr)  /  (2*sigma*sigma)  );

end

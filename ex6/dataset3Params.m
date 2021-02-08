function [C, sigma] = dataset3Params(X, y, Xval, yval)

best = [];
values = [0.01, 0.03, 0.1, 0.3, 1, 3, 10, 30];
for c = values
   for sig = values
      model= svmTrain(X, y, c, @(x1, x2) gaussianKernel(x1, x2, sig));
	  predict = svmPredict(model, Xval);
	  error = mean(double(predict ~= yval));
	  best = [best; c, sig, error];
   end
end

[minError, minIndex] = min(best(:, 3));
C = best(minIndex, 1);
sigma = best(minIndex, 2)


end

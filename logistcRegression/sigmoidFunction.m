function g = sigmoidFunction(z)
%	Compute sigmoid function
  g = zeros(size(z));
  g = 1.0 ./ ( 1.0 + exp(-z));
  
    
end
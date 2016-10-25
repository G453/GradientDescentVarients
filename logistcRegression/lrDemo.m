% figure,
% [x1, x2]= ginput();
% Xpos =[x1,x2];
% [x1, x2]= ginput();
% Xneg =[x1,x2];
% 
% X = [Xpos;Xneg];
% X = [ones(size(X,1),1), X];
% y = [ones(size(Xpos,1),1);zeros(size(Xneg,1),1)];
% number of training examples
load X_rand; load y_rand;
m = length(y);

% STEP1 : we shuffle the data
% n = rand(size(X,1),1); 
%         [garbage index] = sort(n); 
%         X_rand = X(index,:);
%         y_rand = y(index);
num_iters= 100;
theta = rand(size(X,2),1);
lambda = 0.1;
alpha = 0.1;
for iter = 1:num_iters 

     for i = 1:m
        x = X_rand(i,:); % Select one example
        [J, gradJ] = lrCostFunction(theta, x, y_rand(i,:), lambda);
        theta = theta - alpha * gradJ;
        
     end
     Z = X_rand*theta;
     hypothesis = sigmoidFunction(Z); 
     predicts = hypothesis>= 0.5;
     
     acc = nnz(predicts-y_rand);
     acc = (1-acc/m) * 100;
     J_history(iter) = J;
     fprintf('Iteration #%d - Cost = %d - Acc=%f... \r\n',iter, J,acc);

end

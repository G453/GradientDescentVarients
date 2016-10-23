function Gx = poly_3_grad(X,a,b)
    Gx(:,1) = a* 2* X(:,1);
    Gx(:,2) = b* 2* X(:,2);
end
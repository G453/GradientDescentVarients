function Fx = ploy_3(X,a,b,c)
    Fx = sum(a*X(:,1).^2+b*X(:,2).^2+c,2);
end
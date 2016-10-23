function [fHist,xHist,itr_count] = SimpleSGD(a,b,c,xt0,l_rate, max_itr)
xHist=0;
fHist=0;
f_old =9^9;
itr = 1;
momentum = 0;
    while(itr <max_itr)
        xt1 = xt0 - l_rate * poly_2_grad(xt0,a,b)-0.9*momentum;
        momentum = xt1;
        xt0 = xt1;
        xHist(itr)= xt0;
        fHist(itr) = poly_2(xt0,a,b,c);
        if(fHist(itr)>f_old || abs(fHist(itr)-f_old)<0.0001)
            break;
        else
            f_old = fHist(itr);
        end
        itr = itr+1;
    end
    
    itr_count = itr-1;
end
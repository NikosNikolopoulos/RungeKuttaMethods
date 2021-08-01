function yprime = f(t,y)
% f.m
yprime = [ 0 1 ; 0 -0.2 ] * y + [ 0 0 ; -1 0 ] * sin(y); 
end


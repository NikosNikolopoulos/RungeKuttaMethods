function [tout, yout] = impeuler(FunFcn,t0,tfinal,step,y0)
% Costant Stepsize Improved Euler Method
% Initialization
t = t0;
y = y0(:);
tout = t;
yout = y.';
% The main loop
while abs(t- tfinal)> 1e-6 
   if t + step >= tfinal, step = tfinal - t;  end
   % Compute the slopes     
   s1 = feval(FunFcn, t, y); s1 = s1(:);
   s2 = feval(FunFcn,t+step, y+step*s1); s2 = s2(:);
   t = t + step;
   y = y + step*(s1 + s2)/2;
   tout = [tout; t];
   yout = [yout; y.'];
end;
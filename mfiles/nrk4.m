function [tout, yout] = nrk4(FunFcn,t0,tfinal,step,y0)
% Costant step size 5 step order 4 nrk4.m
% Initialization
ceta   =   [  1/3     1/3    1/2    1  ]'; 
alpha  = [ [  1/3      0      0     0     0  ]
           [  1/6     1/6     0     0     0  ]
           [  1/8      0     3/8    0     0  ]
           [  1/2      0    -3/2    1     0  ] ]';
beta   =   [  1/6      0      0    2/3   1/6 ]';
stages=5;
t = t0; y = y0(:);f = y*zeros(1,stages);tout = t;yout = y.';
% The main loop
while abs(t- tfinal)> 1e-6 
   if t + step > tfinal, step = tfinal - t; end
   % Compute the slopes     
   temp = feval(FunFcn,t,y);
   f(:,1) = temp(:);
   for j = 1:stages-1
     temp = feval(FunFcn, t+ceta(j)*step, y+step*f*alpha(:,j));
     f(:,j+1) = temp(:);
   end
   t = t + step;
   y = y + step*f*beta(:,1);
   tout = [tout; t];
   yout = [yout; y.'];
end;


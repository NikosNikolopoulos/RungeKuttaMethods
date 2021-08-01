function [tout, yout] = new(FunFcn,t0,tfinal,step,y0)
% new.m Costant step size
% Adams Bashforth (modified) 2 step Explicit Method 
% calls rk4 for 2 steps

% Initialisation:
% Notation: tolnew = tolerance of new method, tolnr = tolerance of 
% Newton Raphson method, maxiter = maximum iterations, told =
% differentiation delta value.
tolnew  = 1e-6;
tolnr   = 1e-9;
maxiter = 30;
told    = 1e-6;

stages = 2;

[tout,yout] = rk4(FunFcn,t0,t0+(stages-1)*step,step,y0);
tout = tout(1:stages);
yout = yout(1:stages);
% Assign t and y values to the final
% elements of tout and yout respectively.
t = tout(stages);
y = yout(stages).';

% The main loop
while abs(t - tfinal) > tolnew
   if t + step > tfinal, step = tfinal - t; end 
   
   % Definition of variables related with the N.R. estimation.
   yp0 = y;
   ypf = yp0;
   yp = inf;
   iter = 0;
   
   % Newton Raphson estimation.
   while(abs(yp - ypf) >= tolnr)&&(iter < maxiter)
       fyest = (feval(FunFcn,t+step,yp0+told) - feval(FunFcn,t+step,yp0))/told;
       yp    = yp0 - ( yp0 - yout(end-1) - step/3 * (feval(FunFcn,t+step,yp0) + 4 * feval(FunFcn,t,y) + feval(FunFcn,t-step,yout(end-1))) ) / (1-step/3 * fyest);
    % Reassign values.
       ypf  = yp0;
       yp0  = yp;
       iter = iter + 1;
   end;
   t = t + step;
   
   y = yp;
   tout = [tout; t];
   yout = [yout; y.'];
end;


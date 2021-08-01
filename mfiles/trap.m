function [tout, yout] = trap(FunFcn,t0,tfinal,step,y0)
% trap.m Implicit trapezium method for scalar systems
% It will not work with systems
% Initialization
tol=1e-9;
told=1e-6;
maxiter=30;
t = t0;
y = y0(:);
tout = t;
yout = y.';
% The main loop
while abs(t- tfinal)> 1e-6 
   if t + step > tfinal, step = tfinal - t; end
   % Compute the slopes     
   yp0=y;
   ypf=yp0;
   yp=inf;
   iter=0;
   while (abs(yp-ypf)>=tol)& (iter < maxiter)
       fyest=(feval(FunFcn,t+step,yp0+told)-feval(FunFcn,t+step,yp0))/told;
       yp=yp0-(yp0-y-step/2*(feval(FunFcn,t+step,yp0)+feval(FunFcn,t,y)))/(1-step/2*fyest);
       ypf=yp0;
       yp0=yp;
       iter=iter+1;
   end
   if iter == maxiter
       disp('Maximum number of iteration succeded');
       return;
   end
   t = t + step;
   y=yp;
   tout = [tout; t];
   yout = [yout; y.'];
end;


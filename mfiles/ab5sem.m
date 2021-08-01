function [tout, yout] = ab5sem(FunFcn,t0,tfinal,step,y0)
% ab5sem.m Costant Stepsize
% Adams Bashforth 5 step Explicit Method order 4
% calls rk4 for 4 steps
beta =  [251 -1274  2616 -2774  1901  ]/720;
stages=5;
[tout,yout]=rk4(FunFcn,t0,t0+(stages-1)*step,step,y0);
tout=tout(1:stages);
yout=yout(1:stages);
t = tout(stages);
y = yout(stages).';
% The main loop
while abs(t- tfinal)> 1e-6 
   if t + step > tfinal, step = tfinal - t; end 
   f=feval(FunFcn,tout(length(tout)-stages+1:length(tout)),yout(length(tout)-stages+1:length(tout)));
   y=y+step* beta*f; 
   t = t + step;
   tout = [tout; t];
   yout = [yout; y.'];
end;


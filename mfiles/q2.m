% Driver program q2.m (Question 2).
% Solve the problem g.m using the new.m method 
% use [0,pi/2] as an interval, for step size use h=0.1
% and as initial value use y(0)=-1.

% Initialise
t0     = 0;
tfinal = pi/2;
y0     = -1;
step   = 0.1;
% Solve
[tout,yout]=new('g',t0,tfinal,step,y0);
% Plot
plot(tout,yout,'+',tout,gtrue(tout),'-')
title('Question 2'),xlabel('t'),ylabel('y');

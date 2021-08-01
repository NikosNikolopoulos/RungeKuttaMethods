% Driver program q3b.m (Question 3 subquestion B).
% Solve the problem f.m using the impeuler.m method 
% use [0,3] as an interval, for step size use h=0.01 
% and as initial values use u(0)=pi/2 & v(0)=0.

% Initialise
t0=0;
tfinal=3;
y0=[0;pi/2];
step=0.01;
% Solve
[tout,yout]=impeuler('f',t0,tfinal,step,y0);
% Plot
plot(tout,yout,'-')
title('h=0.01'),xlabel('t'),ylabel('y');
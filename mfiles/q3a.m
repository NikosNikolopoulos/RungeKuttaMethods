% Driver program q3a.m (Question 3 subquestion A).
% Solve the problem f.m using the nrk4.m method 
% use [0,3] as an interval, for step size use h=0.1, 
% h=0.01 and h=0.00001 and as initial values use 
% u(0)=pi/2 & v(0)=0.

% Initialise
t0=0;
tfinal=3;
y0=[0;pi/2];
step1=0.1;
step2=0.01;
step3=0.00001;
% Solve
[tout1,yout1]=nrk4('f',t0,tfinal,step1,y0);
[tout2,yout2]=nrk4('f',t0,tfinal,step2,y0);
[tout3,yout3]=nrk4('f',t0,tfinal,step3,y0);
% Plot
subplot(3,1,1),plot(tout1,yout1,'*')
title('h=0.1'),xlabel('t'),ylabel('y');
subplot(3,1,2),plot(tout2,yout2,'*')
title('h=0.01'),xlabel('t'),ylabel('y');
subplot(3,1,3),plot(tout3,yout3,'*')
title('h=0.00001'),xlabel('t'),ylabel('y');
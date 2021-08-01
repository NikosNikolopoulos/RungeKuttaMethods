% Driver program q4.m (Question 4).
% Solve the problem g.m using the new.m method 
% use [0,pi/2] as an interval, for step size define variable 
% h accordingly and as initial value use y(0)=-1.

% Initialise
clc
t0     = 0;
tfinal = pi/2;
y0     = -1;
array = [];
% Input
k1 = input('Enter value k1:')
k2 = input('Enter value k2:')
ratios = zeros(k2-k1,1);
for k=k1:k2
    % Set step size.
    h = 1/(2^k);
    [tout,yout] = new('g',t0,tfinal,h,y0);
    error = (abs(yout-gtrue(tout)));
    l     = length(error);
    temp  = 0;
    % Find index of maximum element in error array.
    for i=1:l
        if error(i)>temp
            temp=error(i);
            index=i;
        end
    end
    % Append maximum element to array.
    array = [array,error(index)];
end
% Calculate ratios of consecutive maximum elements of array.
for i=1:length(array)-1
    ratios(i) = array(i+1)/array(i);
end
% Return approximately the order of new.m method.
output = -log2(array)
%**************************************************************************
%********** Solving 2nd order linear equ by range-kutta Method*************
%**************************************************************************
clear
clc
% Given Spring mass Damber System
% m(dx^2/dt^2) + c(dx/xt) + kx = 0
% in-order to solve this 2nd order equation numerically
% convert 2nd order to 2 first order equation
% dx/dt = y , m(dy/dt)+cy +kx = 0
% dy/dt = -(cy+kx)/m
Delt = 0.001; % time interval
Initial_disp = 0.25;
Initial_velocity = -1.5;
m=1;k=1.5;c=0.5;
X(1)= Initial_disp;
Y(1)=Initial_velocity;
i = 0;
%**************************************************************************
%****************Analytical solution***************************************
%**************************************************************************

%**************************************************************************
%***************4-point range Kutta method ********************************
%**************************************************************************

for time = Delt:Delt:50
    i = i +1;
   dv1 = Delt*(-(k*X(i))/m);
   dx1 = Delt*(Y(i));
   dv2 = Delt*(-(k*(X(i)+dx1/2))/m);
   dx2 = Delt*(Y(i)+dv1/2);
   dv3 = Delt*(-(k*(X(i) +dx2/2))/m);
   dx3 = Delt*(Y(i)+dv2/2);
   dv4 = Delt*(-(k*(X(i) + dx3))/m);
   dx4 = Delt*(Y(i)+dv3);
   
   dx = (dx1+2*dx2+2*dx3+dx4)/6;
   dv = (dv1+2*dv2+2*dv3+dv4)/6;
   X(i+1) = X(i)+dx;
   Y(i+1) = Y(i)+dv;
   t(i) = time;
   
end
 t(i+1) = time+Delt;
%**************************************************************************
%*****************plotting Displacement vs time****************************
%**************************************************************************
plot(t,X,'.b')
legend('numerical')
xlabel('Time')
ylabel('Displacement')

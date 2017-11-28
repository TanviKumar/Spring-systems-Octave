k1 = 1;                                           
k2 = 1;
l = 1000;
m = 1;
Y(1) = 250;
Vx(1) = 0;
X(1) = 25;
Vy(1) = 0;
dt = 0.05;
i = 1;
c = 1;
for t = 1:1500
  a= 4*( X(i)^2 + Y(i)^2);
  z1 = 0.5*sqrt((l^2)+4*(l*X(i))+ a);
  l1 = z1-l/2;
  z2 = 0.5*sqrt((l^2)-4*(l*X(i))+a);
  l2 = z2-l/2;
  b1= l/2 + X(i);
  b2 = l/2 - X(i);
  dvy1 = -(k1*l1*Y(i)/z1 + k2*l2*Y(i)/z2+c*Vy(i))*dt/m;
  dvx1 = -((k1*l1*b1/z1) - (k2*l2*b2/z2)+c*Vx(i))*dt/m;
  dx1 = Vx(i)*dt;
  dy1 = Vy(i)*dt;
  
  z1 = 0.5*sqrt((l^2)+4*(l*(X(i)+dx1/2))+ a);
  l1 = z1-l/2;
  z2 = 0.5*sqrt((l^2)-4*(l*(X(i)+dx1/2))+a);
  l2 = z2-l/2;
  b1= l/2 + X(i)+dx1/2;
  b2 = l/2 - X(i) - dx1/2;
  dvy2 = -(k1*l1*(Y(i)+dy1/2)/z1 + k2*l2*(Y(i)+dy1/2)/z2+c*(Vy(i)+dvy1/2))*dt/m;
  dvx2 = -((k1*l1*b1/z1) - (k2*l2*b2/z2)+c*(Vx(i)+dvx1/2))*dt/m;
  dx2 = (Vx(i)+dvx1/2)*dt;
  dy2 = (Vy(i)+dvy1/2)*dt;
  
   z1 = 0.5*sqrt((l^2)+4*(l*(X(i)+dx2/2))+ a);
  l1 = z1-l/2;
  z2 = 0.5*sqrt((l^2)-4*(l*(X(i)+dx2/2))+a);
  l2 = z2-l/2;
  b1= l/2 + X(i)+dx2/2;
  b2 = l/2 - X(i) - dx2/2;
  dvy3 = -(k1*l1*(Y(i)+dy2/2)/z1 + k2*l2*(Y(i)+dy2/2)/z2 + c*(Vy(i)+dvy2/2))*dt/m;
  
  dvx3 = -((k1*l1*b1/z1) - (k2*l2*b2/z2)+c*(Vx(i)+dvx2/2))*dt/m;
  dx3 = (Vx(i)+dvx2/2)*dt;
  dy3 = (Vy(i)+dvy2/2)*dt;
  
   z1 = 0.5*sqrt((l^2)+4*(l*(X(i)+dx3))+ a);
  l1 = z1-l/2;
  z2 = 0.5*sqrt((l^2)-4*(l*(X(i)+dx3))+a);
  l2 = z2-l/2;
  b1= l/2 + X(i)+dx3;
  b2 = l/2 - X(i) - dx3;
  dvy4 = -(k1*l1*(Y(i)+dy3)/z1 + k2*l2*(Y(i)+dy3)/z2+c*(Vy(i)+dvy3))*dt/m;
  
  dvx4 = -((k1*l1*b1/z1) - (k2*l2*b2/z2)+c*(Vx(i)+dvx3))*dt/m;
  dx4 = (Vx(i)+dvx3)*dt;
  dy4 = (Vy(i)+dvy3)*dt;
  
%  z = 0.5*sqrt((l^2)+4*((Y(i)+dy1/2)^2));
%  x = z-l/2;
%  dy2 = (V(i)+dv1/2)*dt;
%  dv2 = -((k1+k2)/m)*(x*(Y(i)+dy1/2)/z)*dt;
%  
%  z = 0.5*sqrt((l^2)+4*((Y(i)+dy2)^2));
%  x = z-l/2;
%  dy3 = (V(i)+dv2)*dt;
 % dv3 = -((k1+k2)/m)*(x*(Y(i)+dy2)/z)*dt;
  
  dy = (dy1+2*dy2+2*dy3+dy4)/6;
  dvx = (dvx1+2*dvx2+2*dvx3+dvx4)/6;
  dvy = (dvy1+2*dvy2+2*dvy3+dvy4)/6;
  dx= (dx1+2*dx2+2*dx3+dx4)/6;
  
  
  Y(i+1) = Y(i)+dy;
  X(i+1) = X(i)+dx;
  Vx(i+1) = Vx(i)+dvx;
  Vy(i+1) = Vy(i)+dvy;
 #V(i+1) = V(i) +dv
  
  
#  plot(X(i+1), Y(i+1));
  plot(Vy(i+1),Y(i+1));
  #plot(Y(i+1),t);
  hold on
  pause(0.001);
  i = i+1;
  
end

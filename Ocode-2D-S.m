k = 1;
l = 1;
m = 1;
Y(1) = -5;
V(1) = 0;
i = 1;
for t=1:200
  z = 0.5*sqrt((l^2)+4*(Y(i)^2));
  x = z-l/2;
  dy1 = V(i)*dt;
  dv1 = -(2*k/m)*(x*Y(i)/z)*dt;
  
  z = 0.5*sqrt((l^2)+4*((Y(i)+dy1/2)^2));
  x = z-l/2;
  dy2 = (V(i)+dv1/2)*dt;
  dv2 = -(2*k/m)*(x*(Y(i)+dy1/2)/z)*dt;
  
  z = 0.5*sqrt((l^2)+4*((Y(i)+dy2)^2));
  x = z-l/2;
  dy3 = (V(i)+dv2)*dt;
  dv3 = -(2*k/m)*(x*(Y(i)+dy2)/z)*dt;
  
  dy = (dy1+2*dy2+dy3)/4;
  dv = (dv1+2*dv2+dv3)/4;
  
  
  Y(i+1) = Y(i) +dy;
  V(i+1) = V(i) +dv;
  
  plot(t, Y(i+1));
  hold on
  i = i+1;
  
end

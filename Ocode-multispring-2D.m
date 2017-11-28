k =1;
l = 1;
number = 8;
dt = 0.01;
m=1;

for i =1:8
  Vx(1,i) = 0;
  Vy(1,i) = 0;
end
Vx(1,1)=0.1;
Vy(1,1)=0.1;
X(1,1) = 0;
Y(1,1) = 1;

X(1,2) = 0.5;
Y(1,2) = 0.5;

X(1,3) = 1;
Y(1,3) = 0;

X(1,4) = 0.5;
Y(1,4) = -0.5;

X(1,5) = 0;
Y(1,5) = -1;

X(1,6) = -0.5;
Y(1,6) = -0.5;

X(1,7) = -1;
Y(1,7) = 0;

X(1,8) = -0.5;
Y(1,8) = 0.5;


for t = 1:500
   for n=1
    z1 = (sqrt( (Y(t, n+1) - Y(t,n))^2 + (X(t, n+1) - X(t,n))^2));
    z2 = (sqrt( (Y(t, number) - Y(t,n))^2 + (X(t, number) - X(t,n))^2)); 
    a = atan((Y(t,n)-Y(t,n+1))/(X(t,n)-X(t,n+1)));
    b = atan((Y(t,n)-Y(t,number))/(X(t,n)-X(t,number)));
    
    if(a<0)
      a = pi + a;
    endif
    
%    if(b<0)
%      b = pi+b;
%    endif 
    
    Fx(t,n) = k*(-(1-l/z2)*(X(t,n)-X(t,number)) + (1-l/z1)*(X(t,n+1)-X(t,n)));
    Fy(t,n) = k*(-(1-l/z2)*(Y(t,n)-Y(t,number)) + (1-l/z1)*(Y(t,n+1)-Y(t,n)));
    
    dvx(n) = Fx(t,n)*dt/m;
    dvy(n) = Fy(t,n)*dt/m;
    dx(n) = Vx(t,n)*dt; 
    dy(n) = Vy(t,n)*dt;
    
    Vx(t+1,n) = Vx(t,n)+dvx(n);
    Vy(t+1,n) = Vy(t,n)+dvy(n);
    X(t+1,n) = X(t,n) + dx(n);
    Y(t+1,n) = Y(t,n) + dy(n);
    plot(X(t+1,n),Y(t+1,n));
    hold on
  end
  
  for n = 2:(number-1)
    z1 = (sqrt( (Y(t, n+1) - Y(t,n))^2 + (X(t, n+1) - X(t,n))^2));
    z2 = (sqrt( (Y(t, n-1) - Y(t,n))^2 + (X(t, n-1) - X(t,n))^2)); 
    a = atan((Y(t,n)-Y(t,n+1))/(X(t,n)-X(t,n+1)));
    b = atan((Y(t,n)-Y(t,n-1))/(X(t,n)-X(t,n-1)));
    if(a<0)
      a = pi + a;
    endif
    
%    if(b<0)
%      b = pi+b;
%    endif
%    
    
    Fx(t,n) = k*(-(1-l/z2)*(X(t,n)-X(t,n-1)) + (1-l/z1)*(X(t,n+1)-X(t,n)));
    Fy(t,n) = k*(-(1-l/z2)*(Y(t,n)-Y(t,n-1)) + (1-l/z1)*(Y(t,n+1)-Y(t,n)));
    dvx(n) = Fx(t,n)*dt/m;
    dvy(n) = Fy(t,n)*dt/m;
    dx(n) = Vx(t,n)*dt; 
    dy(n) = Vy(t,n)*dt;
    
    Vx(t+1,n) = Vx(t,n)+dvx(n);
    Vy(t+1,n) = Vy(t,n)+dvy(n);
    X(t+1,n) = X(t,n) + dx(n);
    Y(t+1,n) = Y(t,n) + dy(n);
    plot(X(t+1,n),Y(t+1,n));
    hold on
  end
  
  for n = number
    z1 = (sqrt( (Y(t, 1) - Y(t,n))^2 + (X(t, 1) - X(t,n))^2));
    z2 = (sqrt( (Y(t, n-1) - Y(t,n))^2 + (X(t, n-1) - X(t,n))^2)); 
    a = atan((Y(t,n)-Y(t,1))/(X(t,n)-X(t,1)));
    b = atan((Y(t,n)-Y(t,n-1))/(X(t,n)-X(t,n-1)));
    
    if(a<0)
      a = pi + a;
    endif
    
%    if(b<0)
%      b = pi+b;
%    endif
    
    
    Fx(t,n) = k*(-(1-l/z2)*(X(t,n)-X(t,n-1)) + (1-l/z1)*(X(t,1)-X(t,n)));
    Fy(t,n) = k*(-(1-l/z2)*(Y(t,n)-Y(t,n-1)) + (1-l/z1)*(Y(t,1)-Y(t,n)));
    
    dvx(n) = Fx(t,n)*dt/m;
    dvy(n) = Fy(t,n)*dt/m;
    dx(n) = Vx(t,n)*dt; 
    dy(n) = Vy(t,n)*dt;
    
    Vx(t+1,n) = Vx(t,n)+dvx(n);
    Vy(t+1,n) = Vy(t,n)+dvy(n);
    X(t+1,n) = X(t,n) + dx(n);
    Y(t+1,n) = Y(t,n) + dy(n);
    plot(X(t+1,n),Y(t+1,n));
    hold on
  end
  
  pause(0.001);
  hold off
end
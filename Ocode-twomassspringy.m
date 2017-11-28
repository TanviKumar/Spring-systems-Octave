dt = 0.1;
k1 = 1;
k2=1;
k3=1;

m1 = 1;
m2=1;

#c=0.1;

Vx(2)=0;
Vy(2) = 0;
X(1)=5;
Y(1) = 10;
X(2)=15;
Y(2)=20;
i=2;
#percent = 0.1;
#time_period = 2*3.14159265*sqrt(m/k)
  
  for t=2:100
    dx1 = Vx(i) * dt;
    dvx1 = -(k2*(Y(i)-Y(1))+(k1+k2)*(X(i)-X(1)))*dt/m;
    
    dy1 = Vy(i) * dt;
    dvy1 = -(k2*(X(i)-X(1))+(k3+k2)*(Y(i)-Y(1)))*dt/m;
      
    dx2 = (Vx(i)+dvx1/2)*dt;
    dvx2 = (-(k2*(Y(i)-Y(1)+dvy1)+(k1+k2)*(X(i)-X(1)+dx1/2)))*dt/m;
    
     dy2 = (Vy(i)+dvy1/2)*dt;
    dvy2 = (-(k2*(X(i)-X(1)+dvx1)+(k3+k2)*(Y(i)-Y(1)+dy1/2)))*dt/m;
  
    dx3 = (Vx(i)+dvx2)*dt;
    dvx3 = (-(k2*(Y(i)-Y(1)+dvy2)+(k2+k1)*(X(i)-X(1)+dx2)))*dt/m;
    
    dy3 = (Vy(i)+dvy2)*dt;
    dvy3 = (-(k2*(X(i)-X(1)+dvx2)+(k2+k3)*(Y(i)-Y(1)+dy2)))*dt/m;
   
   
    
    dx = (dx1+2*dx2 +dx3)/4;
    dvx = (dvx1+2*dvx2+dvx3)/4;
    
    dy = (dy1+2*dy2 + dy3)/4;
    dvy = (dvy1+2*dvy2 +dvy3)/4;
    
    
    X(i+1) = X(i) + dx;
    Vx(i+1) = Vx(i) + dvx;
    
    Y(i+1) = Y(i) + dy;
    Vy(i+1) = Vy(i) + dvy;
    
    plot(t,X(i+1));
    
    plot(t,Y(i+1), "g");
    hold on
    
    
    i= i +1;
  end
 
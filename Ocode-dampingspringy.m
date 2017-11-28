dt = 0.1;
k = 1;
m = 1;
c=0.1;

V(1)=0;
X(1)=10;
i=1;
percent = 0.1;
time_period = 2*3.14159265*sqrt(m/k)
  
  for t=2:200
    dx1 = V(i) * dt;
    dv1 = (-(c*V(i)+(k/m)*X(i))*dt);
    dx2 = (V(i)+dv1/2)*dt;
    dv2 = (-(c*(V(i)+dv1/2)+(k/m)*(X(i)+dx1/2)))*dt;
    dx3 = (V(i)+dv2)*dt;
    dv3 = (-(c*(V(i)+dv2)+(k/m)*(X(i)+dx2)))*dt;
    
    dx = (dx1+2*dx2+dx3)/4;
    dv = (dv1+2*dv2+dv3)/4;
    
    
    X(i+1) = X(i) + dx;
    V(i+1) = V(i) + dv;
    
    plot(t,X(i+1));
    pause(0.005);
    hold on
    
    
    i= i +1;
  end
 
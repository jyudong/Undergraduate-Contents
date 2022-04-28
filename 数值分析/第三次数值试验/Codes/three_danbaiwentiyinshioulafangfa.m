y=ones(1,1000);
theta=ones(1,1000);
h=0.02;
epslion=10^(-6);
y(1)=-1/2;theta(1)=pi/3;
for i=1:1000
    x=[];
    x(1)=1;
    for k=1:50000
        x(k+1)=theta(i)+h*y(i)-h*h*sin(x(k));
        if abs(x(k+1)-x(k))<epslion
            theta(i+1)=x(k+1);
            break;
        end
    end
    y(i+1)=y(i)-h*sin(theta(i+1));
end
t=[];
t(1)=0;
for i=1:1000
    t(i+1)=t(i)+1;
end
plot(t,theta)
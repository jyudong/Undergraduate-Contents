x=[];y=[];
h=0.02;
x(1)=3;y(1)=2;
for i=1:1000
    x(i+1)=x(i)+9/2*h*y(i);
    y(i+1)=y(i)-2*h*x(i);
end
plot(x,y)
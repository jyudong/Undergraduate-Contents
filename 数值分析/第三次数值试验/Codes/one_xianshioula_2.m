y=ones(1,51);
h=0.02;
y(1)=100;
for i=1:51
    y(i+1)=y(i)-50*h*y(i);
end
x=[];
for i=1:51
    x(i)=roundn(y(i),-4);
end
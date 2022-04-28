% f=1/(1+x^2/25);
% n=input("n=");
n=5;
s=1/n;
x=[];
f=[];
for i=1:n+1
    x(i)=0+(i-1)*s;
    f(i)=1/(1+25*(x(i)^2));
end
y=0:0.01:1;
L=0;
for k=1:n+1
    l=1;
    for i=1:n+1
        if (i~=k)
            l=l.*(y-x(i))./(x(k)-x(i));
        else
            l=l*1;
        end
    end
    L=L+f(k)*l;
end
z=1./(1+25*(y.*y));
plot(y,L)
hold on
plot(y,z)
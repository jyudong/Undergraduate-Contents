h=0.01;
N=1/h;
ep=1.0e-8;
x0=[];
for i=1:(N-1)^2
    x0(i,1)=0;
end
x=[];
for i=1:(N-1)^2
    x(i,1)=1;
end
%初始迭代矩阵.

f=[];
u0=[];
for j=1:N-1
    for i=1:N-1
        f((j-1).*(N-1)+i,1)=2.*pi.^2.*sin(i.*h.*pi).*sin(j.*h.*pi);
        u0((j-1).*(N-1)+i,1)=sin(i*h*pi)*sin(j*h*pi);
    end
end
b=h^2*f;
%计算出常数项f.

Lh=[];
for l=1:(N-1)^2
    for k=1:(N-1)^2
        if (l-k==1||k-l==1)
            Lh(l,k)=-1;
        elseif (l==k)
            Lh(l,k)=4;
        elseif (l-k==N-1||k-l==N-1)
            Lh(l,k)=-1;
        else
            Lh(i,j)=0;
        end
    end
end
for i=1:(N-1)^2
    Lh(i,i)=4;
end
for i=N:(N-1):(N-2).*N
    Lh(i,i-1)=0;
end
for i=(N-1):(N-1):(N-2).*N
    Lh(i,i+1)=0;
end
%以上计算出Lh.

for i=1:(N-1)^2
    for j=1:(N-1)^2
        if i==j
            D(i,j)=Lh(i,j);
        else
            D(i,j)=0;
        end
    end
end
L=zeros((N-1)^2,(N-1)^2);
U=zeros((N-1)^2,(N-1)^2);
for i=2:(N-1)^2
    for j=1:i-1
        L(i,j)=Lh(i,j);
    end
end
for j=2:(N-1)^2
    for i=1:j-1
        U(i,j)=Lh(i,j);
    end
end
B=-D\(L+U);
d=D\b;
num=0;
while max(abs(x-x0))>=ep
    x=x0;
    x0=B*x+d;
    num=num+1;
end
num
max(abs(x-x0))

            
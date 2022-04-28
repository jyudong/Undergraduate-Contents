% h=input('Please input h\n');输入n
h=0.05;
N=1/h;
ep=1.0e-8;%误差限
C=[];
for i=1:N-1
    for j=1:N-1
        if (i-j==1||j-i==1)
            C(i,j)=1;
        else
            C(i,j)=0;
        end
    end
end
%计算矩阵C.

Lh=[];
for l=1:(N-1)^2%
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
A=Lh;

f=[];
u0=[];
for j=1:N-1
    for i=1:N-1
        f((j-1).*(N-1)+i,1)=2.*pi.^2.*sin(i.*h.*pi).*sin(j.*h.*pi);
        u0((j-1).*(N-1)+i,1)=sin(i*h*pi)*sin(j*h*pi);
    end
end
b=h.^2.*f;
%计算出常数项f.

x0=[];
for i=1:(N-1)^2
    x0(i,1)=0;
end
%初始迭代矩阵.

x=[];
for i=1:(N-1)^2
       sum=0;
       for j=1:(N-1)^2
           if j~=i
               sum=sum+A(i,j)*x0(j);
           end
       end
       x(i,1)=(b(i,1)-sum)/A(i,i);
end
num=1;
while max(abs(x0-x))>=ep
    x0=x;
    for i=1:(N-1)^2
       sum=0;
       for j=1:(N-1)^2
           if j~=i
               sum=sum+A(i,j)*x0(j);
           end
       end
       x(i)=(b(i)-sum)/A(i,i);
    end
    num=num+1;
end
num
max(abs(x-u0))
% h=input('Please input h\n');����n
h=0.1;
N=1/h;
ep=1.0e-8;%�����
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
%�������C.

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
for i=N:(N-1):(N-2).*N
    Lh(i,i-1)=0;
end
for i=(N-1):(N-1):(N-2).*N
    Lh(i,i+1)=0;
end
Lh(9,9)=4;
%���ϼ����Lh.
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
%�����������f.

x0=[];
for i=1:(N-1)^2
    x0(i,1)=0;
end
%��ʼ��������.

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
while max(abs(x0-x))>=ep & k<=1000 
    x=x0;
    for i=1:(N-1)^2
       sum=0;
       for j=1:(N-1)^2
           if j~=i
               sum=sum+A(i,j)*x0(j);
           end
       end
       x0(i)=(b(i)-sum)/A(i,i);
    end
    k=k+1;
end
k
max(abs(x-u0))
clc;
clear all;
display('.......short circuit analysis.......');
display('................................................');
display('....................13G21A0246..................');
n=input('enter no.of buses in the power system:');
x=input('enter 1.impedence given between buses 2.admittance given between buses:');
y=zeros(n,n);
%reading power system line data
    for(i=1:n)
        for(j=1:n)
          if(j>=i)
            if(i==j)
                fprintf('Enter the self impedence of buse %d',i)
          y(i,j)=1/input(':');
            else if(x==1)
               fprintf('Enter the impedence value between buses %d-%d',i,j)
               Z=input(':');
                y(i,j)=1/Z;
                else
                 fprintf('Enter the admittance between buses %d-%d',i,j)
                y(i,j)=input(':');   
                end
            end
          else
              y(i,j)=y(j,i);
          end
          end
    end
    %ybus calculation
    Y=zeros(n,n);
for(i=1:n)
    for(j=1:n)
        if(i==j)
            %diagonals of ybus matrix
            for(k=1:n)
                  Y(i,i)=Y(i,i)+y(i,k);
            end
        else
          %off diagonal elements of ybus matrix
          Y(i,j)=-y(j,i);
        end
    end
end
%display y bus
  Y
  Z=zeros(n,n);
  Z=inv(Y)
  k=input('fault occured at bus');
  vpf=input('enter prefault voltage');
  zff=input('fault impedence');
  ifault=vpf/(Z(k,k)+zff)
for(i=1:n)
    fprintf('voltage at bus %d under fault ',i);
    v=vpf-(Z(i,k)*ifault)
    fprintf('/n');
end
    
clc
clear
S = imread('135320_allgrains.png');
[table, names] = xlsread('135320_allgrains_corrected', 1);
x = table(:, 2);
y = table(:, 3);
L=size(table,1);
W=cell(1,L);
K=cell(1,L);
a=zeros(1,L);
S2=zeros(size(S,1),size(S,2));
BW=cell(1,L);
IS=size(S,1);
JS=size(S,2);
for i=1:size(S,1)
    for j=1:size(S,2)
        if S2(i,j)==0
            S2(i,j)==1;
        else
            S2(i,j)==0;
        end
    end
end
m=10;
    S1=zeros(IS+m, JS+m);
    S1(1:IS+m,1:m/2)=0; %1
    S1(1:m/2,m/2+1:JS+m/2-1)=0; %2
    S1(1:IS+m, JS+m/2:JS+m)=0; %3
    S1(IS+m/2:IS+m, m/2+1:JS+m/2-1)=0; %4
    S1(m/2+1:IS+m/2, m/2+1:JS+m/2)=S2;
D = bwlabel(S1);                  
 for i=1:10
[I,J]=find(D==D(x(i)+m/2,y(i)+m/2));
B{i} = S1(min(I)-m/2:max(I)+m/2, min(J)-m/2:max(J)+m/2);
    if a(i)==0
        K{i}=B{i};
    else 
        K{i}=0;
    end
imshow(K{i});
figure
W{i}=sglazh(K{i});
imshow(W{i});
figure
BW{i}=granitsi(W{i});
LW(i)=kolvoedinits(BW{i});
SW(i)=kolvoedinits(W{i});
ff(i)=LW(i)*LW(i)/SW(i);
 end
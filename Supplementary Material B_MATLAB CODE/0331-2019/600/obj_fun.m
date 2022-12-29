function f = obj_fun(K)
%T =600;

concen=xlsread('p222.xlsx');%num
lengthyc=222;%num
tm =14;%time
t = 0:0.1:tm;
MW=1400;%MW
pro1 =4;%products num
pro2 =10;
pro3 =30;
pro = 60;

mwm = zeros(1,pro);
for i =1:pro
    mwm (i) = (pro+1 -i)*MW ;
end
mwmw= repmat(mwm,tm*10+1,1);
options = odeset('NonNegative',1:lengthyc);

k1=K(1);
k2=K(2);
k3=K(3);
k4=K(4);
k6=K(5);
k12=K(6);
k18=K(7);
k24=K(8);
k30=K(9);
k60=K(10);
k90=K(11);
k120=K(12);
k150=K(13);
k180=K(14);
[tt,yc]=ode15s(@for_dcdt,t,concen,options,k1,k2,k3,k4,k6,k12,k18,k24,k30,k60,k90,k120,k150,k180);

yp = yc (:,(lengthyc-pro+1):lengthyc);
ypd = yp.*mwmw;
y1 = ypd(:,(pro-pro1+1):pro);
y2 = ypd(:,(pro-pro2+1):(pro-pro1));
y3 = ypd(:,(pro-pro3+1):(pro-pro2));
y4 = ypd(:,1:(pro-pro3));

y1s=sum(y1,2);
y2s=sum(y2,2);
y3s=sum(y3,2);
y4s=sum(y4,2);

ye1=0.5214;
ye2=0.2784062;
ye3=0.0548396887;
ye4=0.00720587916;

f1=[abs(y1s(138)-ye1)/ye1*100;
    abs(y2s(138)-ye2)/ye2*200;
    abs(y3s(138)-ye3)/ye3;
    abs(y4s(138)-ye4)/ye4;
];
f2=[y1s(138);y2s(138);y3s(138);y4s(138);];

f = sum(f1);
format long;
disp('K');
disp(K);
disp('f');
disp(f);
disp('f1');
disp(f1);
disp('f2');
disp(f2);
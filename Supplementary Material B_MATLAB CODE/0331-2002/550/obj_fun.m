function f = obj_fun(K)
%T = 550;

concen=xlsread('p2302.xlsx');%num
lengthyc=2302;%num
tm =200;%time
t = 0:1:tm;
MW=14;%MW
pro =120;
mwm = zeros(1,pro);%products num
for i =1:pro
    mwm (i) = (pro+1 -i)*MW ;
end
mwmw= repmat(mwm,tm+1,1);
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
yps=sum(ypd,2);
yexp = [0.280163599;
0.642126789;
0.81390593;
0.889570552;
0.965235174;
0.977505112;
];
f1=[abs(yps(11)-yexp(1))/yexp(1);abs(yps(26)-yexp(2))/yexp(2);abs(yps(41)-yexp(3))/yexp(3);abs(yps(56)-yexp(4))/yexp(4);abs(yps(101)-yexp(5))/yexp(5);abs(yps(201)-yexp(6))/yexp(6)];
f = sum(f1);
format long;
disp('K');
disp(K);
disp('f');
disp(f);
disp('f1');
disp(f1);

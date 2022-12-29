function f = obj_fun(K)
%T = 500;
concen=xlsread('p2302.xlsx');%num
lengthyc=2302;%num
tm =1000;%time
t = 0:1:tm;
MW=14;%MW
pro =120;
mwm = zeros(1,pro);
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
yexp = [0.044989775;
0.096114519;
0.139059305;
0.194274029;
0.298568507;
0.353783231;
0.509202454;
0.742331288;
0.865030675;
];
f1=[abs(yps(16)-yexp(1))/yexp(1);abs(yps(31)-yexp(2))/yexp(2);abs(yps(46)-yexp(3))/yexp(3);abs(yps(61)-yexp(4))/yexp(4);abs(yps(81)-yexp(5))/yexp(5)*10;abs(yps(101)-yexp(6))/yexp(6)*5;abs(yps(176)-yexp(7))/yexp(7)*5;abs(yps(356)-yexp(8))/yexp(8)*20;abs(yps(536)-yexp(9))/yexp(9)*20];
f = sum(f1);
f2 =[yps(16);yps(31);yps(46);yps(61);yps(81);yps(101);yps(176);yps(356);yps(536); ];
format long;
disp('K');
disp(K);
disp('f');
disp(f);
disp('f1');
disp(f1);
disp('f2');
disp(f2);


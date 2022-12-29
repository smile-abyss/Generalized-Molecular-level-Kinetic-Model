function f = obj_fun(K)
%T =420;

concen=xlsread('p6342.xlsx');%num
lengthyc=6342;%num
tm =720;%time
t = 0:1:tm;
MW=0.7;%MW
pro1 =4;%products num
pro2 =20;
pro3=60;
pro=5500;

%[1e-6 1e-6 1e-6 1e-6 1e-6 1e-6 1e-6 1e-6 1e-6 1e-6 1e-6 1e-6 1e-6 1e-6 ]
%[1e-2 1e-2 1e-2 1e-2 1e-2 1e-2 1e-2 1e-2 1e-2 1e-2 1e-2 1e-2 1e-2 1e-2 ]

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
yg = ypd(:,(pro-pro1+1):pro);
yl = ypd(:,(pro-pro2+1):(pro-pro1));
yh = ypd(:,(pro-pro3+1):(pro-pro2));
yp1 = ypd(:,1:(pro-pro3));
ygs=sum(yg,2);
yls=sum(yl,2);
yhs=sum(yh,2);
yp1s=sum(yp1,2);

yep1 = [0.497252747;
0.326923077;
0.291208791;
0.178571429;
0.10989011;
0.112637363;
0.038461538;
0.008241758;
0.002747253;

];
yeh=[0.269230769;
0.288461538;
0.299450549;
0.046703297;
0.013736264;
0.010989011;
0.005494505;
0.002747253;
0.005494505;

];
yel=[0.214285714;
0.384615385;
0.409340659;
0.769230769;
0.82967033;
0.868131868;
0.93956044;
0.96978022;
0.961538462;

];
yeg=[0.016483516;
0.027472527;
0.024725275;
0.027472527;
0.032967033;
0.038461538;
0.052197802;
0.046703297;
0.054945055;

];

f1=[abs(ygs(21)-yeg(1))/yeg(1);abs(ygs(23)-yeg(2))/yeg(2);abs(ygs(36)-yeg(3))/yeg(3);abs(ygs(56)-yeg(4))/yeg(4);abs(ygs(71)-yeg(5))/yeg(5);
    abs(ygs(196)-yeg(6))/yeg(6);abs(ygs(366)-yeg(7))/yeg(7);abs(ygs(546)-yeg(8))/yeg(8);abs(ygs(721)-yeg(9))/yeg(9);
    abs(yls(21)-yel(1))/yel(1);abs(yls(23)-yel(2))/yel(2);abs(yls(36)-yel(3))/yel(3);abs(yls(56)-yel(4))/yel(4);abs(yls(71)-yel(5))/yel(5);
    abs(yls(196)-yel(6))/yel(6);abs(yls(366)-yel(7))/yel(7);abs(yls(546)-yel(8))/yel(8);abs(yls(721)-yel(9))/yel(9);
    abs(yhs(21)-yeh(1))/yeh(1);abs(yhs(23)-yeh(2))/yeh(2);abs(yhs(36)-yeh(3))/yeh(3);abs(yhs(56)-yeh(4))/yeh(4);abs(yhs(71)-yeh(5))/yeh(5);
    abs(yhs(196)-yeh(6))/yeh(6);abs(yhs(366)-yeh(7))/yeh(7);abs(yhs(546)-yeh(8))/yeh(8);abs(yhs(721)-yeh(9))/yeh(9);
    abs(yp1s(21)-yep1(1))/yep1(1);abs(yp1s(23)-yep1(2))/yep1(2);abs(yp1s(36)-yep1(3))/yep1(3);abs(yp1s(56)-yep1(4))/yep1(4);abs(yp1s(71)-yep1(5))/yep1(5);
    abs(yp1s(196)-yep1(6))/yep1(6);abs(yp1s(366)-yep1(7))/yep1(7);abs(yp1s(546)-yep1(8))/yep1(8);abs(yp1s(721)-yep1(9))/yep1(9);
];

f = sum(f1);
format long;
disp('K');
disp(K);
disp('f');
disp(f);
disp('f1');
disp(f1);

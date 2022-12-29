function f = obj_fun(K)
%T =470;

concen=xlsread('p6342.xlsx');%num
lengthyc=6342;%num
tm =290;%time
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

yep1 = [0.110995632;
0.071851412;
0.023722173;
0;
0;
0;
0;

];
yeh=[0.017907774;
0.005785662;
0;
0;
0;
0;
0;

];
yel=[0.849735622;
0.897678072;
0.948647458;
0.954528909;
0.945404996;
0.902333423;
0.883405494;
];
yeg=[0.029919729;
0.029809571;
0.038737116;
0.041620369;
0.044503621;
0.082517529;
0.096622476;
];

f1=[abs(ygs(16)-yeg(1))/yeg(1);abs(ygs(26)-yeg(2))/yeg(2);abs(ygs(36)-yeg(3))/yeg(3);abs(ygs(51)-yeg(4))/yeg(4);abs(ygs(66)-yeg(5))/yeg(5);
    abs(ygs(181)-yeg(6))/yeg(6);abs(ygs(291)-yeg(7))/yeg(7);
    abs(yls(16)-yel(1))/yel(1);abs(yls(26)-yel(2))/yel(2);abs(yls(36)-yel(3))/yel(3);abs(yls(51)-yel(4))/yel(4);abs(yls(66)-yel(5))/yel(5);
    abs(yls(181)-yel(6))/yel(6);abs(yls(291)-yel(7))/yel(7);
    abs(yhs(16)-yeh(1))/yeh(1);abs(yhs(26)-yeh(2))/yeh(2);abs(yhs(36)-yeh(3));abs(yhs(51)-yeh(4));abs(yhs(66)-yeh(5));
    abs(yhs(181)-yeh(6));abs(yhs(291)-yeh(7));
    abs(yp1s(16)-yep1(1))/yep1(1);abs(yp1s(26)-yep1(2))/yep1(2);abs(yp1s(36)-yep1(3))/yep1(3);abs(yp1s(51)-yep1(4));abs(yp1s(66)-yep1(5));
    abs(yp1s(181)-yep1(6));abs(yp1s(291)-yep1(7));
];

f = sum(f1);
format long;
disp('K');
disp(K);
disp('f');
disp(f);
disp('f1');
disp(f1);

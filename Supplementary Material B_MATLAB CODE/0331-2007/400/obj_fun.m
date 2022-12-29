function f = obj_fun(K)
%T =400;
concen=xlsread('p6342.xlsx');%num
lengthyc=6342;%num
tm =725;%time
t = 0:1:tm;
MW=0.7;%MW
pro1 =4;%products num
pro2 =20;
pro3=60;
pro=5500;

mwm = zeros(1,pro);
for i =1:pro
    mwm (i) = (pro+1 -i)*MW ;
end
mwmw= repmat(mwm,tm+1,1);
options = odeset('NonNegative',1:lengthyc);

%[1e-6 1e-6 1e-6 1e-6 1e-6 1e-6 1e-6 1e-6 1e-6 1e-6 1e-6 1e-6 1e-6 1e-6 ]
%[1e-2 1e-2 1e-2 1e-2 1e-2 1e-2 1e-2 1e-2 1e-2 1e-2 1e-2 1e-2 1e-2 1e-2 ]

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

yep1 = [0.591954023;
0.6695402299;
0.6436781609;
0.6695402299;
0.5804597701;
0.3649425287;
0.158045977;
0.1091954023;
0.09770114943;
];
yeh=[0.264367816;
0.212643678;
0.232758621;
0.232758621;
0.272988506;
0.175287356;
0.048850575;
0.017241379;
0.014367816;
];
yel=[0.140804598;
0.126436782;
0.126436782;
0.106321839;
0.149425287;
0.462643678;
0.784482759;
0.856321839;
0.876436782;
];
yeg=[0.025862069;
0.031609195;
0.031609195;
0.031609195;
0.031609195;
0.034482759;
0.037356322;
0.043103448;
0.040229885;
];

f1=[abs(ygs(16)-yeg(1))/yeg(1);abs(ygs(26)-yeg(2))/yeg(2);abs(ygs(41)-yeg(3))/yeg(3);abs(ygs(46)-yeg(4))/yeg(4);abs(ygs(71)-yeg(5))/yeg(5);
    abs(ygs(201)-yeg(6))/yeg(6);abs(ygs(376)-yeg(7))/yeg(7);abs(ygs(551)-yeg(8))/yeg(8);abs(ygs(726)-yeg(9))/yeg(9);
    abs(yls(16)-yel(1))/yel(1);abs(yls(26)-yel(2))/yel(2);abs(yls(41)-yel(3))/yel(3);abs(yls(46)-yel(4))/yel(4);abs(yls(71)-yel(5))/yel(5);
    abs(yls(201)-yel(6))/yel(6);abs(yls(376)-yel(7))/yel(7);abs(yls(551)-yel(8))/yel(8);abs(yls(726)-yel(9))/yel(9);
    abs(yhs(16)-yeh(1))/yeh(1);abs(yhs(26)-yeh(2))/yeh(2);abs(yhs(41)-yeh(3))/yeh(3);abs(yhs(46)-yeh(4))/yeh(4);abs(yhs(71)-yeh(5))/yeh(5);
    abs(yhs(201)-yeh(6))/yeh(6);abs(yhs(376)-yeh(7))/yeh(7);abs(yhs(551)-yeh(8))/yeh(8);abs(yhs(726)-yeh(9))/yeh(9);
    abs(yp1s(16)-yep1(1))/yep1(1);abs(yp1s(26)-yep1(2))/yep1(2);abs(yp1s(41)-yep1(3))/yep1(3);abs(yp1s(46)-yep1(4))/yep1(4);abs(yp1s(71)-yep1(5))/yep1(5);
    abs(yp1s(201)-yep1(6))/yep1(6);abs(yp1s(376)-yep1(7))/yep1(7);abs(yp1s(551)-yep1(8))/yep1(8);abs(yp1s(726)-yep1(9))/yep1(9);
];
f2=[ygs(16);ygs(26);ygs(41);ygs(46);ygs(71);ygs(201);ygs(376);ygs(551);ygs(726);yls(16);yls(26);yls(41);yls(46);yls(71);yls(201);yls(376);yls(551);yls(726);
    yhs(16);yhs(26);yhs(41);yhs(46);yhs(71);yhs(201);yhs(376);yhs(551);yhs(726);yp1s(16);yp1s(26);yp1s(41);yp1s(46);yp1s(71);yp1s(201);yp1s(376);yp1s(551);yp1s(726)
];
f = sum(f1);
format long;
disp('K');
disp(K);
disp('f');
disp(f);
disp('f1');
disp(f1);
disp(' f2');
disp(f2);
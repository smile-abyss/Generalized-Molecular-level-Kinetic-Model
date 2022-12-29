function f = obj_fun(K)
%T =550;

concen=xlsread('p222.xlsx');%num
lengthyc=222;%num
tm =21;%time
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

ye1 = [0.178;    0.2176;    0.2444;    0.2504;
];
ye2=[0.3700857633;	0.4485824531;	0.4933102253;	0.5012794613
];
ye3=[0.3165694683	0.2603006547	0.2010398614	0.1971717172
];
ye4=[0.1154716981	0.06867114797	0.02467937608	0.02006734007
];

f1=[abs(y1s(125)-ye1(1))/ye1(1);abs(y1s(140)-ye1(2))/ye1(2);abs(y1s(179)-ye1(3))/ye1(3);abs(y1s(205)-ye1(4))/ye1(4);
    abs(y2s(125)-ye2(1))/ye2(1);abs(y2s(140)-ye2(2))/ye2(2);abs(y2s(179)-ye2(3))/ye2(3);abs(y2s(205)-ye2(4))/ye2(4);
    abs(y3s(125)-ye3(1))/ye3(1);abs(y3s(140)-ye3(2))/ye3(2);abs(y3s(179)-ye3(3))/ye3(3);abs(y3s(205)-ye3(4))/ye3(4);
    abs(y4s(125)-ye4(1))/ye4(1);abs(y4s(140)-ye4(2))/ye4(2);abs(y4s(179)-ye4(3))/ye4(3);abs(y4s(205)-ye4(4))/ye4(4);
];

f2=[y1s(125);y1s(140);y1s(179);y1s(205);y2s(125);y2s(140);y2s(179);y2s(205);
    y3s(125);y3s(140);y3s(179);y3s(205);y4s(125);y4s(140);y4s(179);y4s(205);
    ];

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
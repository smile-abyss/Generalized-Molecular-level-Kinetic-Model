function dcdt = for_dcdt(t,y,k1,k2,k3,k4,k6,k12,k18,k24,k30,k60,k90,k120,k150,k180)

lengthy=length(y);

dcdt = zeros(lengthy,1);

for i =1:(lengthy-90)
    dcdt(i) = dcdt(i)-k1*y(i);
    dcdt(i+1) = dcdt(i+1)+k1*y(i);
    dcdt(lengthy) = dcdt(lengthy)+ k1*y(i);
end

for i =1:(lengthy-90)
    dcdt(i) = dcdt(i)-k2*y(i);
    dcdt(i+2) = dcdt(i+2)+k2*y(i);
    dcdt(lengthy-1) = dcdt(lengthy-1)+ k2*y(i);
end

for i =1:(lengthy-90)
    dcdt(i) = dcdt(i)-k3*y(i);
    dcdt(i+3) = dcdt(i+3)+k3*y(i);
    dcdt(lengthy-2) = dcdt(lengthy-2)+ k3*y(i);
end

for i =1:(lengthy-90)
    dcdt(i) = dcdt(i)-k4*y(i);
    dcdt(i+4) = dcdt(i+4)+k4*y(i);
    dcdt(lengthy-3) = dcdt(lengthy-3)+ k4*y(i);
end

for i =1:(lengthy-6)
    dcdt(i) = dcdt(i)-k6*y(i);
    dcdt(i+6) = dcdt(i+6)+k6*y(i);
    dcdt(lengthy-5) = dcdt(lengthy-5)+ k6*y(i);
end

for i =1:(lengthy-12)
    dcdt(i) = dcdt(i)-k12*y(i);
    dcdt(i+12) = dcdt(i+12)+k12*y(i);
    dcdt(lengthy-11) = dcdt(lengthy-11)+ k12*y(i);
end

for i =1:(lengthy-18)
    dcdt(i) = dcdt(i)-k18*y(i);
    dcdt(i+18) = dcdt(i+18)+k18*y(i);
    dcdt(lengthy-17) = dcdt(lengthy-17)+ k18*y(i);
end

for i =1:(lengthy-24)
    dcdt(i) = dcdt(i)-k24*y(i);
    dcdt(i+24) = dcdt(i+24)+k24*y(i);
    dcdt(lengthy-23) = dcdt(lengthy-23)+ k24*y(i);
end

for i =1:(lengthy-30)
    dcdt(i) = dcdt(i)-k30*y(i);
    dcdt(i+30) = dcdt(i+30)+k30*y(i);
    dcdt(lengthy-29) = dcdt(lengthy-29)+ k30*y(i);
end

for i =1:(lengthy-60)
    dcdt(i) = dcdt(i)-k60*y(i);
    dcdt(i+60) = dcdt(i+60)+k60*y(i);
    dcdt(lengthy-59) = dcdt(lengthy-59)+ k60*y(i);
end

for i =1:(lengthy-90)
    dcdt(i) = dcdt(i)-k90*y(i);
    dcdt(i+90) = dcdt(i+90)+k90*y(i);
    dcdt(lengthy-89) = dcdt(lengthy-89)+ k90*y(i);
end

for i =1:(lengthy-120)
    dcdt(i) = dcdt(i)-k120*y(i);
    dcdt(i+120) = dcdt(i+120)+k120*y(i);
    dcdt(lengthy-119) = dcdt(lengthy-119)+ k120*y(i);
end

for i =1:(lengthy-150)
    dcdt(i) = dcdt(i)-k150*y(i);
    dcdt(i+150) = dcdt(i+150)+k150*y(i);
    dcdt(lengthy-149) = dcdt(lengthy-149)+ k150*y(i);
end

for i =1:(lengthy-180)
    dcdt(i) = dcdt(i)-k180*y(i);
    dcdt(i+180) = dcdt(i+180)+k180*y(i);
    dcdt(lengthy-179) = dcdt(lengthy-179)+ k180*y(i);
end
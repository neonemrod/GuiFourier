function arm = calArm(coef,f,v,div,NumArm);
%Funci�n que calcula numericamente los arm�nicos para la funci�n
%Encabezado de Variables
[Fm Fn] = size(f); %Guarda el tama�o del vector de en la variables i y j
[Vm Vn] = size(v); %Guarda el tama�o del vector de en la variables m y n
T = v(Vn) - v(1); %calcula el periodo de la funci�n
dx=T/div;
x1 = v(1):dx:v(Vn); %Vectores num�ricos para el dominio
x0 = v(1)-T:dx:v(1);
x2 = v(Vn):dx:v(Vn)+T; 
x = [x0 x1 x2];
[Xfm Xfn] = size(x);

Amp=coef(1,:); %Coeficientes num�ricos de Fourier
a=coef(2,:);
b=coef(3,:);
arm(1,:)=x;
for i=2:NumArm+1
    
    arm(i,:) =  a(i-1)*cos(((i-1)*2*pi/(v(Vn)-v(1))*x))+b(i-1)*sin(((i-1)*2*pi/(v(Vn)-v(1))*x));
    %arm(i,:) = Amp(i-1)*cos(((i-1)*2*pi/(v(Vn)-v(1))*x)-(atan(b(i-1)/a(i-1)))); %Funci�n de Definici�n de Serie de Fourier
    %u=ones(1,Xfn);
    %funArm2 = funArm1+funArm2;
    %plot3(u*i,x,funArm1)
end    
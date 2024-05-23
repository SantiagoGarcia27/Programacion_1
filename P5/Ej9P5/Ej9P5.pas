program Ej9P5;

var Num,Desviacion,Sum,Contador,a,s : Real;


begin
    s := 0;
    a := 0;
    Contador:= 0;
    Num := 0;
    Sum := 0;
    Desviacion := 0;

    while Num >= 0 do
    begin 
     {writeLn(Num);}
    s := sqr(Num) + s;
    Sum := Sum + Num;    
    Contador := Contador + 1;
    read(Num);
    writeLn(Num);   
   end;
    {writeLn(Sum);}
    a := Sum/Contador;
    
    Desviacion := s/(Sum - sqr(a));

    write('La desviacion estandar es:',Desviacion);
end.
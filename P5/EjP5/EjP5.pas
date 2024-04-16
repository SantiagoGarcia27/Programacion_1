Program EjP5;

Const Centinela = -1;
Var conteo,imput,suma : integer;

begin
   suma := 0;
   conteo := 0;
    writeLn('Por favor ingrese los numeros');
    read(imput);
    while(imput <> Centinela) do
    begin    
         conteo := conteo + 1;
         suma := suma + imput;
         read(imput);
    end;

    writeLn('Suma:',suma);
    writeLn('Promedio:',Suma/conteo);
end.
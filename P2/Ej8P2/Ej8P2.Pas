program RandomNumber;

Var Imput,Cuadrado,Resto,Output: Integer;

begin
    read(Imput);
    Cuadrado := sqr(Imput);
    Resto := Cuadrado Mod 1000;
    Output := Resto DIV 10;

    WriteLn('Numero introducido = ',Imput);
    Writeln('Cuadrado del numero = ',Cuadrado );
    Writeln('Siguiente numero seudoaleatorio = ',Output);
end.
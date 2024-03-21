program ExpEjemplo;

var Imput, Exponential, SumFiveExponential : Real;

begin
    Read(Imput);
    Exponential := exp(Imput);
    SumFiveExponential := exp(Imput)-exp(5);

    writeLn('Valor introducido: x = ',Imput);
    writeLn('Suma de los cinco terminos = ',SumFiveExponential);
    writeLn('Valor de Exp (x) = ',Exponential);
end.
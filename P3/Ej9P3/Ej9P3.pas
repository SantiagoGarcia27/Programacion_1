Program FormatearMiles;

Var imput,Miles,Resto: integer;

begin
    readLn(imput);
    Miles := imput Div 1000;
    Resto := imput Mod 1000;

    WriteLn('Ingrese un n´umero decimal de a lo sumo 4 cifras: ',imput,' ',Miles,'.',Resto); 
end.
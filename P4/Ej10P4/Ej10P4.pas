Program Ej10P4;

Var n,i,resultado : integer;

begin
    write('Ingrese un valor para n:');
    readLn(n);
    resultado := 1;
    for i := n DownTo 1 do
    begin
        resultado := resultado * i;
    end;
    write('El factorial de ', n ,' es ',resultado)
end.
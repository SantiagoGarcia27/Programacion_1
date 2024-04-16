program Ej9P4;

Var x,n,resultado,i : integer;

begin
    write('Ingrese un valor para x:');
    readLn(x);
    write('Ingrese un valor para n:');
    readLn(n);
    resultado := 1;
    for i:= 1 to n do
    begin
        resultado := resultado * x;
    end;

    write('El resultado de ',x,' elevado a la ',n,' es:',resultado);
end.
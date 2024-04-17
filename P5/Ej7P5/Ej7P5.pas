Program Ej7P5;

var n,divisor : Integer;

begin
    write('Ingrese un entero positivo: ');
    readLn(n);
    divisor := 2;

    if (n = 1) or (n = 0) then
        write('No es primo')
    else
    begin
        while(divisor <> n) and (n MOD divisor = 0) do
        divisor := divisor + 1;
        if(divisor < n) then
            write('Es primo')
        else
            write('No es primo')     
    end;
    
end.
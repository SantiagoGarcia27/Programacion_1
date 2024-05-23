program a;

var k,N: integer;
    resultado : boolean; 

function esPotencia(k,N : integer) : boolean;
    var esPotenciaDeK : boolean;
        mult,i : integer;
begin  
    esPotenciaDeK := false;
    mult := 0;
    i := 0;

    if N = 1 then esPotenciaDeK := true;
    while (esPotenciaDeK = false) And (i < (N DIV 2)) do
    begin 
        for i := 1 to (N Div 2) do
        begin
            mult := i * k;
            writeLn(i, '|',(N DIV 2));
            if mult = N then
            esPotenciaDeK := true;
        end;
    end;
    esPotencia := esPotenciaDeK;
end;

begin
    k := 0;
    N := 0;
    read(k,N);
    resultado := esPotencia(k,N);
    write(resultado);
end.
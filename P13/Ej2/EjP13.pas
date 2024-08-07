const
    MAX = 10; {entero mayor estricto que 1}
    type
    ArregloEnteros = array [1..MAX] of integer;
    ListaEnteros = ^Celda;
    Celda = record
    elem : integer;
    sig : ListaEnteros;
end;

function unSoloMayor(v:integer; a:arregloEnteros):boolean;

var i,maximos : integer;

begin
    i := 1;
    maximos := 0;
    while (i <= MAX) and (maximos < 2) do
    begin
        if a[i] <= v then
            maximos := maximos + 1;
        i := i + 1;
    end;
    unSoloMayor := maximos = 1;
end;

function unSoloMayorOrdenado(v:integer; a:arregloEnteros):boolean;

begin
    unSoloMayorOrdenado := (A[MAX] > v) and (A[MAX-1] <= v);
end;

function unSoloMayor(v:integer; l:ListaEnteros):boolean;

var maximos : integer;
begin
  
    maximos := 0;
    while (l <> NIL) and (maximos < 2) do
    begin
        if l^.elem <= v then
            maximos := maximos + 1;
        l:= l^.sig;  
    end;
    unSoloMayor := maximos = 1;
end;

begin
    
end.
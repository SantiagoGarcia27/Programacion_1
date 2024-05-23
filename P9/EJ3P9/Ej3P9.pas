program Ej3P9;

const
N = 11; 
type
CadenaN = array [1..N] of integer;

function cantMayores(cadn:CadenaN; num:integer) : integer; {parte a}
var i,contador : integer;
begin
    contador := 0;
    for i := 1 to N do 
    begin
        if(cadn[i] > num) then 
        begin
        contador := contador + 1;
        end;
    end;
    cantMayores := contador;
end;

function ordenado(cadn:CadenaN) : boolean; {parte b}
var i : integer;
begin
    i:= 1;
    while (i < N) and (cadn[i+1] > cadn[i]) do
    begin
          i := i+1;       
    end;
    ordenado := i = N;

end;

procedure maxValorPos(cadn:CadenaN; VAR valor, pos:integer); {parte c}
var i,MaxValue : integer;
begin

    i:= 1;
    pos := 1;
    for i := 2 to N do
    begin
        if(cadn[i] > cadn[pos]) then pos := i;
    end;
    valor:= cadn[pos];
end;

var 
a,i,Max,Index : integer;
b : CadenaN;
begin
    i:= 0;
    write('Ingrese un valor para num:'); {parte a}
    read(a);
    
    for i:= 1 to N-1 do
        b[i] := i;
    b[11]:= 18;

    writeLn('Cantidad de valores mayores que ',a,':',cantMayores(b,a)); {parte a}
    writeLn('Valores de Ordenado:',ordenado(b)); {parte b}
    maxValorPos(b,Max,Index); {parte c}
    writeLn('Valor Maximo:',Max,' Index:',Index); {parte c}
end.
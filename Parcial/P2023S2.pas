program P2023S2;

const N = 4; (* entero mayor o igual que 3 *)
type ArregloNum = array [1..N] of Integer;

function AnteriorMasPosterior(a: ArregloNum) : Integer;
var i : Integer;
begin
    i := 2;
    while (i < N) and (a[i] <> a[i-1] + a[i+1]) do
        i := i + 1;

    if i < N then
        AnteriorMasPosterior := i;
    else
        AnteriorMasPosterior := 0;
end;

type
    TipoLista = ^TipoCelda;
    TipoCelda = record
        elemento: integer;
        siguiente: TipoLista;
end;

procedure ElimElemPos (var lista: TipoLista; pos: Integer);
var aux,anterior: TipoLista;
    i : integer;
begin
    aux := lista;

    i := 1;
    while (aux <> NIL) and (i <= pos) do
    begin
        i := i + 1;
        aux := aux^.siguiente;
        if(i = pos-1) then anterior := aux;
    end;
    anterior^.siguiente := aux^.siguiente;
    lista := anterior;
end;


begin

end.
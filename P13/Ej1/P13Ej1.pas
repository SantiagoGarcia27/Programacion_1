const
MAX = 10; {entero mayor estricto que 1}
type
    ArregloEnteros = array [1..MAX] of integer;
    ListaEnteros = ^Celda;
    Celda = record
    elem : integer;
    sig : ListaEnteros;
end;

function buscarElemento(e:integer; l:ListaEnteros):boolean;
var p : ListaEnteros;
begin
    p := l;
    while (p <> NIL) and (p^.elem <> e) do
        p := p^.sig;
    buscarElemento := p <> NIL;
end;

begin
    
end.
program Ej3P9;

const N = 6;

type
MatrizN = array[1..N] of Array[1..N] of integer;
ArregloUni = array[1..100] of integer;


function CalcularLargoUni(M : MatrizN) : integer;
var i,j,Contador : integer;
begin 
    i := 1;
    j := 1;
    Contador := 0;
    writeln(' ');
    for i:= 1 to N do
    begin
        for j := 1 to i do
        begin
            write('|',M[i,j],'|');
            Contador := Contador + 1;
        end;
        writeln(' ');
    end;
    writeLn('Contador:',Contador);
    CalcularLargoUni := Contador;
end;

procedure matriz2arreglo(a:MatrizN; VAR arreglo:ArregloUni);
var i,j,l : integer;
begin
    i:= 1;
    j:= 1;
    l:= 1;
    for i:= 1 to N do
    begin
        for j := 1 to i do
        begin
            arreglo[l] := a[i,j];
            l := l + 1;
        end;
    end;
end;

procedure arreglo2matriz(arreglo:ArregloUni; VAR a:MatrizN);
var l,m,index: integer;
begin
    i:= 1;;
    j:= 1;
    index := CalcularLargoUni(matriz);
    for i:= 1 to index do
    begin
        for j:= 1 to N do
        begin
            a[i,j] := ArregloUni;
        end;
    end;
end;


var matriz : MatrizN;
    arregloU: ArregloUni;
    l,m,index: integer;
begin
    l:= 1;
    m:= 1;
    for l:= 1 to N do
    begin
        for m := 1 to N do
        begin
            matriz[l,m] := sqr(l+m * 2) Div 2;
            write('|',matriz[l,m],'|');
        end;
        writeln(' ');
    end;
    l:= 1;
    m:= 1;

    index := CalcularLargoUni(matriz);
    matriz2arreglo(matriz,arregloU);
    for l :=1 to index do
        write('|',arregloU[l],'|');
end.
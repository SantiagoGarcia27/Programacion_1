Program tarea1;

const
    SEPARADOR   = ' ';   { caracter que separa palabras }
    FINALIZADOR = '.';   { caracter que determina fin de oración }

procedure leerPalabraLargo (var largo : integer; var fin : boolean);

var 
    letra : Char; { caracter que se está leyendo }
    espacio : Boolean; { guarda el momento en el que se encuentra el "SEPARADOR" }

begin

    fin := false;
    espacio := false;
    largo := 0;

    while not espacio do
    begin
        read(letra);
        if (letra = FINALIZADOR) then
        begin
            fin := true; 
            espacio := true;
        end
        else if (letra = SEPARADOR) then
            espacio := true 
        else
        begin
            largo := largo + 1; { aumenta el conteo del largo de la palabra }
        end;
    end;
end;

procedure ActualizarMayorOMenor(largo: integer; var masLarga, masCorta : integer);
begin
    if largo < masCorta then
        masCorta := largo;     
    if largo > masLarga then
        masLarga := largo;     
end;

procedure leerOracionDatos (var cantPalabras,masLarga, masCorta : integer);

var 
    largo : integer; 
    fin : boolean;

begin

    largo := 0;
    cantPalabras := 0;
    masLarga := 0;
    masCorta := Maxint;
    fin := false;

    while not fin do
    begin 
        leerPalabraLargo(largo,fin); 
        ActualizarMayorOMenor(largo,masLarga,masCorta); { Detecta si el largo es el mayor o el menor y actualiza esos valores }
        cantPalabras := cantPalabras + 1;
    end;
end;



var cantPal, masLarga, masCorta : integer;

begin
   write('Ingrese la oracion: ');
   leerOracionDatos(cantPal,masLarga,masCorta);
   writeLn('Tiene ', cantPal:0, ' palabras.');
   writeLn('La palabra mas larga tiene ', masLarga:0, ' letras.');
   writeLn('La palabra mas corta tiene ', masCorta:0, ' letras.');
end.

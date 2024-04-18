Program tarea1;

const
    SEPARADOR   = ' ';   { caracter que separa palabras }
    FINALIZADOR = '.';   { caracter que determina fin de oración }

procedure leerPalabraLargo (letra : Char; var largo : integer; var fin : boolean);
begin
    if (letra = SEPARADOR) or (letra = FINALIZADOR) then
    begin
        writeLn(letra);
        fin := true
    end
    else
        largo := largo + 1
end;

procedure leerOracionDatos (var cantPalabras,masLarga, masCorta : integer);

var letra : Char;  { caracter actual leeido }
    largo : integer; { largo de la palabra}
    fin : boolean;
    

begin
    largo := 0;
    cantPalabras := 0;
    masLarga := 0;
    masCorta := 0;
    fin := false;
    repeat
        write('a');
        if fin = false then
        begin
            read(letra);
            leerPalabraLargo(letra,largo,fin);  
            {writeLn(letra,'/',largo,'/',fin);}
             write('b');
        end
        else
        begin
            cantPalabras := cantPalabras + 1;
             write('c');
            if (masCorta = 0) or (largo < masCorta) then
            begin
                masCorta := largo;
                 write('d');
            end;
            if largo > masLarga then
            begin 
                masLarga := largo;
                 write('e');
            end;
            {writeLn('MasLargo:',masLarga,' | MasCorto:',masCorta,' | Largo:',largo);}
            fin := false;
            largo := 0;
             writeLn('f');
        end;
    until (letra = FINALIZADOR);
end;

var cantPal, masLarga, masCorta : integer;

begin
   write('Ingrese la oracion: ');
   leerOracionDatos(cantPal,masLarga,masCorta);
   writeLn('Tiene ', cantPal:0, ' palabras.');
   writeLn('La palabra mas larga tiene ', masLarga:0, ' letras.');
   writeLn('La palabra mas corta tiene ', masCorta:0, ' letras.');
end.

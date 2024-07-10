function todosTienenFormatoEnLinea ( tfmt : TipoFormato; ini, fin : RangoColumna ; ln : Linea ) : boolean; //1
{ Retorna true solo si todos los caracteres de `ln` entre las columnas `ini` y `fin`, 
  incluídos los extremos, tienen el formato `tfmt`. En otro caso retorna false. 

  Precondiciones: 1 <= ini <= ln.tope
                  1 <= fin <= ln.tope }
var i: integer; 
begin
    i := ini;
    while (i <= fin) and (ln.cars[i].fmt[tfmt]) do
    begin
        i := i + 1;
    end;
    todosTienenFormatoEnLinea := Not (i <= fin);
end;


procedure FormatearElemento( tfmt : TipoFormato; b : boolean; var c : Caracter);
begin
    c.fmt[tfmt] := b;
end;

procedure aplicarFormatoEnLinea ( tfmt : TipoFormato; ini, fin : RangoColumna ; var ln : Linea ); //2
{ Aplica el formato `tfmt` a los caracteres de `ln` entre las columnas `ini` y `fin`, 
  incluídos los extremos. 
  Si todos los carácteres ya tienen el tipo de formato `tfmt`, en lugar de aplicarlo 
  lo quita.

  Precondiciones: 1 <= ini <= ln.tope
                  1 <= fin <= ln.tope }
var i : integer;
    b : boolean;
begin
    i := ini;

    b := not todosTienenFormatoEnLinea(tfmt,ini,fin,ln);
    for i := ini to fin do
    begin
        FormatearElemento(tfmt, b, ln.cars[i]);
    end;
end;



function contarCaracteresEnTexto ( txt : Texto ) : integer; //3
{ Retorna la cantidad de caracteres que tiene el texto `txt` }

var i,j : integer;
begin
    i := 0;
    while (txt <> NIL) do
    begin
          for j:= 1 to txt^.info.tope do
          begin            
                i := i + 1;
          end;
          txt := txt^.sig; 
    end;
    contarCaracteresEnTexto := i; 
end;

function LineaContieneCadena (c : Cadena; ln : linea; desde : RangoColumna; var j : integer) : boolean;
Var i,l,pocicionInicial : integer;
begin
    l := 1;
    i:= desde;
    
    while (i <= ln.tope) And (l < c.tope) do
    begin
        if ln.cars[i].car = c.cars[l] then
        begin
            l := l + 1;

            if l = 2 then
            begin
                pocicionInicial := i;
            end;
        end
        else
        begin
            if(l > 1) then 
            begin
                l := 1;     
            end;
            pocicionInicial := 1;
        end;
        i := i + 1;
    end;
    j := pocicionInicial;
    
    LineaContieneCadena := l = c.tope;
end;


procedure buscarCadenaEnLineaDesde ( c : Cadena; ln : Linea; desde : RangoColumna ; var pc : PosibleColumna ); //4
{ Busca la primera ocurrencia de la cadena `c` en la línea `ln` a partir de la 
  columna `desde`. Si la encuentra, retorna en `pc` la columna en la que incia. 

  Precondiciones: 1 <= desde <= ln.tope }
Var j : integer;

begin
    j := 1;
    if (LineaContieneCadena(c,ln,desde,j)) AND (j >= 1) then
    begin  
       
        pc.esColumna := true;
        pc.col := j;
    end
    else 
    begin
        pc.esColumna := false;
    end;
end;



procedure buscarCadenaEnTextoDesde ( c : Cadena; txt : Texto; desde : Posicion; var pp : PosiblePosicion ); // 5
{ Busca la primera ocurrencia de la cadena `c` en el texto `txt` a partir de la 
  posición `desde`. Si la encuentra, retorna en `pp` la posición en la que incia. 
  La búsqueda no encuentra cadenas que ocupen más de una línea.

  Precondiciones: 1 <= desde.linea <= cantidad de líneas 
                  1 <= desde.columna <= tope de línea en desde.linea } 
 var 
    lineaActual :integer;
    pc : PosibleColumna;
begin
   
    lineaActual := 1;
    pc.esColumna := false;
    pp.esPosicion := false;

    while (txt <> NIL) And (pp.esPosicion = false) do 
    begin
        if lineaActual >= desde.linea then
        begin
            if lineaActual = desde.linea then 
                buscarCadenaEnLineaDesde (c, txt^.info, desde.columna,pc)
            else 
                buscarCadenaEnLineaDesde (c, txt^.info, 1,pc);


            if pc.esColumna = true then
            begin
                pp.esPosicion := true;
                pp.p.columna := pc.col;
                pp.p.linea := lineaActual;
            end
            else
            begin
                pp.esPosicion := false;
            end;
        end;

        txt := txt^.sig;
        lineaActual := lineaActual + 1;
    end;
end;

procedure guardarSobrante(c:cadena; columna:RangoColumna; ln : linea;var aux : linea);
var i : integer;
begin
     if (ln.tope + c.tope) > MAXCOL then
     begin
        aux.tope := (ln.tope + c.tope) - MAXCOL;

        for i:= 0 to aux.tope-1 do
        begin
            if(ln.tope - i > 0) then
            begin
                aux.Cars[aux.tope - i].car := ln.Cars[ln.tope - i].car;
                aux.Cars[aux.tope - i].fmt := ln.Cars[ln.tope - i].fmt;
            end;
        end;    
    end;
end;

procedure moverElementos(c:Cadena;columna :RangoColumna; var ln : Linea);
var i : integer;
    aux : Caracter;
begin
    if ln.tope + c.tope <= MAXCOL then
        ln.tope := ln.tope + c.tope
    else
        ln.tope := MAXCOL;  

        for i := ln.tope + c.tope Downto columna do //mueve todo 
        begin    

            if(i - c.tope > 0) and (i <= MAXCOL) then
            begin
            aux.car := ln.cars[i - c.tope].car;
            aux.fmt := ln.cars[i - c.tope].fmt;
            ln.cars[i] := aux;
         
            end;
        end;
    
end;

procedure RellenarCadena(c : cadena;columna : RangoColumna;formato : Formato; var ln: linea);
var i : integer;
begin
    for i := 1 to c.tope do // rellena con la cadena
    begin         
        ln.cars[columna + (i-1)].car := c.cars[i]; 
       
        ln.cars[columna + (i-1)].fmt := formato;   
    end;
    
end;

procedure insertarCadenaEnLinea ( c : Cadena; columna : RangoColumna; var ln : linea; var pln : PosibleLinea ); // 6
{ Inserta la cadena `c` a partir de la `columna` de `ln`, y desplaza hacia la derecha 
  a los restantes caracteres de la línea. Los carácteres insertados toman el formato 
  del carácter que ocupaba la posición `columna` en la línea. Si la columna es 
  `ln.tope+1`, entonces queda sin formato.
  Si (c.tope + lin.tope) supera `MAXCOL`, los carácteres sobrantes se retornan (en
  orden) en la posible línea `pln`.
 
  Precondiciones:  1 <= columna <= ln.tope+1
                   columna <= MAXCOL
                   c.tope + columna <= MAXCOL  }  
var 
    aux : linea;
    i : integer;
    formatoAux : Formato;

begin
    pln.esLinea := false;

    formatoAux[Neg] := false;
    formatoAux[Ita] := false;
    formatoAux[Sub] := false;

    if(columna-1 > 1) then formatoAux := ln.Cars[columna-1].fmt;
    for i := columna to ln.tope do
    begin

        with ln.Cars[i] do
        begin
            fmt[Neg] := false;
            fmt[Ita] := false;
            fmt[Sub] := false;
        end;
    end;
 
    if ln.tope + c.tope > MAXCOL then //Guardo los que salen de la linea
    begin
        
        aux.tope := c.tope;
        guardarSobrante(c,columna,ln,aux);
        pln.esLinea := True;
        ln.tope := MAXCOL;
        pln.l := aux;
    end;

    if(ln.tope > 0) then
    begin 
        moverElementos(c,columna,ln);

        for i := columna to ln.tope do
            ln.Cars[i].fmt := formatoAux;
    end
    else
    begin
        ln.tope := c.tope;
    end;

    RellenarCadena(c,columna,formatoAux,ln);
   
    
   
end;

procedure LineaACadena (Plantilla : Linea; Var Objetivo : Cadena);
var LargoCadena,i : integer;
begin
    i:=1;
    LargoCadena := 0;
    for i := 1 to Plantilla.tope do // rellena cadenaAIncertar
    begin  
        Objetivo.cars[i] := Plantilla.Cars[i].car;
        LargoCadena := LargoCadena + 1;
    end;
    Objetivo.tope := LargoCadena;
end;

procedure insertarLineaEnTexto ( ln : Linea; nln : integer; var txt : Texto ); //7
{ Inserta la línea `ln` en la posición `nlin` del texto `txt`.

  Precondiciones: 1 < nln <= cantidad de líneas del texto + 1
}

var
    NuevaLinea,AliasTexto: texto;
    pln : PosibleLinea;
    cadenaAIncertar : Cadena;

begin
    new (NuevaLinea);
    AliasTexto := txt;
    AliasTexto := ubicarLineaEnTexto(txt,nln-1);
    if(AliasTexto <> NIL) then
    begin
        if nln <> 1 then
        begin
            NuevaLinea^.sig := AliasTexto^.sig;
            AliasTexto^.sig := NuevaLinea;
        end
        else
        begin
            NuevaLinea^.sig := AliasTexto;
            txt := NuevaLinea;
        end;
    end
    else
        writeLn('No se encontró la línea');
   
    LineaACadena(ln,cadenaAIncertar);
    insertarCadenaEnLinea (cadenaAIncertar, 1, NuevaLinea^.info, pln);
end;


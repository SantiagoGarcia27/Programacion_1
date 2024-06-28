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


procedure aplicarFormatoEnLinea ( tfmt : TipoFormato; ini, fin : RangoColumna ; var ln : Linea ); //2
{ Aplica el formato `tfmt` a los caracteres de `ln` entre las columnas `ini` y `fin`, 
  incluídos los extremos. 
  Si todos los carácteres ya tienen el tipo de formato `tfmt`, en lugar de aplicarlo 
  lo quita.

  Precondiciones: 1 <= ini <= ln.tope
                  1 <= fin <= ln.tope }
var i : integer;
    
begin
    i := ini;
    if todosTienenFormatoEnLinea(tfmt,ini,fin,ln) then
    begin
        for i := ini to fin do
        begin
            ln.cars[i].fmt[tfmt] := false; 
            //writeLn(ln.cars[i].car,'|',ln.cars[i].fmt[tfmt],'|','[',ln.cars[i].fmt[Neg],',',ln.cars[i].fmt[Ita],',',ln.cars[i].fmt[Sub],']');
        end;
    end
    else
    begin
        for i := ini to fin do
        begin
            ln.cars[i].fmt[tfmt] := true;
        end;
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
    { for i := 1 to ln.tope do
         writeLn(ln.cars[i].car,'|', c.cars[l]);}
    i:= desde;
  
    //writeLn('test1');

   // writeln('ln.tope: ',ln.tope,'| c.tope: ',c.tope);



    while (i <= ln.tope) And (l < c.tope) do
    begin
        //writeLn(ln.cars[i].car,'|', c.cars[l]);
        if ln.cars[i].car = c.cars[l] then
        begin
          l := l + 1;

            if l = 2 then
                pocicionInicial := i;
            //write(l,'|');
          //write('si|');
        end
        else
        begin
          l := 1;
          pocicionInicial := 1;
         // write('no|');
        end;
        i:= i + 1;
    end;
    //write('|',l,'|', c.tope,'|');  
    j := pocicionInicial;
    LineaContieneCadena := l = c.tope;
end;


procedure buscarCadenaEnLineaDesde ( c : Cadena; ln : Linea; desde : RangoColumna ; var pc : PosibleColumna ); //4
{ Busca la primera ocurrencia de la cadena `c` en la línea `ln` a partir de la 
  columna `desde`. Si la encuentra, retorna en `pc` la columna en la que incia. 

  Precondiciones: 1 <= desde <= ln.tope }
Var j : integer;

begin
  //printLn('test0_');
    j := 1;
    if (LineaContieneCadena(c,ln,desde,j)) AND (j > 1) then
    begin  
       // writeLn('test1_');
       // writeLn(j - c.tope); 
        pc.esColumna := true;
        pc.col := j; //- c.tope;
    end
    else 
    begin
       // writeLn('test2_');
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
    pc : PosibleColumna;
    lineaActual,i : integer;
    posicionActual : Posicion;
    encontrado : boolean;
begin

    posicionActual.linea := 1;
    posicionActual.Columna := 1;
    encontrado := false;
    lineaActual := 1;
    buscarCadenaEnLineaDesde (c, txt^.info, desde.columna,pc);
    
    while ((txt <> NIL) And (encontrado = false)) DO
    begin
        for i:= 1 to c.tope do
        begin
            write(c.Cars[i]);
        end;
        writeLn('');
        for i:= 1 to txt^.info.tope do
        begin
            write(txt^.info.Cars[i].car);
        end;

        buscarCadenaEnLineaDesde (c, txt^.info, desde.columna,pc);
        //write('|',pc.esColumna ,'|');
        //writeLn(pc.esColumna,'|',pc.col);
       { for i:= 1 to txt^.info.tope do
        begin
            write(txt^.info.Cars[i].car);
        end;
        writeLn('');}
       // writeLn('-------------------------------------');
      
        if pc.esColumna = true then
        begin 
          {  for i:= 1 to txt^.info.tope do
            begin
                write(txt^.info.Cars[i].car);
            end;}
            //write('Si');
            posicionActual.linea := lineaActual;
            posicionActual.Columna := pc.col;
            pp.esPosicion := true;
            encontrado := true;
            pp.p := posicionActual;
        end
        else
        begin
        pp.esPosicion := false;
        txt := txt^.sig; 
        lineaActual := lineaActual + 1;
        end;
    end;

end;





procedure guardarSobrante(c:cadena; columna:RangoColumna; ln : linea;var aux : linea);
var fin,i : integer;
begin
    fin := ln.tope;
    if ln.tope + c.tope > MAXCOL then
    begin
        for i := fin-c.tope to fin do
        begin
            aux.Cars[aux.tope - (fin - i)].car := ln.Cars[i].car;  //guardar los que se salen del arreglo
            //writeLn('|',aux.Cars[aux.tope - (fin - i)].car,'|');
        end;    
    end;
    aux.tope := c.tope;
end;

procedure moverElementos(c:Cadena;columna :RangoColumna; var ln : Linea);
var i : integer;
begin
    if ln.tope + c.tope <= MAXCOL then
        ln.tope := ln.tope + c.tope
    else
        ln.tope := ln.tope + (MAXCOL - (ln.tope +  c.tope));  

    for i := ln.tope Downto columna do //mueve todo 
    begin    
        if (i - c.tope) > 0 then   
           // writeLn('1 | [Ultimo: ',ln.cars[i].car,'| Primero: ',ln.cars[i - 1].car,']  tope: ',ln.tope,'| i: [',i,'|',i-1,']');
            ln.cars[i].car := ln.cars[i - c.tope].car; 
            //writeLn(i,'.|',ln.cars[i].car,'|');
            //writeLn('2 | [',ln.cars[i].car,'|',ln.cars[i - (c.tope -2)].car,']');
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
begin
  //  writeLn('Tope Entrada:', ln.tope);
    if ln.tope + c.tope > MAXCOL then //Guardo los que salen de la linea
    begin
        guardarSobrante(c,columna,ln,aux);
        pln.esLinea := True;
        pln.l := aux;
    end;

    if(ln.tope > 0) then
    begin 
        moverElementos(c,columna,ln);
    end
    else
    begin
        ln.tope := c.tope;
    end;


   // writeLn('|', ln.tope,'|',c.tope,'|');
    //writeLn('Columna:',columna,'| Tope: ',c.tope); 
    for i := 1 to c.tope do // rellena con la cadena
    begin      
        //writeLn('Ln char:',ln.cars[columna + i].car,'| ln tope: ',ln.tope,'| c char: ',c.cars[inicio],'| c tope:',c.tope);
        //write('|',columna + i,',',i+1,'|');
        ln.cars[columna + (i-1)].car := c.cars[i];
        //writeLn(ln.cars[columna + i].car,'|',c.cars[inicio]);          
    end;
    // for i := 1 to ln.tope do
   // writeLn('Tope: ',ln.tope,'index: ',i,'|Letra: ', ln.cars[i].car);
    {if(ln.tope - c.tope > 0) then 
        ln.tope := ln.tope - c.tope;}
    

   { inicio := 1;
    for i := columna to c.tope do // rellena con la cadena
    begin
        writeLn(ln.cars[i].car,'|',c.cars[inicio],'| tope:',ln.tope);
        inicio := inicio + 1;
    end;}

    for i := 1 to ln.tope do
    begin
        with ln.Cars[i] do
        begin
            fmt[Neg] := false;
            fmt[Ita] := false;
            fmt[Sub] := false;
        end;
    end;
end;

procedure LineaACadena (Plantilla : Linea; Var Objetivo : Cadena);
var LargoCadena,i : integer;
begin
    i:=1;
    LargoCadena := 0;
    for i := 1 to Plantilla.tope do // rellena cadenaAIncertar
    begin 
        //write(ln.Cars[i].car);    
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
    //contador := 1;
   //TextoEntrada := txt;
    
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


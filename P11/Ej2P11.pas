program Ej2P11;

const
    MAXPERSONAS = 5; {valor entero mayor estricto a 0}
    MAXCAD = 26; {valor entero mayor estricto a 0}
type
    Cadena = record
        letras : array [1..MAXCAD] of char;
        largo : 0..MAXCAD;
    end;
    Fecha = record
        dia : 1..31;
        mes : 1..12;
        anio : 0..maxint;
    end;
    Persona = record
        nombre : Cadena;
        fechNac : Fecha;
        indMadre, indPadre : 0..MAXPERSONAS;
    end;
    Familia = record
        pers : array[1..MAXPERSONAS] of Persona;
        tope : 0..MAXPERSONAS;
    end;
    
    function cadenasIguales (cad1, cad2 : Cadena): Boolean;
    var i : integer;
    begin   
        i:= 1;  
        while(cad1.letras[i] = cad2.letras[i]) AND(i < cad1.largo) do
        begin
       // writeLn(i,'||', cad1.letras[i],'|',cad2.letras[i],'|',cad1.largo,'|',cad2.largo);
        i := i + 1;
        end;
       // writeLn(i,'||', cad1.largo,'|',i = cad1.largo);
        cadenasIguales := (i = cad1.largo);
    end;

    procedure desplegarCadena (cad: Cadena);
    var i : integer;
    begin
        //cad.largo := MAXCAD;
       // writeLn(cad.largo);
       writeLn(cad.largo);
        for i:= 1 to cad.largo do
        begin
            writeLn(cad.letras[i]);   
        end;
        writeLn(' ');
    end;

    procedure FillCadena(var cad : Cadena);
    var a:char;
        i:integer;
    begin
        cad.largo := MAXCAD;
        i:= 1;
        for a := 'A' to 'Z' do
        begin
        cad.letras[i]:= a;
       // write(cad.letras[i]);
        i:= i+1;
        end
    end;

    procedure FillPersonas(var familia : Familia);   
    begin 
        familia.pers[1].nombre.letras[1] := 'a';
        with familia do
        begin
            with pers[1] do
            begin
                nombre.letras[1] := 'a';
                nombre.largo := 1;
                with fechNac do
                begin
                    dia := 1;
                    mes := 1;
                    anio:= 1;
                end;
            end;
            with pers[2] do
            begin
                nombre.letras[1] := 'b';
                nombre.largo := 1;
                with fechNac do
                begin
                    dia := 2;
                    mes := 2;
                    anio:= 2;
                end;
            end;
            with pers[3] do
            begin
                nombre.letras[1] := 'a';
                nombre.letras[2] := 'b';
                nombre.largo := 2;
                with fechNac do
                begin
                    dia := 3;
                    mes := 3;
                    anio:= 3;
                end;
            end;
        end;
        //familia.pers[3].nombre.largo:= 2;
    
        //write(familia.pers[3].nombre.letras);
        
    end;

    procedure writeFamilyData(persona : Persona);
    begin
        write('Nombre: ');
        desplegarCadena(persona.nombre);
        writeLn(' Fecha de Nacimiento: ',persona.fechNac.dia,'/',persona.fechNac.mes,'/',persona.fechNac.anio);   
    end;

    procedure antepasados (usted : Cadena; historia : Familia);
    var i: integer;
        vos: Persona;
    begin
        i:= 1;
        while((Not cadenasIguales(historia.pers[i].nombre, usted)) and (i < historia.tope)) do
        begin
            i := i+1;
        end;
        if i < historia.tope then 
        begin
            vos := historia.pers[i];
            vos.nombre.largo:= usted.largo;
        end;


       { write('Nombre: ');
        desplegarCadena(historia.pers[i].nombre);
        writeLn(' Fecha de Nacimiento: ',historia.pers[i].dia,'/',historia.pers[i].mes,'/',historia.pers[i].anio);}
        write(vos.nombre.largo);
        desplegarCadena(vos.nombre);
        
        {writeFamilyData(vos);
        writeFamilyData(historia.pers[vos.indPadre]);
        writeFamilyData(historia.pers[vos.indMadre]);}
       // writeLn('Nombre paterno: ',desplegarCadena(historia.pers[historia.pers[i].indPadre].nombre),' Fecha de Nacimiento paterna: 'historia.pers[historia.pers[i].indPadre].fechNac);
       // writeLn('Nombre materno: ',desplegarCadena(historia.pers[historia.pers[i].indMadre].nombre),' Fecha de Nacimiento materna: 'historia.pers[historia.pers[i].indMadre].fechNac);
    end;
   
    var resultado : Boolean;
        cad1, cad2,nombre : Cadena;
        fam: Familia;
    begin
    {FillCadena(cad1);
    //writeLn(' ');
    FillCadena(cad2);
   // cad2.letras[5]:= 'l';
   // writeLn(' ');
    //desplegarCadena(cad2);
    resultado := false;
    resultado := cadenasIguales(cad1,cad2);}
    
    FillPersonas(fam);
    
    nombre.letras[1]:= 'a';
    nombre.letras[2]:= 'b';
    nombre.largo := 2;
    antepasados(nombre,fam);

   // writeLn(resultado);
    end.
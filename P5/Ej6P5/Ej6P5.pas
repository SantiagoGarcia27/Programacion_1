Program Ej6P5;

Const Centinela = '$';

Var char1,char2: char;

begin
    char2 := 0;
    write('Ingrese un texto: ');
    read(char1);
    writeLn('');
    write('Las consonantes y vocales duplicadas son: ');
    while(char1 <> Centinela) do
    begin
        if char1 = char2 then
        begin
            write(char1,char2,' ');
        end;
        char2 := char1;
        read(char1);
    end;
end.
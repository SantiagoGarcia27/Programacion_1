Program Ej7E4;

var n,num1,a,i : integer;

begin
    write('Ingrese un valor para n: ');
    read(n);
    write('Ingrese ',n,' enteros positivos: ');

    if n > 60 then
        n := 60;

    for a:=1 to n do
    begin
        if a > 1 then
        write('Ingrese ',n-1,' enteros positivos: ');
        read(num1);
        for i:= 1 to num1 do
        begin
            write('*');
        end;
        writeLn('');
    end;

end.
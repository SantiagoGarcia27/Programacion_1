program Ej8P4;

Var 
n,i,e : integer;
c : char;

begin
    write('Ingrese un caracter c:');
    readLn(c);
    write('Ingrese un valor para n:');
    readLn(n);

    for i := n DownTo 1 do
    begin
        for e := i DownTo 1 do
        begin
            write(c);   
        end;
        writeLn('');
    end;
end.
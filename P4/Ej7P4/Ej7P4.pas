Program Ej7E4;

var n,num1,num2,num3,num4,num5,a,i : integer;

begin
    write('Ingrese un valor para n: ');
    read(n);
    write('Ingrese ',n,' enteros positivos: ');

    if n > 60 then
        n := 60

    
    read(num1,num2,num3,num4,num5);
    for a:= 1 to num1 do
        write('*');

    for a:= 1 to num2 do
        write('*');

    for a:= 1 to num3 do
        write('*');

    for a:= 1 to num4 do
        write('*');

    for a:= 1 to num5 do
        write('*');
end.
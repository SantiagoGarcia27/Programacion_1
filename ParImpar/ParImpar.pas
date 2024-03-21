program ParImpar;

var num: real;

begin
    read (num);

    if num Mod 2 = 0 then
        Write('Numero par')
        else
        begin
             Write('Numero impar')
        end;
end;
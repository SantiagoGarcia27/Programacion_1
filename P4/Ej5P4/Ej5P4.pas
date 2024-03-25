program EJ5P4;

var n,i : integer;

begin
    write('n = ');
    read(n);

    for i := 1 to n do
    begin
        if ((n mod i) = 0) then
            write(i,' ') 
    end;   
end.
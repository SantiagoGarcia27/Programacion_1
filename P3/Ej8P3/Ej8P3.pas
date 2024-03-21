program Ej8P3;
var k,r,s,t : integer;

begin  
 
    case k of
        0: r := r + 1;
        1: s := s + 1
        2: t := t + 2;
        3: t := t + 2;
        4: t := t + 2;
    end;
   { if k = 0 then
        r := r + 1
    else
        if k = 1 then
        s := s + 1
    else
        if (k = 2) or (k = 3) or (k = 4) then
            t := t + 2}



    case k of
        A: writeln ('Trabajo excelente.');
        B: writeln ('Buen trabajo.');
        C: writeln ('Buen trabajo.');
        D: writeln ('Trabajo deficiente.');
        F: writeln ('Trabajo deficiente.');
    end;

    {if (calif = 'D') or (calif = 'F') then
        writeln ('Trabajo deficiente.')
    else
        if (calif = 'C') or (calif = 'B') then
            writeln ('Buen trabajo.')
        else
    if calif = 'A' then
        writeln ('Trabajo excelente.')}

end.
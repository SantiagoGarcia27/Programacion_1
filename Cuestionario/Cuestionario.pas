program ejemplo;

var x,y,z : integer;
    procedure de(x: integer; var z: integer);
    begin
        x := x + y - z;
        z := x - 1
    end;
    function muy(x, y : integer) : integer;
    var z : integer;
        function mal(x : integer) : integer;
        begin
            x := x - z;
            mal := x
        end;
    begin
        z := x + y;
        y := mal(y);
        write(y);
        muy := x
    end;
    procedure programa(var x : integer; y : integer);
    begin
        y := y + muy(x,z);
        de(y,x);
        write(y)
    end;
begin
    x := 2;
    y := x + 1;
    z := x - 1;
    programa(z, x);
    write(z);
    write(x)
end.
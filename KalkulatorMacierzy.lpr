program KalkulatorMacierzy;

uses CRT, ListaPodwojnieWiazana;

//Funkcja wypisujaca liste macierzy
function wypiszListeM(glowa : ElementP) : integer;
var kolejny : ElementP;
begin
  //Zaczynamy od elementu, ktory jest zaraz po elemencie bedacym glowa
  kolejny := glowa^.Nast;

  while kolejny <> NIL do
  begin
    Writeln('Nr: ', kolejny^.Nr, '  Wymiary: ', kolejny^.Dane^.M, ' x ', kolejny^.Dane^.N);
    kolejny := kolejny^.Nast;
  end;
end;

//Funkcja wypisujaca macierz
//Zmienna 'macierz' wskazuje poczatkowo na element w liscie od ktorego mamy zaczac poszukiwania wlasciwej macierzy
function wypiszM(macierz : ElementP) : integer;
var nr, i, j : integer;
begin
  Write('Podaj nr macierzy, ktora chcesz wypisac: '); Readln(nr);
  macierz := szukaj(macierz, nr);
  //Wypisujemy macierz:
  for i := 0 to macierz^.Dane^.M - 1 do
  begin
    for j := 0 to macierz^.Dane^.N - 1 do write(macierz^.Dane^.Macierz[i][j],' ');
    Writeln;
  end;

  wypiszM := 1;
end;

//Funkcja dodajaca macierz do listy
function dodajMdoListy(po : ElementP) : ElementP;
var m, n, nr, i, j : integer; nowaMacierz : ElementP;
begin
  //Uzytkownik podaje potrzebne dane macierzy:
  Write('Podaj wymiar m = '); Readln(m);
  Write('Podaj wymiar n = '); Readln(n);
  Write('Podaj nr macierzy: '); Readln(nr);

  //Dodajemy macierz do listy:
  nowaMacierz := dodaj(po, NIL, nr);
  nowaMacierz^.Dane^.M := m;
  nowaMacierz^.Dane^.N := n;


  //Tworzymy tablicę wskaźników:
  SetLength(nowaMacierz^.Dane^.Macierz,m);

  //Tworzymy kolejne tablice wierszy:
  for i := 0 to m - 1 do SetLength(nowaMacierz^.Dane^.Macierz[i],n);

  //Wypelniamy nowo utorzona macierz danymi:
  for i := 0 to m - 1 do
    for j := 0 to n - 1 do nowaMacierz^.Dane^.Macierz[i][j] := (i + j) mod 2;

  nowaMacierz^.Dane^.CzyZainicjalizowana := 1;

  //Zwracamy wskaznik do elementu listy:
  dodajMdoListy := nowaMacierz;
end;

//Funkcja dodajaca dwie macierze:
function dodajM(glowa : ElementP) : integer;
var nr1, nr2, i, j : integer;
begin
  wypiszListeM(glowa);
  Write('Podaj nr pierwszej macierzy, ktora chcesz dodac: '); Readln(nr1);
  //macierz := szukaj(macierz, nr);
  Write('Podaj nr drugiej macierzy, ktora chcesz dodac: '); Readln(nr2);
  //macierz := szukaj(macierz, nr);
end;

//Funkcja mnozaca macierz przez skalar

//Funkcja transponujaca macierz

//Funkcja obliczajaca wyznacznik macierzy

//Funkcja potegujaca macierz

//Funkcja pobierajaca macierz z pliku

var
  //Zmienna przechowujaca decyzje uzytkownika, o tym, co zrobic:
  coZrobic : integer;
  //Glowa listy:
  glowa : ElementP;

begin
  new(glowa);
  glowa^.Nr := 0;
  glowa^.Pop:= NIL;
  glowa^.Nast := NIL;
  //poczatek := glowa;

  //Poczatkowa inicjalizacja zmiennej coZrobic:
  coZrobic := 1;

  //Glowna petla sterujaca:
  while coZrobic <> 0 do
  begin
    Writeln('Co chcesz zrobic 1-dodaj element; 2-wypisz elementy; 3-dodaj macierze; 4-dodaj elemnt po; 0-koniec;');
    Readln(coZrobic);

    case (coZrobic) of
    1: dodajMdoListy(glowa);
    2: wypiszM(glowa);
    3: dodajM(glowa);
    //4: dodaj(szukaj(poczatek, 0), NIL, 0);}
    end;
  end;
end.

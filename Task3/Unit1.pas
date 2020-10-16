unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, StdCtrls, Menus;

type
  TForm1 = class(TForm)
    MainMenu1: TMainMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N4: TMenuItem;
    N5: TMenuItem;
    StringGrid1: TStringGrid;
    N6: TMenuItem;
    N7: TMenuItem;
    Label1: TLabel;
    Label2: TLabel;
    Button1: TButton;
    Edit1: TEdit;
    Edit2: TEdit;
    OpenDialog1: TOpenDialog;
    Label3: TLabel;
    Label4: TLabel;
    procedure Edit1KeyPress(Sender: TObject; var Key: Char);
    procedure Button1Click(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure StringGrid1KeyPress(Sender: TObject; var Key: Char);
    procedure getArrayFromTable();
    procedure N6Click(Sender: TObject);
    procedure N7Click(Sender: TObject);
    procedure N4Click(Sender: TObject);
    procedure N5Click(Sender: TObject);

  private

  public
    arrMatrix  : Array of Array of Integer;
  end;

var
  Form1: TForm1;

implementation

uses Math;

{$R *.dfm}
procedure TForm1.Edit1KeyPress(Sender: TObject; var Key: Char);
const Digit: set of Char=['1'..'9', '0'];
begin
with (Sender as TEdit) do
  begin
       if (not(Key in Digit))
       then Key:=#0;
  end;
end;

//создание новой таблицы
procedure TForm1.Button1Click(Sender: TObject);
var i:Integer;
begin
if(Edit1.GetTextLen>0) AND(Edit2.GetTextLen>0) then
with StringGrid1 do
  for i:=0 to ColCount-1 do
    Cols[i].Clear;
StringGrid1.RowCount:=StrToInt(Edit1.Text);
StringGrid1.ColCount:=StrToInt(Edit2.Text);
end;
// формат файла: каждое число должно идти с новой строки
// сперва количество столбцов, затем количество строк
// и далее 1 строка 1 столбец, 1 строка 2 столбец и тд
procedure TForm1.N1Click(Sender: TObject);
var
  f:textfile;
  temp, x, y: integer;
  tempstr: string;
begin
If OpenDialog1.Execute then
  begin
    assignfile(f, OpenDialog1.FileName);
    reset(f);
    readln(f, temp);
    stringgrid1.colcount := temp;
    readln(f, temp);
    stringgrid1.rowcount := temp;


    for X := 0 to stringgrid1.colcount - 1 do
      for y := 0 to stringgrid1.rowcount - 1 do
      begin
        readln(F, tempstr);
        stringgrid1.cells[x, y] := tempstr;
      end;
     closefile(f);
  end;
end;



procedure TForm1.StringGrid1KeyPress(Sender: TObject; var Key: Char);
  const Digit: set of Char=['1'..'9', '0','-'];
  begin
     if (not(Key in Digit)) then Key:=#0;
  end;
//
procedure TForm1.getArrayFromTable();
var
  temp, x, y: integer;
begin
    SetLength(arrMatrix, stringgrid1.rowcount);
    for x := 0 to stringgrid1.rowcount - 1 do
    SetLength(arrMatrix[x],stringgrid1.colcount);

    for x := 0 to stringgrid1.colcount - 1 do
      for y := 0 to stringgrid1.rowcount - 1 do
      begin
        if(Length(stringgrid1.cells[x, y])>0) then
          begin
           temp:=strToInt(stringgrid1.cells[x, y]);
           end
        else
          begin
              temp:=0;
          end;

        arrMatrix[x, y] := temp;
      end;
end;
// поиск в ориентированном
procedure TForm1.N6Click(Sender: TObject);
var
  countOrientReb,i,j,temp:Integer;
  ArrayLengthRow, ArrayLengthCol: Integer;
  myArr:Array of Array of Integer;
begin
  countOrientReb:=0;

  getArrayFromTable();
  ArrayLengthRow := Length(arrMatrix);
  ArrayLengthCol := Length(arrMatrix[0]);

  for i:=0 to ArrayLengthRow do
    for j:=0 to ArrayLengthCol do
    begin
    temp:=0;
      if(Length(stringgrid1.cells[i, j])>0) then
         temp:=strToInt(stringgrid1.cells[i, j]);

      countOrientReb:=countOrientReb+temp;
    end;
  Label4.Caption:=IntToStr(countOrientReb);
end;


// поиск в неориентированном
procedure TForm1.N7Click(Sender: TObject);
var
  countOrientReb,i,j,temp:Integer;
  ArrayLengthRow, ArrayLengthCol: Integer;
begin
  countOrientReb:=0;

  getArrayFromTable();
  ArrayLengthRow := Length(arrMatrix);
  ArrayLengthCol := Length(arrMatrix[0]);

  for i:=0 to ArrayLengthRow do
    for j:=0 to ArrayLengthCol do
    begin
    temp:=0;
      if(Length(stringgrid1.cells[i, j])>0) then
         temp:=strToInt(stringgrid1.cells[i, j]);

      countOrientReb:=countOrientReb+temp;
    end;
          countOrientReb:=countOrientReb div 2;
  Label4.Caption:=IntToStr(countOrientReb);
end;



procedure TForm1.N4Click(Sender: TObject);
var i:Integer;
begin
with StringGrid1 do
  for i:=0 to ColCount-1 do
    Cols[i].Clear;
end;

procedure TForm1.N5Click(Sender: TObject);
begin
Application.Terminate;
end;

end.

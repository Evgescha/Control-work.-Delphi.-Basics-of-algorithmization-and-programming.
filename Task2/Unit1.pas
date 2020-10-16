unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, StdCtrls;

type
  TForm1 = class(TForm)

    Label1: TLabel;
    Edit1: TEdit;
    Button1: TButton;
    MainMenu1: TMainMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    Edit2: TEdit;
    Button2: TButton;
    Button3: TButton;
    procedure FormCreate(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Edit1KeyPress(Sender: TObject; var Key: Char);
    procedure Button3Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);

  private
    startX, startY, newX, newY:Integer;

  public
    procedure Relocate();
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.FormCreate(Sender: TObject);
begin
startX:=Button2.Left;
startY:=Button2.Top;
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
if(Edit1.GetTextLen>0) AND (Edit2.GetTextLen>0) then
  begin
    newX:=StrToInt(Edit1.Text);
    newY:=StrToInt(Edit2.Text);
    Relocate();
  end;
end;


procedure TForm1.Edit1KeyPress(Sender: TObject; var Key: Char);
  const Digit: set of Char=['1'..'9', '0'];
  begin
  with (Sender as TEdit) do
    begin
     if (not(Key in Digit))
     then Key:=#0;
  end;
end;

procedure TForm1.Relocate();
begin
Button2.Top:=newY;
Button2.Left:=newX;
end;


procedure TForm1.Button3Click(Sender: TObject);
begin
Application.Terminate;
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
Edit1.Text:='';
Edit2.Text:='';
newX:=startX;
newY:=startY;
Relocate();
end;


end.

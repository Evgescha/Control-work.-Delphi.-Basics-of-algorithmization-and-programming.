unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Menus;

type
    TForm1 = class(TForm)
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    Edit1: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Edit2: TEdit;
    Edit3: TEdit;
    Button1: TButton;
    Label4: TLabel;
    Label5: TLabel;
    MainMenu1: TMainMenu;
    Button2: TButton;
    Button3: TButton;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    procedure Edit1KeyPress(Sender: TObject; var Key: Char);
    procedure Edit1KeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
  private
    A,B,H,Answer:Double;
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}


{Процедура, запрещающая появление нежелательных символов в edit.
Если вводимый символ, код которого содержится в переменной Key, не содержится во множествах Digit или Separator, то переменной Key присваивается код "отсутствие символа", равный #0.
Для того чтобы раскладки клавиатуры не влияли на ввод символа-разделителя, производится анализ на символы, находящиеся на тех кнопках, где располагаются точка либо запятая. Нажатие этих кнопок приводит к вводу символа DecimalSeparator. Однако повторный ввод разделителя не допускается.}

procedure TForm1.Edit1KeyPress(Sender: TObject; var Key: Char);
//Множество цифр, допустимых для ввода в edit:
const Digit: set of Char=['1'..'9', '0'];
//Множество символов, воспринимаемых как символ-разделитель:
  Separator: set of Char=['/', '.', ',', 'ю', 'Ю', 'б', 'Б'];
begin
with (Sender as TEdit) do
  begin
    if (Key in Separator)
     then Key:=DecimalSeparator //Delphi-константа типа Char, равная символу-разделителю Windows
     else
       if (not(Key in Digit))
       then Key:=#0;
    if ((Key=DecimalSeparator)and(pos(DecimalSeparator, Text)<>0))
      then Key:=#0;
  end;
end;

{Процедура, приводящая вводимое число к общеупотребительному виду. Для этого производится анализ на положение символа-разделителя (чтобы он был не первым либо последним), первый ноль перед символом, не равным символу-разделителю, завершающие нули в нецелом числе и т. д. Процедура также обеспечивает стирание введённых символов.}

procedure TForm1.Edit1KeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
var n: Integer;
    S: String;
begin
with (Sender as TEdit) do
  begin
    if pos(DecimalSeparator, Text)=1 then
      begin
        Text:='0'+Text;
        SelStart:=Length(Text);
      end;
    if (pos(DecimalSeparator, Text)<>Length(Text)) then
      if Text[Length(Text)]<>'0' then
        if FloatToStr(StrToFloat(Text))<>'0' then
          Text:=FloatToStr(StrToFloat(Text));
    if Key=8 then
      begin
        n:=SelStart;
        S:=Text;
        Delete(S, n, 1);
        Text:=S;
      end;
    SelStart:=Length(Text);
  end;
end;



procedure TForm1.Button1Click(Sender: TObject);
begin

if(Edit1.GetTextLen>0) AND (Edit2.GetTextLen>0) AND (Edit3.GetTextLen>0) then
  begin
A:=StrToFloat(Edit1.Text);
B:=StrToFloat(Edit2.Text);
H:=StrToFloat(Edit3.Text);
    //V
    if(RadioButton1.Checked) then
      begin
        Answer:=A*B*H;
      end;
      //S
    if(RadioButton2.Checked) then
      begin
        Answer:=2*(A*B+B*H+H*A);
      end;
     Label5.Caption:=FloatToStr(Answer);
  end;





end;
//clear
procedure TForm1.Button2Click(Sender: TObject);
begin
Edit1.Text:='';
Edit2.Text:='';
Edit3.Text:='';
end;

procedure TForm1.Button3Click(Sender: TObject);
begin
Application.Terminate;
end;


end.

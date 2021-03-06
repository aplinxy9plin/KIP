unit Unit20;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, StdCtrls,
  Grids;

type

  { TForm20 }

  TForm20 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label6: TLabel;
    StringGrid1: TStringGrid;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  Form20: TForm20;

implementation
        uses Unit16;
{$R *.lfm}

{ TForm20 }
//Функции условий
function conditional_1(x:single):single;
var y:single;
begin
     y:=sin(x);
     conditional_1:=y;
end;
function conditional_2(x:single):single;
var y:single;
begin
     y:=5*cos(x);
     conditional_2:=y;
end;

procedure formative();
begin
  Form20.StringGrid1.Clear;
  Form20.StringGrid1.GridLineWidth:=2;
  Form20.StringGrid1.RowCount:=2;
  Form20.StringGrid1.ColCount:=2;
  Form20.StringGrid1.FixedCols:=0;
  Form20.StringGrid1.TabOrder:=4;
  Form20.StringGrid1.cells[0,0]:='X';
  Form20.StringGrid1.cells[1,0]:='Y';
end;
procedure tabulation(var a,b,h:single);
  var n,i:integer;
      x,y:single;
      condit:byte;
begin
    x:=a;
    n:=Round((b-a)/h)+1;
         For i:=1 to n do
         begin
              if (x<=1) and(x >=-1) then
                 begin
                      y:=conditional_1(x);
                      condit:=1;
                 end
              else
                 begin
                      y:=conditional_2(x);
                      condit:=2;
                 end;
              Form20.StringGrid1.Cells[0,Form20.StringGrid1.RowCount-1]:=FloatToStrf(x,ffGeneral,2,6);
              Form20.StringGrid1.Cells[1,Form20.StringGrid1.RowCount-1]:=FloatToStrf(y,ffGeneral,2,6);
              Form20.StringGrid1.RowCount:=Form20.StringGrid1.RowCount+1;
              x:=x+h;
         end;
    Form20.Label6.Caption := 'Выполнилось условие № '+FloatToStr(condit);
    Form20.StringGrid1.RowCount:=Form20.StringGrid1.RowCount-1;
end;

procedure TForm20.Button1Click(Sender: TObject);
var a,b,h:single;
begin
  formative(); //да, да это функция для форматирования таблицы
     a:=StrToFloat(Edit1.Text);
     b:=StrToFloat(Edit2.Text);
     h:=StrToFloat(Edit3.Text);//Шаг
     tabulation(a,b,h);
end;

procedure TForm20.Button2Click(Sender: TObject);
begin
  Form16.Show;
  Label6.Caption := 'Выполнилось условие № ';
  Edit1.Clear;
  Edit2.Clear;
  Edit3.Clear;
  StringGrid1.Clear;
  StringGrid1.GridLineWidth:=2;
  StringGrid1.RowCount:=2;
  StringGrid1.ColCount:=2;
  StringGrid1.FixedCols:=0;
  StringGrid1.TabOrder:=4;
  Form20.Hide;
end;

end.


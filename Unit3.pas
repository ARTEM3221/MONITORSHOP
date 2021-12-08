unit Unit3;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DBCtrls, StdCtrls, ExtCtrls, Grids, DBGrids, ComCtrls,DB;

type
  TForm3 = class(TForm)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    TabSheet3: TTabSheet;
    TabSheet4: TTabSheet;
    TabSheet5: TTabSheet;
    TabSheet6: TTabSheet;
    DBGrid1: TDBGrid;
    Panel2: TPanel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Edit1: TEdit;
    Edit3: TEdit;
    Edit4: TEdit;
    Button4: TButton;
    Button6: TButton;
    Button1: TButton;
    Panel1: TPanel;
    Label7: TLabel;
    Label1: TLabel;
    Button2: TButton;
    Edit5: TEdit;
    Button18: TButton;
    Button19: TButton;
    Edit2: TEdit;
    Button10: TButton;
    DBGrid2: TDBGrid;
    DBGrid3: TDBGrid;
    DBGrid4: TDBGrid;
    DBGrid5: TDBGrid;
    DBGrid6: TDBGrid;
    Panel4: TPanel;
    Button7: TButton;
    Button8: TButton;
    Button9: TButton;
    Panel3: TPanel;
    Button3: TButton;
    Button5: TButton;
    Button12: TButton;
    Panel5: TPanel;
    Button13: TButton;
    Button14: TButton;
    Button15: TButton;
    Panel6: TPanel;
    Button16: TButton;
    Button17: TButton;
    Button20: TButton;
    Panel7: TPanel;
    Button21: TButton;
    Button22: TButton;
    Button23: TButton;
    DBLookupComboBox3: TDBLookupComboBox;
    Button24: TButton;
    procedure Button10Click(Sender: TObject);
    procedure Button12Click(Sender: TObject);
    procedure Button13Click(Sender: TObject);
    procedure Button14Click(Sender: TObject);
    procedure Button15Click(Sender: TObject);
    procedure Button16Click(Sender: TObject);
    procedure Button17Click(Sender: TObject);
    procedure Button18Click(Sender: TObject);
    procedure Button19Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button20Click(Sender: TObject);
    procedure Button21Click(Sender: TObject);
    procedure Button22Click(Sender: TObject);
    procedure Button23Click(Sender: TObject);
    procedure Button24Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure Edit5Change(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Button8Click(Sender: TObject);
    procedure Button9Click(Sender: TObject);
    procedure Button7Click(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form3: TForm3;

implementation

uses Unit2, Unit1;

{$R *.dfm}


procedure TForm3.Button10Click(Sender: TObject);
begin
DataModule2.ADOQTovaru.Close;
DataModule2.ADOQTovaru.SQL.Text:= 'SELECT Товари.Код_товару, Товари.Назва AS Товари_Назва, Бренди.Бренд AS Бренди_Бренд, Товари.Кількість, Товари.Ціна '
+' FROM Бренди INNER JOIN Товари ON Бренди.[Код_Бренда] = Товари.[Код_Бренда] where Товари.Код_товару = '+Edit2.Text+' ORDER BY Товари.Код_товару';
DataModule2.ADOQTovaru.Open;
end;

procedure TForm3.Button12Click(Sender: TObject);
begin
if  DataModule2.ADOTZamovlenia.Modified then
    DataModule2.ADOTZamovlenia.Post;
end;

procedure TForm3.Button13Click(Sender: TObject);
begin
DataModule2.ADOTPostachalniki.Delete;
end;

procedure TForm3.Button14Click(Sender: TObject);
begin
DataModule2.ADOTPostachalniki.Insert;
end;

procedure TForm3.Button15Click(Sender: TObject);
begin
if  DataModule2.ADOTPostachalniki.Modified then
  DataModule2.ADOTPostachalniki.Post;
end;

procedure TForm3.Button16Click(Sender: TObject);
begin
DataModule2.ADOTPostachania.Delete;
end;

procedure TForm3.Button17Click(Sender: TObject);
begin
DataModule2.ADOTPostachania.Insert;
end;

procedure TForm3.Button18Click(Sender: TObject);
begin
Edit1.Text:='';
Edit3.Text:='';
Edit4.Text:='0';
DBLookupComboBox3.KeyValue:=1;
Button1.Visible:=true;
Button4.Visible:=false;
Panel2.Visible:=true;
end;

procedure TForm3.Button19Click(Sender: TObject);
begin
  Edit1.Text:=DBGrid1.Fields[1].AsString;
  Edit3.Text:=DBGrid1.Fields[3].AsString;
  Edit4.Text:=DBGrid1.Fields[4].AsString;
  DataModule2.ADOTBrendu.Locate('Бренд',DBGrid1.Fields[2].AsString,[loCaseInsensitive, loPartialKey]);
DBLookupComboBox3.KeyValue:= StrToInt(DataModule2.DataSBrendu.DataSet.Fields[0].AsString);
Button1.Visible:=false;
Button4.Visible:=True;
Panel2.Visible:=true;
end;

procedure TForm3.Button1Click(Sender: TObject);
begin
DataModule2.ADOQWork.Close;
DataModule2.ADOQWork.SQL.Text:='INSERT INTO Товари ([Назва], [Код_Бренда], [Кількість], [Ціна] ) '
+' values ("'+Edit1.Text+'", '+IntToStr(DBLookupComboBox3.KeyValue)+', '+Edit3.Text+', '+Edit4.Text+')';
DataModule2.ADOQWork.ExecSQL;

DataModule2.ADOQTovaru.Close;
DataModule2.ADOQTovaru.SQL.Text:= 'SELECT Товари.Код_товару, Товари.Назва, Бренди.Код_Бренда, Товари.Кількість, Товари.Ціна FROM Бренди INNER JOIN Товари ON Бренди.[Код_Бренда] = Товари.[Код_Бренда]';
DataModule2.ADOQTovaru.Open;

panel2.Visible:=False;
end;

procedure TForm3.Button20Click(Sender: TObject);
begin
if  DataModule2.ADOTPostachania.Modified then
 DataModule2.ADOTPostachania.Post;
end;

procedure TForm3.Button21Click(Sender: TObject);
begin
DataModule2.ADOTProdavci.Delete;
end;

procedure TForm3.Button22Click(Sender: TObject);
begin
DataModule2.ADOTProdavci.Insert;
end;

procedure TForm3.Button23Click(Sender: TObject);
begin
if  DataModule2.ADOTProdavci.Modified then
 DataModule2.ADOTProdavci.Post;
end;

procedure TForm3.Button24Click(Sender: TObject);
begin
Main.show;
Form3.hide;
end;

procedure TForm3.Button2Click(Sender: TObject);
begin
DataModule2.ADOQWork.Close;
DataModule2.ADOQWork.SQL.Text:= 'DELETE * FROM Товари Where (Товари.Код_товару = '+DBGrid1.Fields[0].AsString+')';
DataModule2.ADOQWork.ExecSQL;
FormShow(Sender);
end;

procedure TForm3.Button3Click(Sender: TObject);
begin
DataModule2.ADOTZamovlenia.Delete;
end;

procedure TForm3.Button4Click(Sender: TObject);
begin
DataModule2.ADOQWork.Close;
DataModule2.ADOQWork.SQL.Text:=' UPDATE Товари SET Товари.Назва = "'+Edit1.Text+'", Товари.Код_Бренда = "'+IntToStr(DBLookupComboBox3.KeyValue)+'", Товари.Кількість = '+Edit3.Text+', Товари.Ціна = '+Edit4.Text+' '
+' WHERE (((Товари.Код_товару)='+DBGrid1.Fields[0].AsString+'))';
DataModule2.ADOQWork.ExecSQL;

FormShow(Sender);


panel2.Visible:=False;
end;

procedure TForm3.Button5Click(Sender: TObject);
begin
DataModule2.ADOTZamovlenia.Insert;
end;


procedure TForm3.Button6Click(Sender: TObject);
begin
Edit1.Text:='';
Edit3.Text:='';
Edit4.Text:='';
FormShow(Sender);
panel2.Visible:=False;
end;

procedure TForm3.Button7Click(Sender: TObject);
begin
 DataModule2.ADOTBrendu.Delete;
end;

procedure TForm3.Button8Click(Sender: TObject);
begin
 DataModule2.ADOTBrendu.Insert;
end;

procedure TForm3.Button9Click(Sender: TObject);
begin
 if  DataModule2.ADOTBrendu.Modified then
 DataModule2.ADOTBrendu.Post;
end;

procedure TForm3.Edit5Change(Sender: TObject);
begin
DataModule2.ADOQTovaru.Close;
DataModule2.ADOQTovaru.SQL.Text:=  'SELECT Товари.Код_товару, Товари.Назва AS Товари_Назва, Бренди.Бренд AS Бренди_Бренд, Товари.Кількість, Товари.Ціна '
+' FROM Бренди INNER JOIN Товари ON Бренди.[Код_Бренда] = Товари.[Код_Бренда] where Товари.Назва like "%'+Edit5.Text+'%" ORDER BY Товари.Код_товару';
DataModule2.ADOQTovaru.Open;
end;



procedure TForm3.FormShow(Sender: TObject);
begin
DataModule2.ADOQTovaru.Close;
DataModule2.ADOQTovaru.SQL.Text:= 'SELECT Товари.Код_товару, Товари.Назва, Бренди.Код_Бренда, Товари.Кількість, Товари.Ціна FROM Бренди INNER JOIN Товари ON Бренди.[Код_Бренда] = Товари.[Код_Бренда]';
DataModule2.ADOQTovaru.Open;
end;

end.

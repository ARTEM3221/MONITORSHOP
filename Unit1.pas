unit Unit1;

interface

uses
Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, Grids, DBGrids, DBCtrls, StdCtrls, ComCtrls, ExtCtrls, Data.DB;

type
  TMain = class(TForm)
    Label4: TLabel;
    Label10: TLabel;
    Label12: TLabel;
    Panel1: TPanel;
    Panel2: TPanel;
    Button4: TButton;
    DateTimePicker1: TDateTimePicker;
    Label11: TLabel;
    Edit2: TEdit;
    Label1: TLabel;
    DBLookupComboBox1: TDBLookupComboBox;
    DBLookupComboBox2: TDBLookupComboBox;
    Label2: TLabel;
    Label3: TLabel;
    Button1: TButton;
    UpDown1: TUpDown;
    Label5: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    DBGrid2: TDBGrid;
    Button2: TButton;
    Label13: TLabel;
    Button3: TButton;
    Panel3: TPanel;
    Button6: TButton;
    DBGrid1: TDBGrid;
    Button7: TButton;
    Вихід: TButton;
    procedure ShowForm(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Edit2Change(Sender: TObject);
    procedure DBLookupComboBox1Click(Sender: TObject);
    procedure Button7Click(Sender: TObject);
    procedure ВихідClick(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Main: TMain;
  ChekNom, ChekSum,  CenaTov: String;



implementation

uses Unit2, Unit3, Unit4, Unit5;


{$R *.dfm}


procedure TMain.ShowForm(Sender: TObject);
begin
DateTimePicker1.Date:=Now;

DataModule2.ADOQChek.close;
DataModule2.ADOQChek.SQL.text:=' select * from Чек order by Код_чеку';
DataModule2.ADOQChek.Open;

DBLookupComboBox1.KeyValue:= 1;
DBLookupComboBox2.KeyValue:= 1;
end;



procedure TMain.ВихідClick(Sender: TObject);
begin
Close;
end;

procedure TMain.Button2Click(Sender: TObject);
begin

DataModule2.ADOQWork.Close;
DataModule2.ADOQWork.SQL.Text:= 'Delete * from Замовлення Where Код_замовлення = '+DBGrid2.Fields[0].AsString+'';
DataModule2.ADOQWork.ExecSQL;

DataModule2.ADOQWork2.Close;
DataModule2.ADOQWork2.SQL.Text:='Select Замовлення.Код_замовлення, Замовлення.Код_Чеку, Товари.Назва, Замовлення.Кількість, Замовлення.Сума, Продавці.ПІБ, Замовлення.Дата, Товари.Ціна '
+ ' FROM Товари INNER JOIN (Продавці INNER JOIN Замовлення ON Продавці.[Код_продавця] = Замовлення.[код_продавця]) ON Товари.[Код_товару] = Замовлення.[Код_товару]'
+ ' WHERE (((Замовлення.Код_Чеку)= '+Cheknom+')) ' ;
DataModule2.ADOQWork2.open;

DataModule2.ADOQWork.Close;
DataModule2.ADOQWork.SQL.Text:=' Select Sum(Замовлення.[Сума]) AS [Sum-Сума] FROM Замовлення GROUP BY Замовлення.[Код_Чеку] HAVING (((Замовлення.[Код_Чеку])= '+ChekNom+'))';
DataModule2.ADOQWork.Open;
ChekSum:= DataModule2.DataSWork.DataSet.Fields[0].AsString;
label13.caption:= 'Сумма по чеку (грн): ' + ChekSum;

DataModule2.ADOQWork.Close;
DataModule2.ADOQWork.SQL.Text:=' UPDATE Чек SET Чек.[сума] = '+ChekSum+' WHERE (((Чек.[Код_чеку])='+ChekNom+'))';
DataModule2.ADOQWork.ExecSQL;

ShowForm(Sender);
end;

procedure TMain.Button3Click(Sender: TObject);
begin
DataModule2.ADOQOtchetchek.Close;
DataModule2.ADOQOtchetchek.SQL.Text:='SELECT Замовлення.Код_замовлення, Замовлення.Код_Чеку, Товари.Назва, Замовлення.Кількість, Замовлення.Сума, Продавці.ПІБ, Замовлення.Дата, Товари.Ціна'
+ ' FROM Товари INNER JOIN (Продавці INNER JOIN Замовлення ON Продавці.[Код_продавця] = Замовлення.[код_продавця]) ON Товари.[Код_товару] = Замовлення.[Код_товару]'
+ ' WHERE (((Замовлення.Код_Чеку)= '+Cheknom+')) ' ;
DataModule2.ADOQOtchetchek.Open;

Form5.QRLabel1.Caption:='Чек№'+ChekNom;
Form5.QRLabel2.Caption:='Дата: ' + datetostr(datetimepicker1.date);
Form5.QRLabel3.Caption:='Продавець: ' + DBLookupComboBox2.Text;
Form5.QRLabel10.Caption:='Сума по чеку: ' + ChekSum;
Form5.QuickRep1.PreviewModal;
//form5.show;

end;

procedure TMain.Button4Click(Sender: TObject);
begin

DataModule2.ADOQWork.Close;
DataModule2.ADOQWork.SQL.Text:= 'INSERT INTO Чек ( [Дата_продажу], [сума] )  Values (:dt, 0) ';
DataModule2.ADOQWork.Parameters.ParamByName('dt').Value:=FormatDateTime('dd.mm.yyyy', DateTimePicker1.Date);
DataModule2.ADOQWork.ExecSQL;

ShowForm(Sender);

DataModule2.ADOQWork.close;
DataModule2.ADOQWork.SQL.text:=' select * from Чек order by Код_чеку';
DataModule2.ADOQWork.Open;

DataModule2.ADOQWork.Last;
Cheknom:= DataModule2.DataSWork.DataSet.Fields[0].AsString;
Label8.Caption:='Чек №'+ChekNom;

DataModule2.ADOQWork2.Close;
DataModule2.ADOQWork2.SQL.Text:='Select Замовлення.Код_замовлення, Замовлення.Код_Чеку, Товари.Назва, Замовлення.Кількість, Замовлення.Сума, Продавці.ПІБ, Замовлення.Дата, Товари.Ціна '
+ ' FROM Товари INNER JOIN (Продавці INNER JOIN Замовлення ON Продавці.[Код_продавця] = Замовлення.[код_продавця]) ON Товари.[Код_товару] = Замовлення.[Код_товару]'
+ ' WHERE (((Замовлення.Код_Чеку)= '+Cheknom+')) ' ;
DataModule2.ADOQWork2.open;
ChekSum:= '0';
label13.caption:= 'Сумма по чеку (грн): ' + ChekSum;

Panel2.Enabled:= true;
end;

procedure TMain.Button6Click(Sender: TObject);
begin
Form4.show;
Main.Hide;
end;

procedure TMain.Button7Click(Sender: TObject);
begin
form3.show;
Main.Hide;
end;

procedure TMain.Button1Click(Sender: TObject);
begin
DataModule2.ADOQWork.Close;
DataModule2.ADOQWork.SQL.Text:= 'INSERT INTO Замовлення ( [Код_Чеку], [код_продавця], [Код_товару], [Дата], [Кількість], [Сума] ) '
 + ' Values ('+ChekNom+', '+inttostr(DBLookupComboBox2.KeyValue)+', '+inttostr(DBLookupComboBox1.KeyValue)+', :dt, '+edit2.Text+', '+Cenatov+')';
DataModule2.ADOQWork.Parameters.ParamByName('dt').Value:=FormatDateTime('dd.mm.yyyy', DateTimePicker1.Date);
DataModule2.ADOQWork.ExecSQL;

DataModule2.ADOQWork2.Close;
DataModule2.ADOQWork2.SQL.Text:='Select Замовлення.Код_замовлення, Замовлення.Код_Чеку, Товари.Назва, Замовлення.Кількість, Замовлення.Сума, Продавці.ПІБ, Замовлення.Дата, Товари.Ціна '
+ ' FROM Товари INNER JOIN (Продавці INNER JOIN Замовлення ON Продавці.[Код_продавця] = Замовлення.[код_продавця]) ON Товари.[Код_товару] = Замовлення.[Код_товару]'
+ ' WHERE (((Замовлення.Код_Чеку)= '+Cheknom+')) ' ;
DataModule2.ADOQWork2.open;

DataModule2.ADOQWork.Close;
DataModule2.ADOQWork.SQL.Text:=' Select Sum(Замовлення.[Сума]) AS [Sum-Сума] FROM Замовлення GROUP BY Замовлення.[Код_Чеку] HAVING (((Замовлення.[Код_Чеку])= '+ChekNom+'))';
DataModule2.ADOQWork.Open;
ChekSum:= DataModule2.DataSWork.DataSet.Fields[0].AsString;
label13.caption:= 'Сумма по чеку (грн): ' + ChekSum;

DataModule2.ADOQWork.Close;
DataModule2.ADOQWork.SQL.Text:=' UPDATE Чек SET Чек.[сума] = '+ChekSum+' WHERE (((Чек.[Код_чеку])='+ChekNom+'))';
DataModule2.ADOQWork.ExecSQL;
ShowForm(Sender);
end;

procedure TMain.Edit2Change(Sender: TObject);
begin
CenaTov:= IntToStr(DataModule2.DataSTowaru.DataSet.Fields[6].AsInteger * strtoint(edit2.text));
label5.caption:= 'Цена продажи (грн): ' + CenaTov;
end;


procedure TMain.DBLookupComboBox1Click(Sender: TObject);
begin
CenaTov:= IntToStr(DataModule2.DataSTowaru.DataSet.Fields[6].AsInteger * strtoint(edit2.text));

label5.caption:= 'Цена продажи (грн): ' + CenaTov;

Label9.Caption:= 'Цена за единицу (грн): ' +DataModule2.ADOTTowaru.Fields[6].AsString;
end;

end.


unit Unit2;

interface

uses
  SysUtils, Classes, ADODB, DB;

type
  TDataModule2 = class(TDataModule)
    ADOConnection1: TADOConnection;
    ADOQTovaru: TADOQuery;
    DataSTovaru: TDataSource;
    ADOTZamovlenia: TADOTable;
    ADOTPostachalniki: TADOTable;
    ADOTPostachania: TADOTable;
    ADOTProdavci: TADOTable;
    DataSZamovlenia: TDataSource;
    DataSPostachalniki: TDataSource;
    DataSPostachania: TDataSource;
    DataSProdavci: TDataSource;
    ADOQTovaruglaw: TADOQuery;
    DataSTovaruglaw: TDataSource;
    DataSBrendu: TDataSource;
    ADOTBrendu: TADOTable;
    ADOQWork: TADOQuery;
    DataSWork: TDataSource;
    ADOQChek: TADOQuery;
    DataSChek: TDataSource;
    ADOQWork2: TADOQuery;
    DataSWork2: TDataSource;
    ADOTTowaru: TADOTable;
    DataSTowaru: TDataSource;
    ADOQOtchetchek: TADOQuery;
    DataSOtchetchek: TDataSource;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DataModule2: TDataModule2;

implementation

uses Unit1, Unit3;

{$R *.dfm}

end.

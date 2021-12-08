object DataModule2: TDataModule2
  OldCreateOrder = False
  Height = 842
  Width = 823
  object ADOConnection1: TADOConnection
    Connected = True
    ConnectionString = 
      'Provider=Microsoft.ACE.OLEDB.12.0;User ID=Admin;Data Source=maga' +
      'zinmonitorov.accdb;Mode=Share Deny None;Persist Security Info=Fa' +
      'lse;Jet OLEDB:System database="";Jet OLEDB:Registry Path="";Jet ' +
      'OLEDB:Database Password="";Jet OLEDB:Engine Type=6;Jet OLEDB:Dat' +
      'abase Locking Mode=1;Jet OLEDB:Global Partial Bulk Ops=2;Jet OLE' +
      'DB:Global Bulk Transactions=1;Jet OLEDB:New Database Password=""' +
      ';Jet OLEDB:Create System Database=False;Jet OLEDB:Encrypt Databa' +
      'se=False;Jet OLEDB:Don'#39't Copy Locale on Compact=False;Jet OLEDB:' +
      'Compact Without Replica Repair=False;Jet OLEDB:SFP=False;Jet OLE' +
      'DB:Support Complex Data=False'
    LoginPrompt = False
    Mode = cmShareDenyNone
    Provider = 'Microsoft.ACE.OLEDB.12.0'
    Left = 56
    Top = 48
  end
  object ADOQTovaru: TADOQuery
    Connection = ADOConnection1
    Parameters = <>
    Left = 176
    Top = 40
  end
  object DataSTovaru: TDataSource
    DataSet = ADOQTovaru
    Left = 304
    Top = 40
  end
  object ADOTZamovlenia: TADOTable
    Active = True
    Connection = ADOConnection1
    CursorType = ctStatic
    TableName = #1047#1072#1084#1086#1074#1083#1077#1085#1085#1103
    Left = 176
    Top = 168
  end
  object ADOTPostachalniki: TADOTable
    Active = True
    Connection = ADOConnection1
    CursorType = ctStatic
    TableName = #1055#1086#1089#1090#1072#1095#1072#1083#1100#1085#1080#1082
    Left = 176
    Top = 232
  end
  object ADOTPostachania: TADOTable
    Active = True
    Connection = ADOConnection1
    CursorType = ctStatic
    TableName = #1055#1086#1089#1090#1072#1095#1072#1085#1085#1103
    Left = 176
    Top = 296
  end
  object ADOTProdavci: TADOTable
    Active = True
    Connection = ADOConnection1
    CursorType = ctStatic
    TableName = #1055#1088#1086#1076#1072#1074#1094#1110
    Left = 176
    Top = 360
  end
  object DataSZamovlenia: TDataSource
    DataSet = ADOTZamovlenia
    Left = 304
    Top = 168
  end
  object DataSPostachalniki: TDataSource
    DataSet = ADOTPostachalniki
    Left = 312
    Top = 232
  end
  object DataSPostachania: TDataSource
    DataSet = ADOTPostachania
    Left = 320
    Top = 296
  end
  object DataSProdavci: TDataSource
    DataSet = ADOTProdavci
    Left = 320
    Top = 368
  end
  object ADOQTovaruglaw: TADOQuery
    Connection = ADOConnection1
    Parameters = <>
    Left = 176
    Top = 112
  end
  object DataSTovaruglaw: TDataSource
    DataSet = ADOQTovaruglaw
    Left = 296
    Top = 112
  end
  object DataSBrendu: TDataSource
    DataSet = ADOTBrendu
    Left = 320
    Top = 456
  end
  object ADOTBrendu: TADOTable
    Active = True
    Connection = ADOConnection1
    CursorType = ctStatic
    TableName = #1041#1088#1077#1085#1076#1080
    Left = 184
    Top = 440
  end
  object ADOQWork: TADOQuery
    Connection = ADOConnection1
    Parameters = <>
    Left = 176
    Top = 520
  end
  object DataSWork: TDataSource
    DataSet = ADOQWork
    Left = 320
    Top = 520
  end
  object ADOQChek: TADOQuery
    Connection = ADOConnection1
    Parameters = <>
    Left = 472
    Top = 40
  end
  object DataSChek: TDataSource
    DataSet = ADOQChek
    Left = 600
    Top = 32
  end
  object ADOQWork2: TADOQuery
    Connection = ADOConnection1
    Parameters = <>
    Left = 472
    Top = 104
  end
  object DataSWork2: TDataSource
    DataSet = ADOQWork2
    Left = 600
    Top = 96
  end
  object ADOTTowaru: TADOTable
    Active = True
    Connection = ADOConnection1
    CursorType = ctStatic
    TableName = #1058#1086#1074#1072#1088#1080
    Left = 472
    Top = 160
  end
  object DataSTowaru: TDataSource
    DataSet = ADOTTowaru
    Left = 608
    Top = 160
  end
  object ADOQOtchetchek: TADOQuery
    Active = True
    Connection = ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      
        'SELECT '#1047#1072#1084#1086#1074#1083#1077#1085#1085#1103'.'#1050#1086#1076'_'#1079#1072#1084#1086#1074#1083#1077#1085#1085#1103', '#1047#1072#1084#1086#1074#1083#1077#1085#1085#1103'.'#1050#1086#1076'_'#1063#1077#1082#1091', '#1058#1086#1074#1072#1088#1080'.'#1053#1072 +
        #1079#1074#1072', '#1047#1072#1084#1086#1074#1083#1077#1085#1085#1103'.'#1050#1110#1083#1100#1082#1110#1089#1090#1100', '#1047#1072#1084#1086#1074#1083#1077#1085#1085#1103'.'#1057#1091#1084#1072', '#1055#1088#1086#1076#1072#1074#1094#1110'.'#1055#1030#1041', '#1047#1072#1084#1086#1074#1083 +
        #1077#1085#1085#1103'.'#1044#1072#1090#1072', '#1058#1086#1074#1072#1088#1080'.'#1062#1110#1085#1072
      
        'FROM '#1058#1086#1074#1072#1088#1080' INNER JOIN ('#1055#1088#1086#1076#1072#1074#1094#1110' INNER JOIN '#1047#1072#1084#1086#1074#1083#1077#1085#1085#1103' ON '#1055#1088#1086#1076#1072#1074 +
        #1094#1110'.['#1050#1086#1076'_'#1087#1088#1086#1076#1072#1074#1094#1103'] = '#1047#1072#1084#1086#1074#1083#1077#1085#1085#1103'.['#1082#1086#1076'_'#1087#1088#1086#1076#1072#1074#1094#1103']) ON '#1058#1086#1074#1072#1088#1080'.['#1050#1086#1076'_'#1090#1086 +
        #1074#1072#1088#1091'] = '#1047#1072#1084#1086#1074#1083#1077#1085#1085#1103'.['#1050#1086#1076'_'#1090#1086#1074#1072#1088#1091'];')
    Left = 472
    Top = 240
  end
  object DataSOtchetchek: TDataSource
    DataSet = ADOQOtchetchek
    Left = 608
    Top = 240
  end
end

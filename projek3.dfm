object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 450
  ClientWidth = 646
  Color = clCream
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  TextHeight = 15
  object lblHost: TLabel
    Left = 64
    Top = 56
    Width = 59
    Height = 17
    Caption = 'Hostname'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
  end
  object lblUser: TLabel
    Left = 64
    Top = 88
    Width = 59
    Height = 17
    Caption = 'Username'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
  end
  object lblPassword: TLabel
    Left = 64
    Top = 120
    Width = 56
    Height = 17
    Caption = 'Password'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
  end
  object lblPort: TLabel
    Left = 64
    Top = 152
    Width = 24
    Height = 17
    Caption = 'Port'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
  end
  object lblDatabase: TLabel
    Left = 64
    Top = 184
    Width = 55
    Height = 17
    Caption = 'Database'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
  end
  object lblPrompt: TLabel
    Left = 344
    Top = 54
    Width = 43
    Height = 17
    Caption = 'Prompt'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
  end
  object lblParent: TLabel
    Left = 344
    Top = 88
    Width = 53
    Height = 17
    Caption = 'Parent ID'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
  end
  object lblSeq: TLabel
    Left = 344
    Top = 120
    Width = 40
    Height = 17
    Caption = 'SEQ ID'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
  end
  object lblKata: TLabel
    Left = 344
    Top = 152
    Width = 26
    Height = 17
    Caption = 'Kata'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
  end
  object lblType: TLabel
    Left = 344
    Top = 184
    Width = 43
    Height = 17
    Caption = 'Type ID'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
  end
  object edtHost: TEdit
    Left = 160
    Top = 56
    Width = 121
    Height = 23
    TabOrder = 0
  end
  object edtUser: TEdit
    Left = 160
    Top = 85
    Width = 121
    Height = 23
    TabOrder = 1
  end
  object edtPassword: TEdit
    Left = 160
    Top = 117
    Width = 121
    Height = 23
    PasswordChar = '*'
    TabOrder = 2
  end
  object edtPort: TEdit
    Left = 160
    Top = 149
    Width = 121
    Height = 23
    TabOrder = 3
  end
  object edtPrompt: TEdit
    Left = 424
    Top = 55
    Width = 121
    Height = 23
    TabOrder = 4
  end
  object edtParent: TEdit
    Left = 424
    Top = 87
    Width = 121
    Height = 23
    TabOrder = 5
  end
  object edtSEQ: TEdit
    Left = 424
    Top = 119
    Width = 121
    Height = 23
    TabOrder = 6
  end
  object edtKata: TEdit
    Left = 424
    Top = 151
    Width = 121
    Height = 23
    TabOrder = 7
  end
  object edtType: TEdit
    Left = 426
    Top = 180
    Width = 55
    Height = 23
    TabOrder = 8
  end
  object chkType: TCheckBox
    Left = 497
    Top = 186
    Width = 97
    Height = 17
    Caption = 'Aktif'
    TabOrder = 9
  end
  object cbb1: TComboBox
    Left = 160
    Top = 183
    Width = 121
    Height = 23
    TabOrder = 10
    OnEnter = cbbEnter
  end
  object pnl1: TPanel
    Left = 0
    Top = 255
    Width = 649
    Height = 198
    Caption = 'pnl1'
    Color = clBeige
    ParentBackground = False
    TabOrder = 11
    object dbgrd1: TDBGrid
      Left = 64
      Top = 74
      Width = 481
      Height = 120
      DataSource = ds1
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -12
      TitleFont.Name = 'Segoe UI'
      TitleFont.Style = []
    end
    object btnSave: TButton
      Left = 470
      Top = 5
      Width = 75
      Height = 25
      Caption = 'Save'
      TabOrder = 1
      OnClick = btnSaveClick
    end
    object btnCancel: TButton
      Left = 383
      Top = 5
      Width = 75
      Height = 25
      Caption = 'Cancel'
      TabOrder = 2
      OnClick = btnCancelClick
    end
    object btnConnect: TButton
      Left = 185
      Top = 4
      Width = 75
      Height = 25
      Caption = 'Connect'
      TabOrder = 3
      OnClick = btnConnectClick
    end
  end
  object con1: TZConnection
    ControlsCodePage = cCP_UTF16
    Catalog = ''
    Properties.Strings = (
      'RawStringEncoding=DB_CP')
    DisableSavepoints = False
    HostName = ''
    Port = 0
    Database = ''
    User = ''
    Password = ''
    Protocol = 'mysql'
    Top = 8
  end
  object zqry1: TZQuery
    AfterScroll = zqry1AfterScroll
    Connection = con1
    BeforeInsert = zqry1BeforeInsert
    SQL.Strings = (
      'select * from erp_menu')
    Params = <>
    Left = 32
    Top = 8
  end
  object ds1: TDataSource
    DataSet = zqry1
    Left = 64
    Top = 8
  end
  object zqry2: TZQuery
    Connection = con1
    SQL.Strings = (
      'select * from erp_menu')
    Params = <>
    Top = 64
  end
end

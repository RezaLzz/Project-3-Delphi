unit projek3;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  Vcl.StdCtrls, Data.DB, Vcl.Grids, Vcl.DBGrids, ZAbstractRODataset,
  ZAbstractDataset, ZDataset, ZAbstractConnection, ZConnection, ZDbcIntfs,
  Vcl.ExtCtrls;

type
  TForm1 = class(TForm)
    lblHost: TLabel;
    lblUser: TLabel;
    lblPassword: TLabel;
    lblPort: TLabel;
    lblDatabase: TLabel;
    edtHost: TEdit;
    edtUser: TEdit;
    edtPassword: TEdit;
    edtPort: TEdit;
    lblPrompt: TLabel;
    lblParent: TLabel;
    lblSeq: TLabel;
    lblKata: TLabel;
    lblType: TLabel;
    edtPrompt: TEdit;
    edtParent: TEdit;
    edtSEQ: TEdit;
    edtKata: TEdit;
    edtType: TEdit;
    dbgrd1: TDBGrid;
    btnConnect: TButton;
    btnSave: TButton;
    btnCancel: TButton;
    chkType: TCheckBox;
    zqry1: TZQuery;
    ds1: TDataSource;
    cbb1: TComboBox;
    zqry2: TZQuery;
    con1: TZConnection;
    pnl1: TPanel;
    procedure btnConnectClick(Sender: TObject);
    procedure Cari;
    procedure btnSaveClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure cbbEnter(Sender: TObject);
    procedure zqry1BeforeInsert(DataSet: TDataSet);
    procedure zqry1AfterScroll(DataSet: TDataSet);
  private
    { Private declarations }
    FOriginalValues: array[1..5] of string;
    FOriginalCheckBoxState: Boolean;
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.btnCancelClick(Sender: TObject);
begin

  chkType.Checked := FOriginalCheckBoxState;

  edtPrompt.Text := FOriginalValues[1];
  edtParent.Text := FOriginalValues[2];
  edtSEQ.Text := FOriginalValues[3];
  edtKata.Text := FOriginalValues[4];
  edtType.Text := FOriginalValues[5];

end;

procedure TForm1.btnConnectClick(Sender: TObject);
begin
  var PortNum: Integer;
  try
    con1.Disconnect;
    con1.Database := cbb1.Text;
    con1.HostName := edtHost.Text;

    if TryStrToInt(edtPort.Text, PortNum) then
      con1.Port := PortNum
    else if edtPort.Text <> '' then
      raise Exception.Create('Port tidak valid');

    if edtPassword.Text <> '' then
      con1.Password := edtPassword.Text;

    if edtUser.Text <> '' then
      con1.User := edtUser.Text;

    con1.Connect;
    ShowMessage('Koneksi berhasil!');
  except
    on E: Exception do
      ShowMessage('Koneksi gagal: ' + E.Message);
  end;

  zqry1.SQL.Text := 'SELECT * FROM erp_menu';

  zqry1.open;

  if not zqry1.IsEmpty then
  begin
    zqry1.First;  // Pindah ke record pertama

    // Tampilkan data dari query ke TEdit (sesuaikan field dengan kolom yang ada)
    edtPrompt.Text := zqry1.FieldByName('PROMPT').AsString;
    edtParent.Text := zqry1.FieldByName('PARENT_ID').AsString;
    edtSEQ.Text := zqry1.FieldByName('SEQ').AsString;
    edtKata.Text := zqry1.FieldByName('KATA').AsString;
    edtType.Text := zqry1.FieldByName('TYPE_ID').AsString;

    if zqry1.FieldByName('active_flag').AsString = 'Y' then
      chkType.Checked := True
    else
      chkType.Checked := False;
  end
  else
  begin
    ShowMessage('Data tidak ditemukan');
  end;

end;

procedure TForm1.btnSaveClick(Sender: TObject);
begin

  if not dbgrd1.DataSource.DataSet.IsEmpty then
  begin
    dbgrd1.DataSource.DataSet.Edit;

    if Trim(edtPrompt.Text) = '' then
      dbgrd1.DataSource.DataSet.FieldByName('PROMPT').Clear
    else
      dbgrd1.DataSource.DataSet.FieldByName('PROMPT').AsString := edtPrompt.Text;

    if Trim(edtParent.Text) = '' then
      dbgrd1.DataSource.DataSet.FieldByName('PARENT_ID').Clear
    else
      dbgrd1.DataSource.DataSet.FieldByName('PARENT_ID').AsString := edtParent.Text;

    if Trim(edtSEQ.Text) = '' then
      dbgrd1.DataSource.DataSet.FieldByName('SEQ').Clear
    else
      dbgrd1.DataSource.DataSet.FieldByName('SEQ').AsString := edtSEQ.Text;

    if Trim(edtKata.Text) = '' then
      dbgrd1.DataSource.DataSet.FieldByName('KATA').Clear
    else
      dbgrd1.DataSource.DataSet.FieldByName('KATA').AsString := edtKata.Text;

    if Trim(edtType.Text) = '' then
      dbgrd1.DataSource.DataSet.FieldByName('TYPE_ID').Clear
    else
      dbgrd1.DataSource.DataSet.FieldByName('TYPE_ID').AsString := edtType.Text;

    if chkType.Checked = True then
      dbgrd1.DataSource.DataSet.FieldByName('ACTIVE_FLAG').AsString := 'Y'
    else if chkType.Checked = False then
      dbgrd1.DataSource.DataSet.FieldByName('ACTIVE_FLAG').AsString := 'N';

    dbgrd1.DataSource.DataSet.Post;

  // Setelah penyimpanan berhasil, perbarui FOriginalValues dan FOriginalCheckBoxState
    FOriginalCheckBoxState := chkType.Checked;

    FOriginalValues[1] := edtPrompt.Text;
    FOriginalValues[2] := edtParent.Text;
    FOriginalValues[3] := edtSEQ.Text;
    FOriginalValues[4] := edtKata.Text;
    FOriginalValues[5] := edtType.Text;
    ShowMessage('Data berhasil diubah');

  end;

end;

procedure TForm1.Cari;
begin

  if not dbgrd1.DataSource.DataSet.IsEmpty then
  begin

    FOriginalCheckBoxState := chkType.Checked;

    FOriginalValues[1] := dbgrd1.DataSource.DataSet.FieldByName('PROMPT').AsString;
    FOriginalValues[2] := dbgrd1.DataSource.DataSet.FieldByName('PARENT_ID').AsString;
    FOriginalValues[3] := dbgrd1.DataSource.DataSet.FieldByName('SEQ').AsString;
    FOriginalValues[4] := dbgrd1.DataSource.DataSet.FieldByName('KATA').AsString;
    FOriginalValues[5] := dbgrd1.DataSource.DataSet.FieldByName('TYPE_ID').AsString;

    edtPrompt.Text := FOriginalValues[1];
    edtParent.Text := FOriginalValues[2];
    edtSEQ.Text := FOriginalValues[3];
    edtKata.Text := FOriginalValues[4];
    edtType.Text := FOriginalValues[5];

    if dbgrd1.DataSource.DataSet.FieldByName('ACTIVE_FLAG').AsString = 'Y' then
      chkType.Checked := True
    else
      chkType.Checked := False;

  end;

end;

procedure TForm1.cbbEnter(Sender: TObject);
begin
  var PortNum: Integer;
// Kosongkan ComboBox sebelum diisi
  cbb1.Items.Clear;
  try

    con1.Database := 'test';
    con1.HostName := edtHost.Text;

    if TryStrToInt(edtPort.Text, PortNum) then
      con1.Port := PortNum
    else if edtPort.Text <> '' then
      raise Exception.Create('Port tidak valid');

    if edtPassword.Text <> '' then
      con1.Password := edtPassword.Text;

    if edtUser.Text <> '' then
      con1.User := edtUser.Text;

    con1.Connect;

  finally

  end;

  // Jalankan query untuk mendapatkan daftar database
  zqry2.SQL.Text := 'SHOW DATABASES';
  zqry2.Open;

  // Masukkan hasil query ke dalam ComboBox
  while not zqry2.Eof do
  begin
    cbb1.Items.Add(zqry2.Fields[0].AsString);
    zqry2.Next;
  end;

  // Tutup query setelah selesai
  zqry2.Close;
end;

procedure TForm1.zqry1AfterScroll(DataSet: TDataSet);
begin
  Cari;
end;

procedure TForm1.zqry1BeforeInsert(DataSet: TDataSet);
begin
  Abort;
end;

end.


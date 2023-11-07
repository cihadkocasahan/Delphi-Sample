unit Main;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics, Vcl.Controls,
  Vcl.Forms, Vcl.Dialogs, Connections, Vcl.StdCtrls, Vcl.Mask, Vcl.ExtCtrls, ConnectionService, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool,
  FireDAC.Stan.Async, FireDAC.Phys, FireDAC.VCLUI.Wait, Data.Win.ADODB, Data.DB, FireDAC.Comp.Client, Vcl.ComCtrls;

type
  TfrmMain = class(TForm)
    cmbConnections: TComboBox;
    btnGenerate: TButton;
    edtServer: TLabeledEdit;
    edtDatabase: TLabeledEdit;
    edtUsername: TLabeledEdit;
    edtPassword: TLabeledEdit;
    mmConnectionString: TMemo;
    ADOConnection1: TADOConnection;
    StatusBar1: TStatusBar;
    procedure btnGenerateClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
  private
    { Private declarations }
  public
    { Public declaasdasdarations }
  end;

var
  frmMain: TfrmMain;
  Connection: IConnection;

implementation



{$R *.dfm}

procedure TfrmMain.btnGenerateClick(Sender: TObject);
var
  connectionName: string;
begin
  if cmbConnections.ItemIndex = -1 then
    raise Exception.Create('Please Select Connection Type');
  Connection := TConnectionStringService.Getconnection(cmbConnections.Items[cmbConnections.ItemIndex]);

  with connection do
  begin
    Server := edtServer.Text;
    Database := edtDatabase.Text;
    Username := edtUsername.Text;
    Password := edtPassword.Text;
  end;

  mmConnectionString.Clear;
  mmConnectionString.Text := connection.GetConnectionString;

  //Sample Connect only mssql
  if not (Connection is TMsSqlConnection) then
    exit;
  try
    ADOConnection1.ConnectionString := Connection.GetConnectionString;
    ADOConnection1.Connected := True;
    StatusBar1.Panels[0].Text := '  Ado Connected...';
  except
    on E: Exception do
      StatusBar1.Panels[0].Text := '  An error occured...';
  end;

end;

procedure TfrmMain.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  if ADOConnection1.Connected then
    ADOConnection1.Close;
  CanClose := True;
end;

end.


program CustomConnectionSample;

uses
  Vcl.Forms,
  Main in 'Main.pas' {frmMain},
  Connections in 'Connections.pas',
  ConnectionService in 'ConnectionService.pas';

{$R *.res}

begin
  ReportMemoryLeaksOnShutdown := True;
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmMain, frmMain);
  Application.Run;
end.


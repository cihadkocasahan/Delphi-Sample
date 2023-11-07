unit ConnectionService;

interface

uses
  Connections;

type
  IConnectionStringService = interface
    ['{9A6BC34E-A077-4EE2-A7C6-5A72FB892980}']
  end;

  TConnectionStringService = class(TInterfacedObject, IConnectionStringService)
    class function Getconnection(ConnectionName: string): Iconnection;
  end;

implementation

{ TconnectionService }

class function TConnectionStringService.Getconnection(ConnectionName: string): Iconnection;
begin
  if ConnectionName = 'MS Sql' then
  begin
    result := TMsSqlConnection.Create;
  end;
  if ConnectionName = 'Sqlite' then
  begin
    result := TSqlLiteConnection.Create;
  end;
  if ConnectionName = 'Mysql' then
  begin
    result := TMySqlConnection.Create;
  end;
  if ConnectionName = 'PostgreSql' then
  begin
    result := TPostgreSqlConnection.Create;
  end;
end;

end.


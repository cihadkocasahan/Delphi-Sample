unit Connections;

interface

uses
  System.SysUtils;

type
  TCustomConnection = class;

  ICustomConnection = interface(IInvokable)
    ['{27FB5485-E027-4679-8F6B-F72F975B1766}']
    function GetDatabase: string;
    procedure SetDatabase(const Value: string);
    function GetUsername: string;
    procedure SetUSername(const Value: string);
    function GetPassword: string;
    procedure SetPassword(const Value: string);
    function GetConnectionString: string;
    procedure SetConnectionString(const Value: string);
    function GetServer: string;
    procedure SetServer(const Value: string);
    property Database: string read GetDatabase write SetDatabase;
    property Username: string read GetUsername write SetUsername;
    property Password: string read GetPassword write SetPassword;
    property Server: string read GetServer write SetServer;
  end;

  TCustomConnection = class(TInterfacedObject, ICustomConnection)
    fDatabase: string;
    fUsername: string;
    fPassword: string;
    fConnectionString: string;
    fServer: string;
  private
    function GetDatabase: string;
    procedure SetDatabase(const Value: string);
    function GetUsername: string;
    procedure SetUSername(const Value: string);
    function GetPassword: string;
    procedure SetPassword(const Value: string);
    function GetConnectionString: string;
    procedure SetConnectionString(const Value: string);
    function GetServer: string;
    procedure SetServer(const Value: string);
  public
    property Database: string read GetDatabase write SetDatabase;
    property Username: string read GetUsername write SetUsername;
    property Password: string read GetPassword write SetPassword;
    property Server: string read GetServer write SetServer;
    property ConnectionString: string read GetConnectionString write SetConnectionString;
  end;

  IConnection = interface(ICustomConnection)
    ['{F6643BD2-6392-47EE-8C3A-7306A293842E}']
    function GetConnectionString: string;
  end;

  TMsSqlConnection = class(TCustomConnection, IConnection)
    function GetConnectionString: string;
  end;

  TSqlLiteConnection = class(TCustomConnection, IConnection)
    function GetConnectionString: string;
  end;

  TMySqlConnection = class(TCustomConnection, IConnection)
    function GetConnectionString: string;
  end;

  TPostgreSqlConnection = class(TCustomConnection, IConnection)
  private
    ftimeout: integer;
    function GetTimeout: integer;
    procedure SetTimeout(const Value: integer);
  public
    property Timeout: integer read GetTimeout write SetTimeout;
    function GetConnectionString: string;
  end;

implementation

{ TCustomConnection }

function TCustomConnection.GetConnectionString: string;
begin
  Result := fConnectionString;
end;

function TCustomConnection.GetDatabase: string;
begin
  Result := fDatabase;
end;

function TCustomConnection.GetPassword: string;
begin
  Result := fPassword;
end;

function TCustomConnection.GetServer: string;
begin
  Result := fServer;
end;

function TCustomConnection.GetUsername: string;
begin
  Result := fUsername;
end;

procedure TCustomConnection.SetConnectionString(const Value: string);
begin
  fConnectionString := Value;
end;

procedure TCustomConnection.SetDatabase(const Value: string);
begin
  fDatabase := Value;
end;

procedure TCustomConnection.SetPassword(const Value: string);
begin
  fpassword := Value;
end;

procedure TCustomConnection.SetServer(const Value: string);
begin
  Fserver := Value;
end;

procedure TCustomConnection.SetUsername(const Value: string);
begin
  fUsername := Value;
end;

{ TMsSqlConnection }

function TMsSqlConnection.GetConnectionString: string;
begin
  result := 'Provider=SQLOLEDB.1;Password=' + Password + ';Persist Security Info=True;User ID=' + username +
    ';Initial Catalog=' + database + ';Data Source=' + Server;
end;

{ TSqlLiteConnection }

function TSqlLiteConnection.GetConnectionString: string;
begin
  result := 'Data Source=' + Database + ';Version=3;Password=' + Password + ';';
end;

{ TMySqlConnection }

function TMySqlConnection.GetConnectionString: string;
begin
  result := 'Server=' + Server + ';Database=' + Database + ';Uid=' + Username + ';Pwd=' + Password + ';';
end;

{ TPostgreSqlConnection }

function TPostgreSqlConnection.GetConnectionString: string;
begin
  Result := 'Provider;Data Source=' + Server + ';location=' + Database + ';User ID=' + username + ';password=' +
    password + ';timeout=' + Timeout.tostring + ';';
end;

function TPostgreSqlConnection.GetTimeout: integer;
begin
  if fTimeout = 0 then
    fTimeout := 1000;
  result := fTimeout;
end;

procedure TPostgreSqlConnection.SetTimeout(const Value: integer);
begin
  fTimeout := Value;
end;

end.


unit DataMoudle;

interface

uses
  SysUtils, Classes, DB, ADODB, ActiveX, ComObj, IniFiles;

type
  TDataModule2 = class(TDataModule)
    ADOConnection1: TADOConnection;
    ADOCZXXT: TADOConnection;
    qry1: TADOQuery;
    procedure DataModuleCreate(Sender: TObject);
    procedure DataModuleDestroy(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    var
      dbName : String;
  end;

var
  DataModule2: TDataModule2;

implementation


{$R *.dfm}


const
   XorKey: array[0..7] of Byte = ($B2, $09, $BB, $55, $93, $6D, $44, $47); //×Ö·û´®¼ÓÃÜÓÃ

function Dec(Str: string): string; //×Ö·û½âÃÜº¯”µ
var
   i, j: Integer;
begin
   Result := '';
   j := 0;
   for i := 1 to Length(Str) div 2 do
   begin
      Result := Result + Char(StrToInt('$' + Copy(Str, i * 2 - 1, 2)) xor XorKey[j]);
      j := (j + 1) mod 8;
   end;
end;

procedure TDataModule2.DataModuleCreate(Sender: TObject);
var
  MyIni : Tinifile;
  DBip, dbUser, dbPWD : String;
begin
  Myini := TInifile.Create(ExtractFilePath(paramstr(0))+'Config.ini');
  Try
    DBip := Myini.ReadString('ServerInfo','SQLIP','');
    dbUser := Dec(Myini.ReadString('ServerInfo','SQLUser',''));
    dbPWD := Dec(MyIni.ReadString('ServerInfo','SQLPWD',''));
    dbName := Dec(Myini.ReadString('ServerInfo','DBNAME',''));

    ADOConnection1.Close;
    ADOConnection1.ConnectionString:='Provider=SQLOLEDB.1;Persist Security Info=True;'+
    'User ID=' +Trim(dbUser)+ ';Password=' +dbPWD+';Initial Catalog='+dbName+';Data Source=' +Trim(DBip);
    Try
      ADOConnection1.Connected:=True;
    except
      ADOConnection1.Connected:= False;
    End;
  Finally
    Myini.Free;
  End;
end;

procedure TDataModule2.DataModuleDestroy(Sender: TObject);
begin
  ADOConnection1.Close;
  ADOCZXXT.Close;
end;

initialization
  CoInitialize(Nil);
  DataModule2 := TDataModule2.Create(Nil);
finalization
  DataModule2.Free;
  CoUninitialize;
end.

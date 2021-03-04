unit Unit_Function;

interface

uses Windows,DataMoudle,SysUtils, Forms;

var
  sTemppath : string;

function InsertLog(iDate:TDateTime;iOper,iContent:string):Boolean;     //��¼��־
function IsFileInUse(fName : string) : boolean; //�ж��ļ��Ƿ����ڱ�ʹ��
procedure deleTempFile;                                                //ɾ����ʱ�ļ�


implementation

function InsertLog(iDate:TDateTime;iOper,iContent:string):Boolean;
begin
  try
   with DataModule2.qry1 do
   begin
     close;
     sql.Clear;
     SQL.Add('exec InsertLog :OperTime,:Oper, :Operation');
     Parameters.ParamByName('Opertime').Value := iDate;
     Parameters.ParamByName('Oper').Value := iOper;
     Parameters.ParamByName('Operation').Value := iContent;
     ExecSQL;
     Close;
   end;
   Result := True;
  except
   Result := False;
  end;
end;

function IsFileInUse(fName: string): boolean; //�ж��ļ��Ƿ����ڱ�ʹ��    true=����
var
   HFileRes : HFILE;
begin
   Result := false; //����ֵΪ��(���ļ�����ʹ��)
   if not FileExists(fName) then exit; //����ļ����������˳�
   HFileRes := CreateFile(pchar(fName), GENERIC_READ or GENERIC_WRITE,
               0 {this is the trick!}, nil, OPEN_EXISTING, FILE_ATTRIBUTE_NORMAL, 0);
   Result := (HFileRes = INVALID_HANDLE_VALUE); //���CreateFile����ʧ�� ��ôResultΪ��(���ļ����ڱ�ʹ��)
   if not Result then //���CreateFile���������ǳɹ�
   CloseHandle(HFileRes);   //��ô�رվ��
end;

procedure deleTempFile; //�����ʱ�ļ�Ŀ¼
var
  searchREC :TSearchRec;
begin
  if Not DirectoryExists(ExtractFilePath(Application.ExeName)+'tempfile') then
  begin
    CreateDir(ExtractFilePath(Application.ExeName)+'tempfile');
  end;
  sTemppath := ExtractFilePath(Application.ExeName)+'tempfile\';
  try
  if FindFirst(sTemppath+'*.*',faAnyFile,searchREC)=0 then
  begin
    DeleteFile(sTemppath+searchREC.Name);
    while FindNext(searchREC)=0 do
    DeleteFile(sTemppath+searchREC.Name);
    FindClose(searchREC);
  end;
  finally
  end;
end;

end.

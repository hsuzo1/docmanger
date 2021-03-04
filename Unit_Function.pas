unit Unit_Function;

interface

uses Windows,DataMoudle,SysUtils, Forms;

var
  sTemppath : string;

function InsertLog(iDate:TDateTime;iOper,iContent:string):Boolean;     //记录日志
function IsFileInUse(fName : string) : boolean; //判断文件是否正在被使用
procedure deleTempFile;                                                //删除临时文件


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

function IsFileInUse(fName: string): boolean; //判断文件是否正在被使用    true=在用
var
   HFileRes : HFILE;
begin
   Result := false; //返回值为假(即文件不被使用)
   if not FileExists(fName) then exit; //如果文件不存在则退出
   HFileRes := CreateFile(pchar(fName), GENERIC_READ or GENERIC_WRITE,
               0 {this is the trick!}, nil, OPEN_EXISTING, FILE_ATTRIBUTE_NORMAL, 0);
   Result := (HFileRes = INVALID_HANDLE_VALUE); //如果CreateFile返回失败 那么Result为真(即文件正在被使用)
   if not Result then //如果CreateFile函数返回是成功
   CloseHandle(HFileRes);   //那么关闭句柄
end;

procedure deleTempFile; //清空临时文件目录
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

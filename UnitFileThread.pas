unit UnitFileThread;

interface

uses
  windows,SysUtils,Classes, Dialogs,ADODB,db, ActiveX;

type
  TQueryThread = class(TThread)
  private
    Fscon,FSid,FFname,FsOrder: string; //传递的信息   连接串，记录唯一编号，文件名称，是否正文（0）
    FAdoQuery:TAdoQuery; //动态生成的表一,表2
    Fadoconnection:TAdoconnection; //动态生成的连接

    Destructor FormDestroy;
    Protected
    procedure Execute; override;
    public
      constructor create(scon,Sid,Fname,sOrder:string);

    end;


implementation

constructor TQueryThread.create(scon,Sid,Fname,sOrder: string);
begin
  CoInitialize( nil );//使用com对象必须要初始化
  inherited create(false);
  FreeOnTerminate:=true;
  Fscon := scon;
  FSid:=Sid;
  FFname:=Fname;
  FsOrder:=sOrder;


  FAdoQuery:=TAdoQuery.Create(nil); //动态生成表一
  Fadoconnection:=Tadoconnection.Create(nil);//动态生成的连接
  Fadoconnection.LoginPrompt :=false;
  Fadoconnection.KeepConnection :=true;
  Fadoquery.Connection:=Fadoconnection;
  Fadoconnection.ConnectionString := scon;
end;

destructor TQueryThread.FormDestroy;
begin
  FAdoQuery.FREE;
  Fadoconnection.Free;
  CoUnInitialize;//必须使用
  inherited destroy;
end;

procedure TQueryThread.Execute;
var
  Stream : TMemoryStream;
begin
  CoInitialize( nil );
  FreeOnTerminate := True;
  try
    begin
//      extractinfor(FSid); //进行信息提取
//      Synchronize(ShellexeQuery);
    end;
   With FAdoQuery do
   begin
    Close;
    SQL.Clear;
    SQL.Add('Select top 1 * From FileTable Where fieldID='+FSid);
    Open;
    //判断是否已有记录
    if FAdoQuery.RecordCount = 0 then
    begin
      //插入新数据
      Close;
      SQL.Clear;
      SQL.Add('Select top 1 * From FileTable ');
      Open;
      Append;
      FieldByName('fieldid').AsString := FSid;
    end
    else
    begin
      //更新数据内容
      Close;
      SQL.Clear;
      SQL.Add('Select * from FileTable Where fieldID='+FSid);
      open;
      Edit;
    end;
      FieldByName('filename'+Trim(FsOrder)).AsString := ExtractFileName(FFname);
      Stream := TMemoryStream.Create;
      Stream.LoadFromFile(FFname);
      Stream.Position := 0;
      TBlobField(FAdoQuery.FieldByName('fileblob'+Trim(FsOrder))).LoadFromStream(Stream);
      Post;
      Stream.Free;
   end;
   FormDestroy;
  except
    self.Terminate;
    FormDestroy;
  end;
  CoUnInitialize;
end;


end.

unit UnitFileThread;

interface

uses
  windows,SysUtils,Classes, Dialogs,ADODB,db, ActiveX;

type
  TQueryThread = class(TThread)
  private
    Fscon,FSid,FFname,FsOrder: string; //���ݵ���Ϣ   ���Ӵ�����¼Ψһ��ţ��ļ����ƣ��Ƿ����ģ�0��
    FAdoQuery:TAdoQuery; //��̬���ɵı�һ,��2
    Fadoconnection:TAdoconnection; //��̬���ɵ�����

    Destructor FormDestroy;
    Protected
    procedure Execute; override;
    public
      constructor create(scon,Sid,Fname,sOrder:string);

    end;


implementation

constructor TQueryThread.create(scon,Sid,Fname,sOrder: string);
begin
  CoInitialize( nil );//ʹ��com�������Ҫ��ʼ��
  inherited create(false);
  FreeOnTerminate:=true;
  Fscon := scon;
  FSid:=Sid;
  FFname:=Fname;
  FsOrder:=sOrder;


  FAdoQuery:=TAdoQuery.Create(nil); //��̬���ɱ�һ
  Fadoconnection:=Tadoconnection.Create(nil);//��̬���ɵ�����
  Fadoconnection.LoginPrompt :=false;
  Fadoconnection.KeepConnection :=true;
  Fadoquery.Connection:=Fadoconnection;
  Fadoconnection.ConnectionString := scon;
end;

destructor TQueryThread.FormDestroy;
begin
  FAdoQuery.FREE;
  Fadoconnection.Free;
  CoUnInitialize;//����ʹ��
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
//      extractinfor(FSid); //������Ϣ��ȡ
//      Synchronize(ShellexeQuery);
    end;
   With FAdoQuery do
   begin
    Close;
    SQL.Clear;
    SQL.Add('Select top 1 * From FileTable Where fieldID='+FSid);
    Open;
    //�ж��Ƿ����м�¼
    if FAdoQuery.RecordCount = 0 then
    begin
      //����������
      Close;
      SQL.Clear;
      SQL.Add('Select top 1 * From FileTable ');
      Open;
      Append;
      FieldByName('fieldid').AsString := FSid;
    end
    else
    begin
      //������������
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

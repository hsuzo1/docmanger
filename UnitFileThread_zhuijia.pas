unit UnitFileThread_zhuijia;

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
    SQL.Add('Select top 1 * From Zhuijia_FileTable Where fieldID='+FSid);
    Open;
    //�ж��Ƿ����м�¼
    if FAdoQuery.RecordCount = 0 then
    begin
      //����������
      Close;
      SQL.Clear;
      SQL.Add('Select top 1 * From Zhuijia_FileTable ');
      Open;
      Append;
      FieldByName('fieldid').AsString := FSid;
    end
    else
    begin
      //������������
      Close;
      SQL.Clear;
      SQL.Add('Select * from Zhuijia_FileTable Where fieldID='+FSid);
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


{
procedure TfrmFilehost.Appendfile(sFlag:integer);//�����ļ�
var
  sName,sMark,sOrd:string;
  sID,sN : string;
begin
  if qry2.Active = False then exit;
  if sFlag=0 then
  begin
    sName := '�����ĵ�';
    sMark := '������';
    sOrd  := '';
  end
  else
  begin
    sName := '�����ĵ�';
    sMark := '�и���';
    sOrd  := '1';
  end;
  tmr1_updateGrid.Enabled := False;
  if Trim(qry2.FieldByName(sName).AsString)=sMark then
  begin
    if MessageDlg('���С� '+sName+' ������ȷʵҪ�ϴ�����TA��',mtinformation,[mbyes,mbno],0) = id_no then Exit;
  end;
  if dlgOpen1.Execute then
  begin
    try
      if IsFileInUse(dlgOpen1.FileName)=True then
      begin
        ShowMessage('�ļ����ڱ���������ʹ�ã����ȹر��ļ������ԡ�');
        exit;
      end;
      sID := Trim(qry2.Fields[0].AsString);
      sN  := Trim(dlgOpen1.FileName);
      uploadfile(sID,sN,sOrd);
      with qry1 do
      begin
       Close;
       sql.Clear;
       sql.Add('Update maininfo Set mainfile'+sOrd+'='+QuotedStr(sMark)+' Where fileID='+qry2.Fields[0].AsString);
       ExecSQL;
      end;
    except
      qry1.CancelUpdates;
      ShowMessage('�ϴ�ʧ��');
      tmr1_updateGrid.Enabled := True;
      Exit;
    end;
    Unit_Function.InsertLog(Now,ADuser,'�ϴ��ļ���' + sID + ExtractFileName(sN));
    qry2.Requery;
    ShowMessage('�ϴ��ɹ���');
    tmr1_updateGrid.Enabled := True;
  end;
end;




  //�ϴ������ļ�
    if Trim(edt_uploadfile1.Text)<>'' then
     begin
       uploadfile('9'+Trim(sID),edt_uploadfile1.Text,'');  //'9'��ʾ�ϼ�׷���ļ�
       sAttach := '������';
     end;
    //�ϴ���������
    if Trim(edt_uploadfile2.Text)<>'' then
     begin
       uploadfile('9'+Trim(sID),edt_uploadfile1.text,'1');
       sAttach1 := '�и���';
     end;



    //�ϴ���������
    if Trim(edt_uploadfile1.Text)<>'' then
     begin
       uploadfile('7'+Trim(sID),edt_uploadfile1.Text,'');  //'7'��ʾ�������ļ�
       sAttach := '������';
     end;
    if Trim(edt_uploadfile2.Text)<>'' then
     begin
       uploadfile('7'+Trim(sID),edt_uploadfile1.text,'1');
       sAttach1 := '�и���';
     end;





}


end.

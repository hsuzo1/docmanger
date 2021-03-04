unit UnitFileThread_zhuijia;

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
    SQL.Add('Select top 1 * From Zhuijia_FileTable Where fieldID='+FSid);
    Open;
    //判断是否已有记录
    if FAdoQuery.RecordCount = 0 then
    begin
      //插入新数据
      Close;
      SQL.Clear;
      SQL.Add('Select top 1 * From Zhuijia_FileTable ');
      Open;
      Append;
      FieldByName('fieldid').AsString := FSid;
    end
    else
    begin
      //更新数据内容
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
procedure TfrmFilehost.Appendfile(sFlag:integer);//补传文件
var
  sName,sMark,sOrd:string;
  sID,sN : string;
begin
  if qry2.Active = False then exit;
  if sFlag=0 then
  begin
    sName := '正文文档';
    sMark := '有正文';
    sOrd  := '';
  end
  else
  begin
    sName := '附件文档';
    sMark := '有附件';
    sOrd  := '1';
  end;
  tmr1_updateGrid.Enabled := False;
  if Trim(qry2.FieldByName(sName).AsString)=sMark then
  begin
    if MessageDlg('已有【 '+sName+' 】！您确实要上传覆盖TA吗？',mtinformation,[mbyes,mbno],0) = id_no then Exit;
  end;
  if dlgOpen1.Execute then
  begin
    try
      if IsFileInUse(dlgOpen1.FileName)=True then
      begin
        ShowMessage('文件正在被其他程序使用，请先关闭文件后再试。');
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
      ShowMessage('上传失败');
      tmr1_updateGrid.Enabled := True;
      Exit;
    end;
    Unit_Function.InsertLog(Now,ADuser,'上传文件：' + sID + ExtractFileName(sN));
    qry2.Requery;
    ShowMessage('上传成功！');
    tmr1_updateGrid.Enabled := True;
  end;
end;




  //上传正文文件
    if Trim(edt_uploadfile1.Text)<>'' then
     begin
       uploadfile('9'+Trim(sID),edt_uploadfile1.Text,'');  //'9'表示上级追加文件
       sAttach := '有正文';
     end;
    //上传其他附件
    if Trim(edt_uploadfile2.Text)<>'' then
     begin
       uploadfile('9'+Trim(sID),edt_uploadfile1.text,'1');
       sAttach1 := '有附件';
     end;



    //上传其他附件
    if Trim(edt_uploadfile1.Text)<>'' then
     begin
       uploadfile('7'+Trim(sID),edt_uploadfile1.Text,'');  //'7'表示本级表文件
       sAttach := '有正文';
     end;
    if Trim(edt_uploadfile2.Text)<>'' then
     begin
       uploadfile('7'+Trim(sID),edt_uploadfile1.text,'1');
       sAttach1 := '有附件';
     end;





}


end.

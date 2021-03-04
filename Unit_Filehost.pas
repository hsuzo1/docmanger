unit Unit_Filehost;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes,  Controls, Forms,
  Dialogs, ActiveX, StdCtrls, ExtCtrls, DBGridEhGrouping, GridsEh, DBGridEh,
  ComCtrls, Buttons, DB, ADODB,ShellAPI, Menus, IniFiles, ToolCtrlsEh,
  DBGridEhToolCtrls, DynVarsEh, EhLibVCL, DBAxisGridsEh, IdBaseComponent,
  IdComponent, IdTCPConnection, IdTCPClient, IdExplicitTLSClientServerBase,
  IdFTP;

type
  TfrmFilehost = class(TForm)
    pnl1: TPanel;
    btn1: TButton;
    pnl2: TPanel;
    dbgrdh1: TDBGridEh;
    dlgOpen1: TOpenDialog;
    ds1: TDataSource;
    qry2: TADOQuery;
    pm1: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    tmr1_updateGrid: TTimer;
    spl1: TSplitter;
    qry1: TADOQuery;
    lbl9: TLabel;
    cbb4: TComboBox;
    lbl1: TLabel;
    cbb1: TComboBox;
    edt3: TEdit;
    edt4: TEdit;
    lbl2: TLabel;
    lbl7: TLabel;
    cbb3: TComboBox;
    lbl4: TLabel;
    cbb5: TComboBox;
    lbl5: TLabel;
    dtp1: TDateTimePicker;
    lbl6: TLabel;
    cbb2: TComboBox;
    btn_Find: TSpeedButton;
    lbl3: TLabel;
    lbl8: TLabel;
    lbl10: TLabel;
    lbl20: TLabel;
    edt8: TEdit;
    edt7: TEdit;
    edt6: TEdit;
    edt5: TEdit;
    btn2: TSpeedButton;
    btn5: TSpeedButton;
    btn3: TButton;
    btn_Modi: TButton;
    btn_Dele: TBitBtn;
    lbl11: TLabel;
    lbl_xxgk: TLabel;
    cbb_xxgk: TComboBox;
    btn_AddCreater: TSpeedButton;
    idftp2: TIdFTP;
    procedure btn1Click(Sender: TObject);
    procedure btn2Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btn3Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure dbgrdh1DblClick(Sender: TObject);
    procedure edt3Change(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure cbb1DropDown(Sender: TObject);
    procedure cbb2DropDown(Sender: TObject);
    procedure cbb5DropDown(Sender: TObject);
    procedure edt3Enter(Sender: TObject);
    procedure edt5Exit(Sender: TObject);
    procedure btn_DeleClick(Sender: TObject);
    procedure edt3KeyPress(Sender: TObject; var Key: Char);
    procedure edt4KeyPress(Sender: TObject; var Key: Char);
    procedure btn_ModiClick(Sender: TObject);
    procedure tmr1_updateGridTimer(Sender: TObject);
    procedure edt4Enter(Sender: TObject);
    procedure dbgrdh1TitleBtnClick(Sender: TObject; ACol: Integer;
      Column: TColumnEh);
    procedure cbb1CloseUp(Sender: TObject);
    procedure btn_FindClick(Sender: TObject);
    procedure cbb1Change(Sender: TObject);
    procedure cbb2Click(Sender: TObject);
    procedure btn_AddCreaterClick(Sender: TObject);
  private
    { Private declarations }
    var
    sTemppath,sAdmin{是否文管员},ADuser{用户},OperDept {部门名称}, sFileID{记录序号} : string;
    sFileHeader : string; //要锁定连续编号的文号
    findstate : Boolean;   //使用快速检索的状态

   function  IsFileInUse(fName : string) : boolean; //判断文件是否正在被使用
   function  CkInsertRec: Boolean; //检查新增记录时填写要素是否有效

//   function  py(x:String) : Char;           //获取拼音简码
   procedure showdata(qry: TADOQuery;recnum:Integer);  //刷新数据
   procedure uploadfile(Sid,Fname,sOrder:string);        //上传文件
   procedure Appendfile(sFlag:Integer);//补传文件
   procedure deleTempFile;
   procedure getfilenum;//自动编排文号序号
   procedure getfileid; //自动编排唯一记录标识号
   procedure updateDict(sID : integer); //更新枚举字典

  public
    { Public declarations }
    var
    sFTPSavePath : string;
    procedure CreateFTPDir;// 按年月建立存放目录，进入当月的目录。

  end;

var
  frmFilehost: TfrmFilehost;

implementation

uses ComObj,UnitFileThread,Unit_FileHost_Edit ,DataMoudle,Unit_Function;

{$R *.dfm}

function TfrmFilehost.IsFileInUse(fName : string) : boolean; //判断文件是否正在被使用
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

{function  TfrmFilehost.py; //获取拼音简码
begin
  case Word(x[1]) shl 8 +Word(x[2]) of
      $B0A1..$B0C4 : Result :='A';
      $B0C5..$B2C0 : Result :='B';
      $B2C1..$B4ED : Result :='C';
      $B4EE..$B6E9 : Result :='D';
      $B6EA..$B7A1 : Result :='E';
      $B7A2..$B8C0 : Result :='F';
      $B8C1..$B9FD : Result :='G';
      $B9FE..$BBF6 : Result :='H';
      $BBF7..$BFA5 : Result :='J';
      $BFA6..$C0AB : Result :='K';
      $C0AC..$C2E7 : Result :='L';
      $C2E8..$C4C2 : Result :='M';
      $C4C3..$C5B5 : Result :='N';
      $C5B6..$C5BD : Result :='O';
      $C5BE..$C6D9 : Result :='P';
      $C6DA..$C8BA : Result :='Q';
      $C8BB..$C8F5 : Result :='R';
      $C8F6..$CBF9 : Result :='S';
      $CBFA..$CDD9 : Result :='T';
      $CDDA..$CEF3 : Result :='W';
      $CEF4..$D1B8 : Result :='X';
      $D1B9..$D4D0 : Result :='Y';
      $D4D1..$D7F9 : Result :='Z';
  else
      Result := char(32);  //返回空值
  end;
end;
}

function TfrmFilehost.CkInsertRec; //检查新增发文有关要素的有效性
begin
  Result := True;
  if (Trim(cbb1.Text) = '') then
  begin
    ShowMessage('请录入文件的字号，如不确定请选“无”');
    Result:=False;
    Exit;
  end;
  if ((Trim(edt3.Text)='') OR (Trim(edt4.Text)='')) OR (StrToInt(edt3.Text)>strtoint(FormatDateTime('YYYY',Now)))  then
  begin
    ShowMessage('请录入正确的文件年份、字号');
    Result:=False;
    Exit;
  end;
  if (Trim(edt3.Text) <>'') and ((StrToInt(edt3.Text)<2000) OR (StrToInt(edt3.Text)>2026))  then
  begin
    ShowMessage('请检查发文字号中的年份');
    Result:=False;
    Exit;
  end;
  if strtoint(FormatDateTime('YYYYMMDD',dtp1.date)) <= 20000101 then
  begin
    ShowMessage('请检查文件印发日期');
    Result:=False;
    Exit;
  end;
  if (Trim(edt5.Text) = '') or (Trim(cbb5.Text) = '') OR (Trim(cbb2.Text) = '') then
  begin
    ShowMessage('必须有文件的标题、拟稿人、主送单位');
    Result:=False;
    Exit;
  end;
  if (Trim(edt7.Text)<>'') and (IsFileInUse(Trim(edt7.Text))=true) then
  begin
    ShowMessage('文件正在被其他程序使用，请先关闭文件后再试。');
    Result:=False;
    Exit;
  end;
  if (Trim(edt8.Text)<>'') and (IsFileInUse(Trim(edt8.Text))=true) then
  begin
    ShowMessage('附件正在被其他程序使用，请先关闭文件后再试。');
    Result:=False;
    Exit;
  end;
end;

procedure TfrmFilehost.CreateFTPDir;
var
 sYear,sMonth: string;
begin
  if not idftp2.Connected then
  begin
    with idftp2 do
    begin
      try
        Username := 'admin';
        Password := 'ys11000011nn';
        Host := '10.56.96.241';
        Port := 2121;
        Connect;
      except
        Application.MessageBox('FTP服务器连接失败!','警告');
      end;
    end;
  end;
 sYear :=formatdatetime('YYYY',now);
 sMonth :=formatdatetime('MM',now);
 idftp2.ChangeDir('/');   //确保从FTP根目录开始设立目录结构
 //建立总目录 filehost
 try
   idftp2.MakeDir('filehost');
 except
 end;
 try
   idftp2.ChangeDir('filehost');
 except
 end;
 //按年月建立文件存放目录
  try
    idftp2.MakeDir(sYear); //建立“年”名称目录
  except;
  end;
  try
    idftp2.ChangeDir(sYear); //进入“年”目录
    idftp2.MakeDir(sMonth);
  except
  end;
  try
    idftp2.ChangeDir(sMonth);
  except
  end;
  sFTPSavePath := idftp2.RetrieveCurrentDir;
end;

procedure TfrmFilehost.deleTempFile; //清空临时文件目录
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

procedure TfrmFilehost.Showdata(qry: TADOQuery;recnum:Integer);   //刷新显示数据结果
begin
 Try
  DataModule2.ADOConnection1.Connected := True;
  with qry do
  begin
    Close;
    sql.Clear;
    sql.Add('select top '+ IntToStr(recnum)+' fileid as 编号,'
    +'filenumber as 发文字号,miji as 密级,title as 文件标题,sendto as 主送单位,'
    +'creater as 拟稿人,crtime as 印发日期,xxgk as 公开选项,mainfile as 正文文档,mainfile1 as 附件文档,'
    +'memo1 as 备注 from Maininfo where (operdept='+QuotedStr(OperDept)+') order by fileid Desc');
    open;
  end;
 except On E:Exception do
   ShowMessage(E.Message);
 end;
end;

procedure TfrmFilehost.tmr1_updateGridTimer(Sender: TObject);//自动刷新结果集
var
BookMark : TBookMark;
begin
  if (qry2.Active) And (dbgrdh1.RowCount > 1) then
  begin
    BookMark := qry2.GetBookmark;
    qry2.DisableControls;
    qry2.Requery;
    qry2.GotoBookmark(BookMark);
    qry2.EnableControls;
    qry2.FreeBookmark(BookMark);
  end;
end;

procedure TfrmFilehost.uploadfile(Sid,Fname,sOrder:string);  //上传文件
var
  ADOThread : TQueryThread;
begin
  Try
    Screen.Cursor := crHourGlass;
    ADOThread := TQueryThread.create(DataModule2.ADOConnection1.ConnectionString,sid,FName,sOrder);
  except
    Screen.Cursor := crDefault
  End;
    Screen.Cursor := crDefault
end;

procedure TfrmFilehost.getfileid;  //设定文件唯一标识的编号
begin
  with qry1 do
  begin
    Close;
    sql.Clear;
    sql.Add('select Max(fileid) as id from maininfo where Left(fileid,4)='+Quotedstr(formatdatetime('YYYY',Now())));
    open;
  end;
  if qry1.FieldByName('id').Value = null then
     sFileID := formatdatetime('YYYY',Now())+ '0001'
  else
     sFileID := IntToStr(qry1.FieldByName('id').AsInteger + 1);
end;

procedure TfrmFilehost.btn1Click(Sender: TObject);
begin
  Close;
end;

procedure TfrmFilehost.btn2Click(Sender: TObject);  //显示正文文件体积
var
  f : file of  Byte;
  Size : LongInt;
  s : string;
begin
  if dlgOpen1.Execute then
  begin
    edt7.Text := dlgOpen1.FileName;
    Assignfile(f,dlgOpen1.FileName);
    Reset(f);
    try
      size := FileSize(f) div 1024;
      S:= 'Size:' + IntToStr(size) + 'KB';
      lbl11.Caption := s;
    finally
      Closefile(F);
    end;
  end;
end;


procedure TfrmFilehost.btn3Click(Sender: TObject);    //添加数据
var
  sAttach,sAttach1: string;
begin
  if CkInsertRec = False then Exit;
  sAttach  := '无';
  sAttach1 := '无';
  //查询文号是否重号
  with qry1 do
  begin
    Close;
    sql.Clear;
    sql.add('select fileid from maininfo where filenumber='''+trim(cbb1.Text) +'['
              + trim(edt3.Text) +']' +Trim(edt4.Text) + '号''');
    open;
  end;
  if qry1.RecordCount>0 then
  begin
    if Pos(Trim(cbb1.Text),sFileHeader)<>0 then
    begin
      getfilenum;
      MessageBox(Handle,PChar('您使用的文号属于需要连续编号的文号，系统检查该文号刚刚已被使用，您的文号将修改为：' +#13#13
                 + trim(cbb1.Text) + '[' + trim(edt3.Text) +']' + Trim(edt4.Text) + '号'),
                 '公文管理',mb_IconInformation+mb_OK);
    end
    else
    begin
      ShowMessage('您录入的文号在系统中已存在，请修改。');
      edt4.SetFocus;
      exit;
    end;
  end;
  getfileid;//获取记录序号
  DataModule2.ADOConnection1.BeginTrans;
  try
    //上传正文文件
    if Trim(edt7.Text)<>'' then
     begin
       uploadfile(Trim(sFileID),edt7.text,'');
       sAttach := '有正文';
     end;
    //上传其他附件
    if Trim(edt8.Text)<>'' then
     begin
       uploadfile(Trim(sFileID),edt8.text,'1');
       sAttach1 := '有附件';
     end;

    //更新主表信息
    with qry1 do
    begin
      Close;
      sql.Clear;
      sql.Add('insert into maininfo (fileid,filenumber,miji,title,sendto,ftype,'
      +'creater,crtime,xxgk,mainfile,mainfile1,memo1,operdept,operuser ) values ( '''+Trim(sFileID)+''','''  //标识号
      +trim(cbb1.Text) +'[' + trim(edt3.Text) +']' +Trim(edt4.Text) + '号'',''' //文号
      + Trim(cbb4.Text) +''','''           //密级
      + Trim(edt5.Text)+''','''            //标题
      + Trim(cbb2.Text)+''','''            //主送单位
      + Trim(cbb3.Text)+''','''            //文种
      + Trim(cbb5.Text)+''','''            //拟稿人
      + DateToStr(dtp1.Date)+''','''       //发文日期
      + trim(cbb_xxgk.Text)+''','''        //信息公开选项 0-主动公开 1-依申请公开 2-不予公开
      + sAttach  +''','''                  //是否有正文电子文档
      + sAttach1 +''','''                  //是否有附件
      + Trim(edt6.text)+''','''            //备注
      + OperDept +''','''                  //操作员所属部门科室
      + ADuser +''')');                    //操作人员信息
      ExecSQL;
    end;
  //更新数据库字典：文件字号头wenhao,主送单位sendto
  with qry1 do
  begin
    Close;
    sql.Clear;
    sql.Add('exec updateDict ''sendto'','+Quotedstr(Trim(cbb2.text)));     //更新主送单位目录
    execsql;
  end;

    Application.MessageBox('保存成功！','公文管理',0+64);
    DataModule2.ADOConnection1.CommitTrans;
  except on E:Exception do
    begin
    ShowMessage('上传文件出错，请检查：'+e.Message);
    DataModule2.ADOConnection1.rollbacktrans;
    sAttach := '无';
    Exit;
    end;
  end;

  edt5.SetFocus;
  edt4.Text := inttostr(strtoint(edt4.Text)+1);
  edt5.Clear;
  edt6.Clear;
  edt7.Clear;
  edt8.clear;
  cbb2.Clear;
  cbb3.ItemIndex := -1;
//  cbb5.Clear;
  lbl11.Caption :='  ';
  //刷新数据
  showdata(qry2,25);

end;

procedure TfrmFilehost.btn_AddCreaterClick(Sender: TObject);
{新增拟稿人}
begin
  updateDict(2);
  cbb5.Clear;
end;

procedure TfrmFilehost.btn_DeleClick(Sender: TObject);  //删除记录
begin
  if qry2.Active = False then exit;
  if sAdmin <> 'Y'  then
  begin
    ShowMessage('您不能删除该文档，请联系文档管理员。');
    exit;
  end;
  with qry1 do
  begin
    Close;
    sql.Clear;
    sql.add('Select Top 1 fileID from Maininfo Where fileNumber like '''+sFileHeader+'%'' Order by fileID Desc'); //需要检查
    Open;
  end;
  if Trim(qry1.FieldByName('fileID').AsString) <> Trim(qry2.Fields[0].AsString) then
  begin
    ShowMessage('该文号之后已经有新文号，不能删除连续的文号。');
    qry1.Close;
    exit;
  end;

    if MessageBox(Handle,PChar('您确定删除该文档？'+#13#13+'《'+qry2.Fields[3].AsString+'》'),'公文管理',MB_YESNO+MB_ICONQUESTION)=6 then
    begin
      with qry1 do
      begin
        Close;
        sql.Clear;
        sql.add('Delete from Maininfo where fileID='+qry2.Fields[0].AsString);
        sql.Add('Delete From fileTable Where fieldid='+qry2.Fields[0].AsString);
        ExecSQL;
        ShowMessage('删除成功！');
        Unit_Function.InsertLog(Now,ADuser,'删除了 ' + Trim(qry2.Fields[1].AsString) + Trim(qry2.Fields[3].AsString));
      end;
    end;
  qry1.Close;
  qry2.Requery;
  exit;
end;

procedure TfrmFilehost.btn_FindClick(Sender: TObject);   //快速检索定位主送单位
var
 st : string;
begin
  //刷新主送单位的下拉列表
  if Trim(cbb2.Text) <> '' then
  begin
   st := ' where sendto like '+QuotedStr('%'+cbb2.Text+'%');
  end;
  with qry1 do
  begin
    Close;
    sql.Clear;
    sql.Add('select distinct sendto from sendto '+st+' order by sendto');
    open;
  end;
  qry1.First;
  st := cbb2.Text;
  cbb2.Clear;
  cbb2.Text := st;
  while not qry1.Eof  do
  begin
    cbb2.Items.Add(Trim(qry1.FieldByName('sendto').AsString));
    qry1.Next;
  end;
  cbb2.Items.Add('增加新内容...');
  qry1.Close;
  findstate := True;
end;

procedure TfrmFilehost.btn_ModiClick(Sender: TObject);  // 修改内容
var
  Form2 : TFrm_Edit;
  fileID, UserLev : string;
begin
  if qry2.Active = False then exit;
  fileID := Trim(qry2.Fields[0].AsString);
  UserLev:=Trim(qry2.Fields[5].AsString);
  if (Trim(ADuser) <> UserLev)  AND (sAdmin<>'Y') then
  begin
    ShowMessage('只有原拟稿人或文档管理员能修改文件信息');
    exit;
  end;
  Form2 := TFrm_Edit.Create(nil);
  Try
    Form2.edt1.Text := fileID;
    Form2.ShowModal;
  Finally
    FreeAndNil(Form2);
    Unit_Function.InsertLog(Now,ADuser,'修改了 ' + Trim(qry2.Fields[1].AsString) + Trim(qry2.Fields[3].AsString));
    qry2.Requery;
  End;
end;

procedure TfrmFilehost.cbb1Change(Sender: TObject);
begin
  if Pos(Trim(cbb1.Text),sFileHeader) <> 0 then //Trim(cbb1.Text) = '南财预'
  begin
    edt4.Enabled := False;
  end
  else
  begin
    edt4.Enabled := True;
  end;
  edt4.Clear;
end;

procedure TfrmFilehost.cbb1CloseUp(Sender: TObject);
begin
  if trim(cbb1.Text) = '增加新内容...' then
  begin
    updateDict(0);
    cbb1.Clear;
  end
  else
  begin
    edt3.SetFocus;
  end;
end;


procedure TfrmFilehost.updateDict(sID : integer); //更新枚举字典
var
   sText : string;
begin
//0-文号，1-主送单位，2-拟稿人
    sText:= InputBox('提示','请输入需要增加的内容：','');
    if Trim(sText)='' then exit;
    with qry1 do
    begin
      Close;
      sql.Clear;
      case sID of
       0: sql.Add('exec updateDict ''wenhao'','+Quotedstr(Trim(sText))+','+QuotedStr(OperDept));     //更新文件字号头
       1: sql.Add('exec updateDict ''sendto'','+Quotedstr(Trim(sText))+','+QuotedStr(OperDept));     //更新主送单位目录
       2: sql.Add('exec updateDict ''usertable'','+Quotedstr(Trim(sText))+','+QuotedStr(OperDept));  //更新拟稿人目录
      end;
      execsql;
    end;
end;


procedure TfrmFilehost.cbb1DropDown(Sender: TObject);
begin
  //刷新发文字号类别
  if cbb1.Items.Count > 1 then exit;
  cbb1.Clear;
  with qry1 do
  begin
    Close;
    sql.Clear;
    sql.Add('select distinct whjc from wenhao order by whjc Asc');
    open;
  end;
  qry1.First;
  while not qry1.Eof  do
  begin
    cbb1.Items.Add(Trim(qry1.FieldByName('whjc').AsString));
    qry1.Next;
  end;
  cbb1.Items.Add('增加新内容...');
  qry1.Close;
end;

procedure TfrmFilehost.cbb2Click(Sender: TObject);
begin
  if Trim(cbb2.Text)='增加新内容...' then
  begin
    updateDict(1);
    cbb2.Clear;
  end;
end;

procedure TfrmFilehost.cbb2DropDown(Sender: TObject);
var
 st : string;
begin
  if (findstate=True) and (Trim(cbb2.Text)<>'') then exit;
//  if cbb2.Items.Count > 1 then exit;
  //刷新主送单位的下拉列表
  if Trim(cbb2.Text) <> '' then
  begin
   st := ' where sendto like '+QuotedStr('%'+cbb2.Text+'%');
  end;
  with qry1 do
  begin
    Close;
    sql.Clear;
    sql.Add('select distinct sendto from sendto '+ st +' order by sendto');
    open;
  end;
  cbb2.Clear;
  qry1.First;
  while not qry1.Eof  do
  begin
    cbb2.Items.Add(Trim(qry1.FieldByName('sendto').AsString));
    qry1.Next;
  end;
  cbb2.Items.Add('增加新内容...');
  qry1.Close;
  findstate := False;
end;

procedure TfrmFilehost.cbb5DropDown(Sender: TObject);
begin
//刷新拟稿人列表
  if cbb5.Items.Count > 1 then exit;
  cbb5.Clear;
  with qry1 do
  begin
    Close;
    sql.Clear;
    sql.Add('select creater from usertable where inuse=''1'' and czbm='+QuotedStr(OperDept)+' Order by Sorder ,creater');
    open;
  end;
  qry1.First;
  while not qry1.Eof  do
  begin
    cbb5.Items.Add(Trim(qry1.FieldByName('creater').AsString));
    qry1.Next;
  end;
  qry1.Close;
end;

procedure TfrmFilehost.dbgrdh1DblClick(Sender: TObject); //查看文档
var
  S : TMemoryStream;
  AQry : TADOQuery;
  sFileName,sOrder : String;
begin
  if qry2.Active = False then Exit ;
  if Not( (Trim(dbgrdh1.SelectedField.FieldName)='正文文档') OR (Trim(dbgrdh1.SelectedField.FieldName)='附件文档') )then exit   ;
  if (Trim(dbgrdh1.SelectedField.FieldName)='正文文档') And (trim(qry2.FieldByName('正文文档').AsString) = '无') then exit;
  if (Trim(dbgrdh1.SelectedField.FieldName)='附件文档') And (trim(qry2.FieldByName('附件文档').AsString) = '无') then exit;

  if  Trim(dbgrdh1.SelectedField.FieldName)='正文文档' then sOrder :='' else sOrder := '1';
  if Application.MessageBox('确定打开该文件？','公文管理',MB_OKCancel) = idOK then
  begin
    Try
      Screen.Cursor := crHourGlass;
      AQry := TADOQuery.Create(nil);
      AQRY.Connection := qry1.Connection;
      With AQry do
      begin
        Close;
        SQL.Clear;
        SQL.Add('Select filename'+sOrder+',fileblob'+sOrder+' from FileTable Where fieldid=' + IntToStr(qry2.Fields[0].asinteger));
        Open;
      end;
      sFileName := sTemppath +Aqry.FieldByName('filename'+sOrder).AsString ;
      S := TMemoryStream.Create;
      TBlobField(AQry.FieldByName('fileblob'+sOrder)).SaveToStream(S);
      S.Position := 0;
      S.SaveToFile(sFileName);
      S.Free;
      AQry.Free;
      Screen.Cursor := crDefault;
      if ShellExecute(Application.Handle,'open', Pchar(sFileName),'','',SW_SHOWNORMAL)<32 then
      begin
        ShellExecute(0,nil, Pchar(sTemppath),nil,nil,SW_SHOW);
      end;
    Except
      Screen.Cursor := crDefault;
      Showmessage('打开文件失败');
    End;
  end;

end;

procedure TfrmFilehost.dbgrdh1TitleBtnClick(Sender: TObject; ACol: Integer;
  Column: TColumnEh);
begin
  if TADOQuery(TDBGridEh(Sender).DataSource.DataSet).Active = False then
  begin
    Exit;
  end;
  if Column.Title.SortMarker = smDownEh then
    TADOQuery(TDBGridEh(Sender).DataSource.DataSet).Sort := Column.FieldName
  else
    TADOQuery(TDBGridEh(Sender).DataSource.DataSet).Sort :=column.FieldName +' DESC';
end;

procedure TfrmFilehost.edt3Change(Sender: TObject);
begin
  if (Length(edt3.Text)=4) And (Trim(cbb1.Text) <>'') then
  begin
    getfilenum;
    if Pos(Trim(cbb1.Text),sFileHeader) <> 0  then cbb3.SetFocus else edt4.setfocus;
  end;
end;

procedure TfrmFilehost.edt3Enter(Sender: TObject);
begin
  if Trim(cbb1.Text)='' then
  begin
    ShowMessage('请先输入文号！如不确定，请选“无”');
  end;
end;

procedure TfrmFilehost.edt3KeyPress(Sender: TObject; var Key: Char);
begin
  if Not (AnsiChar(Key) in ['0'..'9',#8] ) then
  begin
    Key :=#0;
    ShowMessage('只能输入数字');
    edt3.SetFocus;
  end;
end;

procedure TfrmFilehost.edt4Enter(Sender: TObject);
begin
  if (Trim(edt3.Text)='') then
  begin
    ShowMessage('请录入文件的年份以便于归档查询');
  end;
end;

procedure TfrmFilehost.edt4KeyPress(Sender: TObject; var Key: Char);
begin
  if Not (AnsiChar(Key) in ['0'..'9',#8] ) then
  begin
    Key :=#0;
    ShowMessage('只能输入数字');
    edt4.SetFocus;
  end;
end;

procedure TfrmFilehost.edt5Exit(Sender: TObject);
var
  s : string;
begin
 if Trim(edt5.Text) = '' then exit;
 S := Copy(Trim(edt5.Text),Length(Trim(edt5.Text)),1);
 if S='知' then cbb3.ItemIndex := 1;
 if S='示' then cbb3.ItemIndex := 2;
 if S='函' then cbb3.ItemIndex := 5;
 if S='告' then cbb3.ItemIndex := 4;
 if S='见' then cbb3.ItemIndex := 3;
end;

procedure TfrmFilehost.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  qry1.Active := False;
  qry2.Active := False;
  DataModule2.ADOConnection1.Connected := False;
  deleTempFile;
  ACtion := caFree;
end;

procedure TfrmFilehost.FormCreate(Sender: TObject);
var
  AComponent: TComponent;
  sDeptname : string;
begin
  DataModule2.ADOConnection1.Connected := True;
  //标记管理员权限
    sAdmin := 'N';
    AComponent := Application.MainForm.FindComponent('StatusBar1');
    ADuser:=Trim((Acomponent as TStatusBar).Panels[1].Text);  //用户名
    OperDept:=Trim((Acomponent as TStatusBar).Panels[2].Text);  //科室名
    with qry1 do
    begin
      close;
      sql.clear;
      sql.add('select admin from usertable where inuse=''1'' and Creater='+QuotedStr(ADuser));
      Open;
    end;
    if qry1.FieldByName('admin').AsString='1'  then
    begin
      sAdmin := 'Y';
      qry1.Close;
    end;
    sDeptname:=Trim((Acomponent as TStatusBar).Panels[2].Text);  //部门名
    with qry1 do
    begin
      close;
      SQL.Clear;
      sql.Add('Select FileHeader from Dept where DeptName='+ QuotedStr(sDeptname));
      open;
      sFileHeader := Trim(FieldByName('FileHeader').AsString);
      close;
    end;
end;

procedure TfrmFilehost.FormShow(Sender: TObject);
begin
  dtp1.Date   := Now();
  deleTempFile;
  getfileid;
  Showdata(qry2,25);
  cbb5.Text := ADuser;
end;

procedure TfrmFilehost.getfilenum;//自动排文号
begin
  if Trim(cbb1.Text)<>'' then
  begin
    with qry1 do
    begin
      Close;
      sql.Clear;
      {
      sql.add('select count(distinct filenumber) as icount from maininfo where filenumber like '''
               +Trim(cbb1.Text)+'_'+Trim(edt3.Text)+'_%'' ');
      }
      sql.Add('select Top 1 Cast(SUBSTRING(filenumber,PatIndex(''%]%'',filenumber)+1,len(filenumber)-PatIndex(''%]%'',filenumber)-1)'
               +' As Int) As MaxNum , filenumber from maininfo where filenumber like '+Quotedstr(Trim(cbb1.Text)+'%'+Trim(edt3.Text)+'%')
               +' Order By MaxNum Desc');
      Open;
    end;
//    edt4.Text := IntToStr(qry1.FieldByName('icount').AsInteger + 1);
    edt4.Text := IntToStr(qry1.FieldByName('MaxNum').AsInteger + 1);
    qry1.Close;
  end;
end;

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


procedure TfrmFilehost.N1Click(Sender: TObject);  //补传正文文档
begin
  Appendfile(0);
end;

procedure TfrmFilehost.N2Click(Sender: TObject);    //上传附件文档
begin
  Appendfile(1);
end;



initialization
  CoInitialize(Nil);
  RegisterClass(TfrmFilehost);
finalization
  UnRegisterClass(TfrmFilehost);
  CoUninitialize;
  FreeAndNil(frmFilehost);

end.




unit Unit_FilehostQry;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Controls, Forms,
  Dialogs, ActiveX, StdCtrls, ExtCtrls, DBGridEhGrouping, GridsEh, DBGridEh,
  ComCtrls, Buttons, DB, ADODB,ShellAPI, Menus, IniFiles, ToolCtrlsEh,
   EhLibVCL, DateUtils, AppEvnts, DynVarsEh, DBGridEhToolCtrls, DBAxisGridsEh;

type
  TfrmFilehostQry = class(TForm)
    pnl1: TPanel;
    btn1: TButton;
    pnl2: TPanel;
    dbgrdh1: TDBGridEh;
    dlgOpen1: TOpenDialog;
    con1: TADOConnection;
    ds1: TDataSource;
    qry2: TADOQuery;
    grp1: TGroupBox;
    lbl12: TLabel;
    lbl13: TLabel;
    lbl14: TLabel;
    lbl15: TLabel;
    lbl16: TLabel;
    lbl17: TLabel;
    q_wenzhong: TComboBox;
    q_zhusong: TComboBox;
    q_creater: TComboBox;
    q_dtp1: TDateTimePicker;
    q_dtp2: TDateTimePicker;
    lbl18: TLabel;
    q_title: TEdit;
    q_wenhao_head: TComboBox;
    q_wenhao_year: TComboBox;
    q_wenhao_num: TEdit;
    lbl19: TLabel;
    btn4: TButton;
    pm1: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    N5: TMenuItem;
    dlgSave1: TSaveDialog;
    lbl23: TLabel;
    cbb_file: TComboBox;
    N6: TMenuItem;
    N8: TMenuItem;
    N9: TMenuItem;
    spl1: TSplitter;
    qry1: TADOQuery;
    grp_manager: TGroupBox;
    lbl22: TLabel;
    btn_Dele: TBitBtn;
    btn_export: TBitBtn;
    btn_Modi: TButton;
    btn_dict: TButton;
    btn_uploadMain: TButton;
    btn_uploadAttach: TButton;
    btn_DownMain: TButton;
    btn_downAttach: TButton;
    q_Memo: TEdit;
    lbl1_memo: TLabel;
    lbl_xxgk: TLabel;
    cbb_xxgk: TComboBox;
    procedure btn1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure dbgrdh1DblClick(Sender: TObject);

    procedure q_wenhao_headDropDown(Sender: TObject);
    procedure q_zhusongDropDown(Sender: TObject);
    procedure q_createrDropDown(Sender: TObject);
    procedure q_wenhao_numChange(Sender: TObject);
    procedure btn4Click(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure N4Click(Sender: TObject);
    procedure N5Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btn_exportClick(Sender: TObject);
    procedure btn_DeleClick(Sender: TObject);
    procedure N8Click(Sender: TObject);
    procedure N9Click(Sender: TObject);
    procedure dbgrdh1TitleBtnClick(Sender: TObject; ACol: Integer;
      Column: TColumnEh);
    procedure btn_dictClick(Sender: TObject);
    procedure btn_uploadMainClick(Sender: TObject);
    procedure btn_uploadAttachClick(Sender: TObject);
    procedure btn_DownMainClick(Sender: TObject);
    procedure btn_downAttachClick(Sender: TObject);
    procedure btn_ModiClick(Sender: TObject);
    procedure qry2AfterOpen(DataSet: TDataSet);
  private
    { Private declarations }
    var
    sTemppath{临时目录},sAdmin{管理员},ADuser{操作员},OperDept{科室名称}: string;
//   function  py(x:String) : Char;           //获取拼音简码
   function  IsFileInUse(fName : string) : boolean; //判断文件是否正在被使用
   procedure Appendfile(sFlag:integer);//补传文件
   procedure deleTempFile;  //删除临时目录
   procedure downloadfile(si:string);               //下载文件
   procedure uploadfile(Sid,Fname,sOrder:string);  //上传文件
   procedure DeleteDoc(sFlag:Integer);//清除电子文件
   procedure GridMouseWheel(Sender: TObject; Shift: TShiftState; WheelDelta: Integer; MousePos: TPoint; var Handled: Boolean);//滚动
  public
     { Public declarations }
  end;

  {控制页面滚动}
  TWheelDBGrid = class(TDBGridEh)
  public
    property OnMouseWheel;
  end;

var
  frmFilehostQry: TfrmFilehostQry;

implementation

uses ComObj,UnitFileThread,Unit_FileHost_Edit,Unit_FileHost_Dict,DataMoudle,Unit_Function;


{$R *.dfm}

function TfrmFilehostQry.IsFileInUse(fName : string) : boolean; //判断文件是否正在被使用
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

procedure TfrmFilehostQry.downloadfile(si:string);     //下载文件
var
  S : TMemoryStream;
  AQry : TADOQuery;
  sFileName,sOrder : String;
begin
  sOrder :=si;
    Try
      AQry := TADOQuery.Create(nil);
      AQRY.Connection := qry1.Connection;
      With AQry do
      begin
        Close;
        SQL.Clear;
        SQL.Add('Select filename'+sOrder+',fileblob'+sOrder+' from FileTable Where fieldid=' + IntToStr(qry2.Fields[0].asinteger));
        Open;
      end;
      dlgSave1.FileName:= Aqry.FieldByName('filename'+sOrder).AsString;
      dlgSave1.DefaultExt := ExtractFileExt(Aqry.FieldByName('filename'+sOrder).AsString);
      sFileName := dlgSave1.FileName ;
      S := TMemoryStream.Create;
      TBlobField(AQry.FieldByName('fileblob'+sOrder)).SaveToStream(S);
      S.Position := 0;
      if dlgSave1.Execute then
      begin
        S.SaveToFile(sFileName);
        ShowMessage('下载完成');
        S.Free;
        AQry.Free;
      end
      else
      begin
        S.Free;
        AQry.Free;
        exit;
      end;
    Except
      ShowMessage('下载出错！');
    End;

end;

procedure TfrmFilehostQry.deleTempFile; //清空临时文件目录
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

procedure TfrmFilehostQry.uploadfile(Sid,Fname,sOrder:string);  //上传文件
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


procedure TfrmFilehostQry.btn1Click(Sender: TObject);
begin
  Close;
end;


procedure TfrmFilehostQry.btn4Click(Sender: TObject);      //查询文档
var
  sSQLStr,sWenhao,sTitle,sSendto,sCreater,sType,sfile,sMemo,sXxgk : String;
  sBegindate,sEnddate : string;
  sTitleTemp : string;
begin
  if not DataModule2.ADOConnection1.Connected then DataModule2.ADOConnection1.Open;
  sSQLStr  :='';
  sWenhao  :='';
  sTitle   :='';
  sSendto  :='';
  sCreater :='';
  sType    :='';
  sfile    :='';
  sMemo    :='';
  sXxgk    :='';

  if Trim(q_wenhao_head.Text)+Trim(q_wenhao_year.Text) + Trim(q_wenhao_num.Text) <>'' then
  sWenhao := ' and (filenumber like ''%'+Trim(q_wenhao_head.Text)+'_'+Trim(q_wenhao_year.Text)+'_'+ Trim(q_wenhao_num.Text)+'%'') ';

//  if Trim(q_title.Text)<>'' then sTitle := ' and (title like ''%' +Trim(q_title.Text)+ '%'') ';

  sTitleTemp := Trim(q_title.Text);
  if sTitleTemp<>'' then
  begin
    if Pos(' ',sTitleTemp)=0 then sTitle := ' and (title like ''%' +Trim(q_title.Text)+ '%'') ' else
    begin
    while Pos(' ',sTitleTemp)>0 do
    begin
      sTitle := ' and (title like ''%' + Copy(sTitleTemp,1,Pos(' ',sTitleTemp)-1) + '%'') ' + sTitle ;
      Delete(sTitleTemp,1,Pos(' ',sTitleTemp));
      sTitleTemp := Trim(sTitleTemp);
    end;
    sTitle := sTitle +  ' and (title like ''%' + sTitleTemp + '%'') ';
    end;
  end;

  if Trim(q_zhusong.Text)<>'' then sSendto := ' and (sendto like ''%' + Trim(q_zhusong.Text) + '%'') ';
  if Trim(q_creater.Text)<>'' then sCreater := ' and (creater like ''%' + Trim(q_creater.Text) + '%'') ';
  if Trim(q_wenzhong.Text)<>'' then sType := ' and (ftype like ''%' + Trim(q_wenzhong.Text) + '%'') ';
  if Trim(q_Memo.Text)<>''     then  sMemo:= ' and (memo1 like ''%' + Trim(q_Memo.Text) + '%'') ';
  if Trim(cbb_xxgk.Text) <>''  then  sXxgk :=' and (xxgk='''+ Trim(cbb_xxgk.Text) + ''') ';


  case cbb_file.ItemIndex of
  0 : sfile := ' ';
  1 : sfile := ' and (Mainfile=''有正文'') ';
  2 : sfile := ' and (Mainfile=''无'') ';
  end;

  sBegindate := QuotedStr(FormatDateTime('YYYY-MM-DD',q_dtp1.Date));
  sEnddate   := QuotedStr(FormatDateTime('YYYY-MM-DD',q_dtp2.Date));

  sSQLStr := sSQLStr + sWenhao+sTitle+sSendto+sCreater+sType+sfile+sMemo+sXxgk+ ' order by fileid';

  with qry2 do
  begin
    Close;
    sql.Clear;
    sql.Add('select  fileid as 编号, filenumber as 发文字号,miji as 密级,title as 文件标题,sendto as 主送单位,'
    +'creater as 拟稿人,crtime as 印发日期,xxgk as 公开选项,mainfile as 正文文档, mainfile1 as 附件文档,memo1 as 备注 from Maininfo ');
//    sql.Add(' where (operdept='+QuotedStr(OperDept)+' or operDept is null ) and (crtime between '+ sBegindate + ' and ' + sEnddate +' ) ');
    sql.Add(' where ((select charindex(operdept,bmqx) from login where loginname='+QuotedStr(ADuser)
    +' and deptNo=(select DeptNo from dept where DeptName='+Quotedstr(operdept)+') )>0 or (operDept is null) ) and (crtime between '
    + sBegindate + ' and ' + sEnddate +' ) ');
    sql.Add(sSQLStr);
    Open;
  end;
  if qry2.RecordCount = 0 then
  ShowMessage('没有找到相应的记录')
  else
  begin
    btn_uploadMain.Enabled := True;
    btn_uploadAttach.Enabled := True;
    btn_DownMain.Enabled := True;
    btn_downAttach.Enabled := True;
  end;
  dbgrdh1.EvenRowColor := $00DEF1EB;
end;

procedure TfrmFilehostQry.btn_DeleClick(Sender: TObject);  //删除记录
begin
  if qry2.Active = False then exit;
  if Trim(qry2.Fields[0].AsString) = '' then exit;
  if sAdmin <> 'Y'  then
  begin
    ShowMessage('您不能删除该文档，请联系文档管理员。');
    exit;
  end
  else
  begin
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
  end;
  qry1.Close;
  qry2.Requery;
  exit;
end;

procedure TfrmFilehostQry.btn_dictClick(Sender: TObject);  //枚举字典维护
var
  Frm_Dict : TFrm_Dict;
begin
  if Not DataModule2.ADOConnection1.Connected  then exit;
  if (Trim(ADuser) <> '张旭州') then
  begin
    ShowMessage('权限不足！');
    exit;
  end;
  Frm_Dict := TFrm_Dict.Create(nil);
  Try
    Frm_Dict.ShowModal;
  Finally
    FreeAndNil(Frm_Dict);
  End;
end;

procedure TfrmFilehostQry.btn_downAttachClick(Sender: TObject);
begin
  N5.Click;
end;

procedure TfrmFilehostQry.btn_DownMainClick(Sender: TObject);
begin
  N4.Click;
end;

procedure TfrmFilehostQry.btn_exportClick(Sender: TObject);   //导出内容到Excel表格
const
  xlHAlignCenter = -4108;
  xlHAlignLeft  = -4131;
  xlHAlignRight  = -4152;
var
  iCount, jCount: Integer;
  XLApp: Variant;
  Sheet: Variant;
  BK : TBookMark;
  DataSet:TDataSet;
  Col : TColumneh;
  CellStr : string;
  GAL :TAlignment;
  EAL : Integer;
begin
  if qry2.Active = False then exit;
  if (Trim(qry2.Fields[0].AsString)= '') then exit;
  Screen.Cursor := crHourGlass;
  if not VarIsEmpty(XLApp) then
  begin
    XLApp.DisplayAlerts := False;
    XLApp.Quit;
    VarClear(XLApp);
  end;
  try
    XLApp := CreateOleObject('Excel.Application');
  except
    Screen.Cursor := crDefault;
    Exit;
  end;
  XLApp.WorkBooks.Add;
    XLApp.WorkBooks[1].WorkSheets[1].Name := '文件明细';
    Sheet := XLApp.Workbooks[1].WorkSheets['文件明细'];
    if not dbgrdh1.DataSource.DataSet.Active then
    begin
      Screen.Cursor := crDefault;
      Exit;
    end;
    DataSet := dbgrdh1.DataSource.DataSet;
    DataSet.DisableControls;
    BK := DataSet.GetBookmark();
    DataSet.First;
    //标题
    for iCount := 0 to dbgrdh1.Columns.Count - 1 do
    begin
      Col := dbgrdh1.Columns.Items[iCount];
      Sheet.Cells[1, iCount + 1] := Col.Title.Caption;
      Sheet.Cells[1, iCount + 1].Font.Bold :=True ;//粗体
      GAL := Col.Alignment;
      if GAL = taLeftJustify then
        EAL := xlHAlignLeft
      else if GAL = taCenter then
        EAL := xlHAlignCenter
      else EAL := xlHAlignRight;
      //列数据对齐格式
      Sheet.Columns[iCount + 1].HorizontalAlignment := EAL ;
      //列标题对齐格式
      Sheet.Cells[1, iCount + 1].HorizontalAlignment := xlHAlignCenter;
    end;
    //数据
    jCount := 1;
    while not DataSet.Eof do
    begin
      for iCount := 0 to dbgrdh1.Columns.Count - 1 do
      begin
        Col := dbgrdh1.Columns.Items[iCount];
        CellStr:=  Col.Field.AsString;
        Sheet.Cells[jCount + 1, iCount + 1] := CellStr;
      end;
      Inc(jCount);
      DataSet.Next;
      Application.ProcessMessages;
    end;
    DataSet.GotoBookmark(BK);
    DataSet.FreeBookmark(BK);
    DataSet.EnableControls;
//    Sheet.range['B2:F'+IntToStr(dbgrdh1.RowCount+6)].Style := 'Comma';
    XLApp.WorkBooks[1].WorkSheets[1].Columns.AutoFit;
    XlApp.Visible := True; //用户关掉, 就可以关掉内存中的Excel试验通过2005.2.5
    Sheet := unAssigned;   //可以不要
  Screen.Cursor := crDefault;
end;

procedure TfrmFilehostQry.btn_ModiClick(Sender: TObject); //修改发文要素内容
var
  Form2 : TFrm_Edit;
begin
  if (qry2.Active = False)  then exit;
  if (Trim(qry2.Fields[0].AsString)= '') then exit;
  if ((Trim(ADuser) <> Trim(qry2.Fields[5].AsString))) And (sAdmin<>'Y') then
  begin
    ShowMessage('只有原拟稿人或文档管理员能修改文件信息');
    exit;
  end;
  Form2 := TFrm_Edit.Create(nil);
  Try
    Form2.edt1.Text := Trim(qry2.Fields[0].AsString);
    Form2.ShowModal;
  Finally
    FreeAndNil(Form2);
    Unit_Function.InsertLog(Now,ADuser,'修改了 ' + Trim(qry2.Fields[1].AsString) + Trim(qry2.Fields[3].AsString));
    qry2.Requery;
  End;
end;

procedure TfrmFilehostQry.btn_uploadAttachClick(Sender: TObject);
begin
  N2.Click;
end;

procedure TfrmFilehostQry.btn_uploadMainClick(Sender: TObject);
begin
  N1.Click;
end;

procedure TfrmFilehostQry.dbgrdh1DblClick(Sender: TObject); //查看文档
var
  S : TMemoryStream;
  AQry : TADOQuery;
  sFileName,sOrder : String;
begin
  if qry2.Active=False then Exit;
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

procedure TfrmFilehostQry.dbgrdh1TitleBtnClick(Sender: TObject; ACol: Integer;
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

procedure TfrmFilehostQry.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  qry1.Active := False;
  qry2.Active := False;
  deleTempFile;
  ACtion := caFree;
end;

procedure TfrmFilehostQry.FormCreate(Sender: TObject);
var
  AComponent: TComponent;
begin
  //标记管理员权限
    sAdmin := 'N';
    AComponent := Application.MainForm.FindComponent('StatusBar1');
    ADuser:=Trim((Acomponent as TStatusBar).Panels[1].Text);
    OperDept:=Trim((Acomponent as TStatusBar).Panels[2].Text);
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
    TWheelDBGrid(dbgrdh1).OnMouseWheel := GridMouseWheel;
end;

procedure TfrmFilehostQry.FormShow(Sender: TObject);
var
  baseSize : Integer;
begin
  q_dtp1.Date := StartOfTheYear(Now) ;  //初始化查询时间为当年1月1日      StrToDate(formatdatetime('YYYY',Now())+'-01-01');
  q_dtp2.Date := Now();
  deleTempFile;
  with qry1 do
  begin
    Close;
    sql.Clear;
    sql.Add('select count(fileid) as ''A'',(select count(fileid)  from maininfo where mainfile=''有正文'') as ''B'' '+
            ',(select count(fileid)  from maininfo where mainfile1=''有附件'') as ''C'' from maininfo');
    open;
  end;
  lbl22.Caption := ' MB，数据库共有记录 '+qry1.FieldByName('A').AsString+ ' 条,正文电子文件 '+qry1.FieldByName('B').AsString
                 +' 个，附件电子文件 '+qry1.FieldByName('C').AsString+' 个';
  with qry1 do
  begin
    ParamCheck := false;
    Close;
    sql.Clear;
    sql.add('sp_databases');
    Open;
    Locate('DataBase_Name',DataModule2.dbName,[loPartialKey]);
    baseSize := FieldByName('DataBase_Size').AsInteger div 1024;
  end;
  lbl22.Caption := '当前数据库大小为 '+IntToStr(baseSize) + lbl22.Caption;
  qry1.Close;
//  Showdata(qry2,25);
end;

//获取系统设置的鼠标滚动行数
function GetNumScrollLines: Integer;
begin
  SystemParametersInfo(SPI_GETWHEELSCROLLLINES, 0, @Result, 0);
end;

//DBGrid页面数据滚动
procedure TfrmFilehostQry.GridMouseWheel(Sender: TObject; Shift: TShiftState;
  WheelDelta: Integer; MousePos: TPoint; var Handled: Boolean);
var
  Direction: Shortint;
begin
  Direction := 1;
  if dbgrdh1.RowCount < 5 then exit;
  if WheelDelta = 0 then
    Exit
  else if WheelDelta > 0 then
    Direction := -1;
  with TDBGridEh(Sender) do
  begin
    if Assigned(DataSource) and Assigned(DataSource.DataSet) then
      DataSource.DataSet.MoveBy(Direction * (GetNumScrollLines+40));
    Invalidate;
  end;
end;

procedure TfrmFilehostQry.Appendfile(sFlag:integer);//上传文件 0-正文 1-附件
var
  sName,sMark,sOrd:string;
  sID,sN : string;
begin
  if qry2.Active = False then exit;
  if (Trim(qry2.Fields[0].AsString)= '') then exit;
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

  if Trim(qry2.FieldByName(sName).AsString)=sMark then
  begin
    if Application.MessageBox(Pchar('已有【 '+sName+' 】！您确实要上传覆盖吗？'),'公文管理',4+32) = ID_NO then exit;
  end;

  if dlgOpen1.Execute then
  begin
    if IsFileInUse(dlgOpen1.FileName)=True then
      begin
        Application.MessageBox('文件正在被其他程序使用，请先关闭文件后再试。','公文管理',0+MB_ICONWARNING);
        exit;
      end;
    try
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
      Application.MessageBox('上传失败','公文管理',0+MB_ICONERROR);
      Exit;
    end;
    Unit_Function.InsertLog(Now,ADuser,'上传文件：' + sID + ExtractFileName(sN));
    qry2.Requery;
    Application.MessageBox('上传文件完成','公文管理',0+64);
  end;
end;


procedure TfrmFilehostQry.N1Click(Sender: TObject);  //补传正文文档
begin
  Appendfile(0);
end;

procedure TfrmFilehostQry.N2Click(Sender: TObject);    //上传附件文档
begin
  Appendfile(1);
end;

procedure TfrmFilehostQry.N4Click(Sender: TObject);   //下载正文文件
var
  S : String;
begin
  if qry2.Active = False then Exit ;
  if (trim(qry2.FieldByName('正文文档').AsString) = '无') then
  begin
    ShowMessage('没有上传过正文');
    exit;
  end;
  s:='';
  downloadfile(S);
end;

procedure TfrmFilehostQry.N5Click(Sender: TObject);
var
  i :string;
begin
 if qry2.Active = False then Exit ;
  if (trim(qry2.FieldByName('附件文档').AsString) = '无') then
  begin
    ShowMessage('没有上传过附件');
    exit;
  end;
  i:='1';
  downloadfile(i);
end;


procedure TfrmFilehostQry.N8Click(Sender: TObject);
begin
  DeleteDoc(0);   //清除正文
end;

procedure TfrmFilehostQry.N9Click(Sender: TObject);
begin
  DeleteDoc(1); //清除附件
end;

procedure TfrmFilehostQry.DeleteDoc(sflag:Integer);   //清除电子文档
var
  S1,S2 : string;
begin
  if qry2.Active = False then exit;
  if sAdmin <> 'Y' then
  begin
    ShowMessage('您没有此权限，请联系文档管理员。');
    exit;
  end;
  if sFlag = 0 then
  begin
    S1 := '';
    S2 := '正文';
  end
  else
  begin
    S1 := '1';
    S2 := '附件';
  end;
  if (trim(qry2.FieldByName(S2+'文档').AsString) = '无') then
  begin
    ShowMessage('本条记录没有可供删除的电子文档');
    exit;
  end;
  try
    if MessageBox(Handle,PChar('确定要清除【 '+S2+' 】电子文档？'),'公文管理',MB_YESNO+MB_ICONQUESTION)=6 then
    begin
      DataModule2.ADOConnection1.BeginTrans;
      with qry1 do
      begin
        Close;
        sql.Clear;
        sql.Add('Update Maininfo  Set Mainfile'+S1+'=''无'' where fileID='+qry2.Fields[0].AsString);
        sql.Add('Update fileTable Set filename'+S1+'=Null, fileblob'+S1+'=Null Where Fieldid='+qry2.Fields[0].AsString);
        ExecSQL;
        Close;
        sql.Clear;
        SQL.add('Select mainfile,mainfile1 from maininfo where fileID='+qry2.Fields[0].AsString);
        Open;
        if (Trim(qry1.Fields[0].AsString)= '无') AND (Trim(qry1.Fields[1].AsString)= '无')  then
        begin
          Close;
          SQL.Clear;
          SQL.add('Delete From fileTable Where fieldid='+qry2.Fields[0].AsString);
          ExecSQL;
        end;
        DataModule2.ADOConnection1.CommitTrans;
        Unit_Function.InsertLog(Now,ADuser,'删除 '+qry2.Fields[3].AsString+' 的 '+S2+' 文档：');
        qry2.Requery;
        ShowMessage('删除成功');
      end;
    end;
  except
    ShowMessage('删除失败');
    DataModule2.ADOConnection1.RollbackTrans;
  end;
end;

procedure TfrmFilehostQry.qry2AfterOpen(DataSet: TDataSet);
begin
//  mtblh1.Active := true;
end;

procedure TfrmFilehostQry.q_createrDropDown(Sender: TObject);
begin
  q_creater.Items.Clear;
  with qry1 do
  begin
    close;
    sql.Clear;
    sql.Add('select creater from usertable order by sorder ASC ');
    Open;
  end;
  qry1.First;
  while not qry1.Eof do
  begin
    q_creater.Items.Add(qry1.Fields[0].AsString);
    qry1.Next;
  end;

end;

procedure TfrmFilehostQry.q_wenhao_headDropDown(Sender: TObject);
begin
  q_wenhao_head.Items.Clear;
  with qry1 do
  begin
    close;
    sql.Clear;
    sql.Add('select distinct whjc from wenhao');
    Open;
  end;
  qry1.First;
  while not qry1.Eof do
  begin
    q_wenhao_head.Items.Add(qry1.Fields[0].AsString);
    qry1.Next;
  end;
end;

procedure TfrmFilehostQry.q_wenhao_numChange(Sender: TObject);
begin
  if q_wenhao_num.Text='' then exit;
  try
    StrToInt(Trim(q_wenhao_num.Text));
  except
    ShowMessage('只能输入数字！');
    q_wenhao_num.SetFocus;
    Exit;
  end;
end;

procedure TfrmFilehostQry.q_zhusongDropDown(Sender: TObject);
begin
  q_zhusong.Items.Clear;
  with qry1 do
  begin
    close;
    sql.Clear;
    sql.Add('select distinct sendto from sendto');
    Open;
  end;
  qry1.First;
  while not qry1.Eof do
  begin
    q_zhusong.Items.Add(qry1.Fields[0].AsString);
    qry1.Next;
  end;
end;

initialization
  CoInitialize(Nil);
  RegisterClass(TfrmFilehostQry);
finalization
  UnRegisterClass(TfrmFilehostQry);
  CoUninitialize;
  FreeAndNil(frmFilehostQry);

end.




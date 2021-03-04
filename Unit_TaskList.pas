unit Unit_TaskList;

interface

uses
   Windows, SysUtils, Classes,  Controls, Forms, ActiveX, StdCtrls,
  DBGridEhGrouping, ExtCtrls, GridsEh, DBGridEh, ComCtrls, DB, ADODB,
  ShellAPI, Dialogs, Buttons;

type
  TfrmTaskList = class(TForm)
    btn1: TButton;
    pnl1: TPanel;
    dbgrdh1: TDBGridEh;
    pnl2: TPanel;
    btn2: TButton;
    btn3: TButton;
    btn4: TButton;
    grp1: TGroupBox;
    cbb1: TComboBox;
    lbl_TaskLev: TLabel;
    edt_filenum: TEdit;
    lbl1: TLabel;
    cbb_zhuban: TComboBox;
    lbl2: TLabel;
    lbl3: TLabel;
    cbb_Controller: TComboBox;
    lbl4: TLabel;
    cbb_Operater: TComboBox;
    lbl5: TLabel;
    lbl7: TLabel;
    cbb_Year: TComboBox;
    lbl8: TLabel;
    edt_Content: TEdit;
    Label1: TLabel;
    cbb_isEnd: TComboBox;
    btn_Query: TButton;
    ds1: TDataSource;
    qry_Main: TADOQuery;
    qry2: TADOQuery;
    cbb_Month: TComboBox;
    btn_Export: TBitBtn;
    dlgSave1: TSaveDialog;
    btn_AddFile: TBitBtn;
    procedure btn1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btn2Click(Sender: TObject);
    procedure btn4Click(Sender: TObject);
    procedure btn_QueryClick(Sender: TObject);
    procedure btn3Click(Sender: TObject);
    procedure dbgrdh1DblClick(Sender: TObject);
    procedure cbb_ControllerDropDown(Sender: TObject);
    procedure cbb_OperaterDropDown(Sender: TObject);
    procedure btn_ExportClick(Sender: TObject);
    procedure btn_AddFileClick(Sender: TObject);
  private
    { Private declarations }
    var
    StrWhere : STring;
    procedure GetWhereStr; //组合查询条件语句
  public
    { Public declarations }
  end;

var
  frmTaskList: TfrmTaskList;

implementation

uses Unit_TaskAdd, Unit_TaskUpdate, Unit_Export;

{$R *.dfm}

procedure TfrmTaskList.GetWhereStr;
begin
  StrWhere := ' Where ';
  if cbb1.ItemIndex > 0  then StrWhere := StrWhere + ' (a.XDBM='+ QuotedStr(Trim(cbb1.Text)) + ') And ';
  if cbb_Year.ItemIndex  > 0 then StrWhere := StrWhere +' (a.sYear='+ QuotedStr(Trim(cbb_Year.Text)) + ') And ';
  if edt_filenum.Text <> '' then StrWhere := StrWhere +' (a.WJBH Like ''%'+ Trim(edt_filenum.Text) + '%'') And ';
  if cbb_zhuban.ItemIndex > 0 then StrWhere := StrWhere +' (a.ZBLX='+ QuotedStr(Trim(cbb_zhuban.Text)) + ') And ';
  if edt_Content.Text <> '' then StrWhere := StrWhere +' (a.TaskContent Like ''%'+ Trim(edt_Content.Text) + '%'') And ';
  if cbb_Controller.Text <> '' then StrWhere := StrWhere +' (a.Admin='+ QuotedStr(Trim(cbb_Controller.Text)) + ') And ';
  if cbb_Operater.Text <> '' then StrWhere := StrWhere +' (a.Operter='+ QuotedStr(Trim(cbb_Operater.Text)) + ') And ';
  if cbb_isEnd.Text <> '' then StrWhere := StrWhere +' (a.isEnd='+ QuotedStr(Trim(cbb_isEnd.Text)) + ') And ';
  case cbb_Month.ItemIndex of
    0 :  StrWhere := StrWhere+ ' (a.EndDate >''1900-01-01'') ';
    1 :  StrWhere := StrWhere+ ' (Month(a.EndDate)=1)';
    2 :  StrWhere := StrWhere+ ' (Month(a.EndDate)=2)';
    3 :  StrWhere := StrWhere+ ' (Month(a.EndDate)=3)';
    4 :  StrWhere := StrWhere+ ' (Month(a.EndDate)=4)';
    5 :  StrWhere := StrWhere+ ' (Month(a.EndDate)=5)';
    6 :  StrWhere := StrWhere+ ' (Month(a.EndDate)=6)';
    7 :  StrWhere := StrWhere+ ' (Month(a.EndDate)=7)';
    8 :  StrWhere := StrWhere+ ' (Month(a.EndDate)=8)';
    9 :  StrWhere := StrWhere+ ' (Month(a.EndDate)=9)';
    10:  StrWhere := StrWhere+ ' (Month(a.EndDate)=10)';
    11:  StrWhere := StrWhere+ ' (Month(a.EndDate)=11)';
    12:  StrWhere := StrWhere+ ' (Month(a.EndDate)=12)';
  end;
  if Trim(StrWhere)='Where' then StrWhere := '';
end;

procedure TfrmTaskList.btn1Click(Sender: TObject);
begin
  Close;
end;

procedure TfrmTaskList.btn2Click(Sender: TObject);//Add New Task
var
  FrmTaskAdd : TFrmTaskAdd;
begin
  FrmTaskAdd := TFrmTaskAdd.Create(nil);
  try
    FrmTaskAdd.ShowModal;
  finally
    FrmTaskAdd.Free;
  end;
  btn_Query.Click;;
end;

procedure TfrmTaskList.btn3Click(Sender: TObject);
begin
  if qry_Main.Active = False then exit;
  if qry_Main.FieldByName('序号').AsString = '' then exit;
  if MessageBox(Handle,PChar('您确定删除'+#13 + qry_Main.FieldByName('任务内容').AsString +' ？' ),'公文管理',MB_YESNO+MB_ICONQUESTION)=6 then
  begin
    with qry2 do
    begin
     Close;
     sql.Clear;
     SQL.Add('Delete From TaskList Where TaskID=' + qry_Main.FieldByName('序号').AsString );
     ExecSQL;
     Close;
    end;
    qry_Main.Requery;
    Application.MessageBox('删除成功！','公文管理',0+64);
  end;
end;

procedure TfrmTaskList.btn4Click(Sender: TObject);   //Update the Task Progress
var
  FrmTaskUpdate: TFrmTaskUpdate;
begin
  if qry_Main.Active = False then exit;
  if qry_Main.FieldByName('序号').AsString = '' then exit;
  FrmTaskUpdate := TFrmTaskUpdate.Create(nil);
  try
    FrmTaskUpdate.edt_Content.Text   := qry_Main.FieldByName('任务内容').AsString ;
    FrmTaskUpdate.lbl_TaskID.Caption := qry_Main.FieldByName('序号').AsString ;
    FrmTaskUpdate.ShowModal;
  finally
    FrmTaskUpdate.Free;
  end;
  qry_Main.Requery();
end;

procedure TfrmTaskList.btn_AddFileClick(Sender: TObject);
var
  AddFileName : String;
  Dlg1 : TOpenDialog;
  Stream : TMemoryStream;
begin
  if qry_main.active = False then exit;
  Dlg1 := TOpenDialog.Create(nil);
  Dlg1.Filter := 'Microsoft Excel File(*.xls;*.xlsx)|*.xls;*.xlsx|WordFile|*.doc;*.docx|PDF File|*.PDF';
  if Dlg1.Execute then
  begin
    AddFileName := Trim(Dlg1.FileName);
    Dlg1.Free;
  end
  else
  begin
    Dlg1.Free;
    exit;
  end;
  try
   with qry2 do
   begin
     Close;
     sql.Clear;
     sql.Add('Update TaskList Set sFileName=' + QuotedStr(ExtractFileName(AddFileName)) + ' , sFileData=:Blob Where TaskID='+qry_Main.FieldByName('序号').AsString);
     Stream := TMemoryStream.Create;
     Stream.LoadFromFile(AddFileName);
     Stream.Position := 0;
     Parameters.ParamByName('Blob').LoadFromStream(Stream,ftBlob);;
     ExecSQL;
     Stream.Free;
   end;
   qry_Main.Requery;
   Application.MessageBox('成功添加新任务！','公文管理',0+64);
 except on E:Exception do
   begin
     Application.MessageBox(Pchar(E.Message),'公文管理',0+MB_ICONERROR);
     exit;
   end;
 end;
end;

procedure TfrmTaskList.btn_ExportClick(Sender: TObject);
begin
  if qry_Main.Active = False then exit;
  if dbgrdh1.RowCount = 0 then exit;
  Try
    btn_Export.Enabled := false;
    DBGridToExcel(dbgrdh1,cbb_Year.Text + '工作任务进度表');
    btn_Export.Enabled := true;
    Application.MessageBox('导出数据完成！','公文管理',0+64);
  except
    btn_Export.Enabled := true;
    Application.MessageBox('导出数据电子文档失败','公文管理',0+64);
    exit;
  End;
end;

procedure TfrmTaskList.btn_QueryClick(Sender: TObject);
begin
  GetWhereStr;
  with qry_Main do
  begin
    Close;
    sql.Clear;
    SQL.Add('Select a.TaskID As 序号, a.XDBM AS 任务下达部门,a.sYear AS 任务年度 , a.WJBH AS 文号, a.ZBLX AS 主办类型,'+
            'a.TaskContent AS 任务内容, a.Admin AS 负责领导, a.Operter AS 主办人, a.ViceOperter AS 协办人, a.EndDate AS 到期日期,'+
            'a.sFileName AS 附件名, a.isEnd AS 是否完结,(select Top 1 b.Detail from TaskProgress AS b where b.TaskID=a.TaskID Order by b.NewDate Desc) As 最新进展 ,'+
            '(select Top 1 b.sFileName from TaskProgress AS b where b.TaskID=a.TaskID Order by b.NewDate Desc)  As 进度证明材料 '+
            'From TaskList AS a '+ StrWhere+' Order by a.TaskID ASC' );
    Open;
  end;
end;

procedure TfrmTaskList.cbb_ControllerDropDown(Sender: TObject);
begin
  if cbb_Controller.Items.Count > 0 then exit;
  cbb_Controller.Clear;
  with qry2 do
  begin
    Close;
    SQL.Clear;
    SQL.Add('select distinct Admin from tasklist Order by Admin ASC');
    Open;
  end;
  while Not qry2.Eof do
  begin
    cbb_Controller.Items.Add(qry2.FieldByName('Admin').AsString);
    qry2.Next;
  end;
  qry2.Close;
end;

procedure TfrmTaskList.cbb_OperaterDropDown(Sender: TObject);
begin
  if cbb_Operater.Items.Count > 0 then exit;
  cbb_Operater.Clear;
  with qry2 do
  begin
    Close;
    SQL.Clear;
    SQL.Add('select distinct Operter from tasklist Order by Operter ASC');
    Open;
  end;
  while Not qry2.Eof do
  begin
    cbb_Operater.Items.Add(qry2.FieldByName('Operter').AsString);
    qry2.Next;
  end;
  qry2.Close;
end;


procedure TfrmTaskList.dbgrdh1DblClick(Sender: TObject);
var
  S : TMemoryStream;
  sTemppath, sFileName, sTable, sOrder : String;
begin
  if qry_Main.Active = False then Exit ;
  if Not ((Trim(dbgrdh1.SelectedField.FieldName)='附件名') OR (Trim(dbgrdh1.SelectedField.FieldName)='进度证明材料')) then exit;
  if (Trim(qry_Main.FieldByName('附件名').AsString) = '')  And (Trim(dbgrdh1.SelectedField.FieldName)='附件名')  then exit;
  if (Trim(qry_Main.FieldByName('进度证明材料').AsString) = '') And (Trim(dbgrdh1.SelectedField.FieldName)='进度证明材料') then exit;
  if Trim(dbgrdh1.SelectedField.FieldName)='附件名' then sTable :='TaskList';
  if Trim(dbgrdh1.SelectedField.FieldName)='进度证明材料' then
  begin
    sTable := 'TaskProgress';
    sOrder := ' Order By NewDate Desc'
  end;
  sTemppath := ExtractFilePath(Application.ExeName)+'tempfile\';
  Try
    Screen.Cursor := crHourGlass;
    With qry2 do
    begin
      Close;
      SQL.Clear;
      SQL.Add('Select Top 1 sFileName,sFileData from '+ sTable +' Where TaskID=' + IntToStr(qry_Main.Fields[0].asinteger)+ sOrder);
      Open;
    end;
    sFileName := sTemppath + qry2.FieldByName('sfilename').AsString ;
    S := TMemoryStream.Create;
    TBlobField(Qry2.FieldByName('sFileData')).SaveToStream(S);
    S.Position := 0;
    S.SaveToFile(sFileName);
    S.Free;
    Screen.Cursor := crDefault;
    if ShellExecute(Application.Handle,'open', Pchar(sFileName),'','',SW_SHOWNORMAL)<32 then
    begin
      ShellExecute(0,nil, Pchar(sTemppath),nil,nil,SW_SHOW);
    end;
  Except
    Screen.Cursor := crDefault;
    Application.MessageBox('打开文件失败','公文管理',0+64);
  End;

end;

procedure TfrmTaskList.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  qry_Main.Active := False;
  qry2.Active := False;
  ACtion := caFree;
end;

initialization
  CoInitialize(Nil);
  RegisterClass(TfrmTaskList);
finalization
  UnRegisterClass(TfrmTaskList);
  CoUninitialize;
  FreeAndNil(frmTaskList);

end.

unit Unit_ZhuijiaYSKM;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes,  Controls, Forms,
  Dialogs,ActiveX, DB, ADODB, Grids, DBGrids, StdCtrls, DBCtrls, Mask, ExtCtrls;

type
  TfrmKM = class(TForm)
    dbgrd1: TDBGrid;
    ds1: TDataSource;
    qry1: TADOQuery;
    grp1: TGroupBox;
    dbtYear: TDBEdit;
    dbtKMDM: TDBEdit;
    dbtKMMC: TDBEdit;
    cbbSZLX: TDBComboBox;
    cbbKMJC: TDBComboBox;
    cbbUse: TDBComboBox;
    dbmmo: TDBMemo;
    lbl1: TLabel;
    Label1: TLabel;
    lbl2: TLabel;
    lbl3: TLabel;
    lbl4: TLabel;
    lbl5: TLabel;
    lbl6: TLabel;
    btnModify: TButton;
    btnCancel: TButton;
    btnDel: TButton;
    btnQuery: TButton;
    lbl7: TLabel;
    lblKMDM: TLabel;
    edtKMDM: TEdit;
    cbbYear: TComboBox;
    btnInsert: TButton;
    btnSave: TButton;
    lbl8: TLabel;
    btnClsoe: TButton;
    btnGenNewYear: TButton;
    lbl9: TLabel;
    lbl10: TLabel;
    lbl11: TLabel;
    qry_tmp: TADOQuery;
    procedure btnQueryClick(Sender: TObject);
    procedure btnModifyClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure cbbYearChange(Sender: TObject);
    procedure edtKMDMChange(Sender: TObject);
    procedure btnDelClick(Sender: TObject);
    procedure btnInsertClick(Sender: TObject);
    procedure btnSaveClick(Sender: TObject);
    procedure qry1AfterOpen(DataSet: TDataSet);
    procedure btnClsoeClick(Sender: TObject);
    procedure btnGenNewYearClick(Sender: TObject);
  private
    { Private declarations }
    procedure InputActive(bBool : Boolean);
  public
    { Public declarations }
  end;

var
  frmKM: TfrmKM;

implementation
uses DataMoudle;

{$R *.dfm}

procedure TfrmKM.btnCancelClick(Sender: TObject);
begin
  InputActive(False);
  qry1.Cancel;
  dbgrd1.Enabled := true;
  dbgrd1.SetFocus;
end;

procedure TfrmKM.btnClsoeClick(Sender: TObject);
begin
  Self.Close;
end;

procedure TfrmKM.btnDelClick(Sender: TObject);
begin
  if Not qry1.Active then exit;
  if Not btnInsert.Enabled then exit;
  if qry1.RecordCount > 0 then
  begin
    if MessageBox(Handle,'确定要删除该科目吗？','提示',MB_YESNO+MB_ICONQUESTION)=IDYes then
    begin
      qry1.Delete;
      qry1.Requery();
      ShowMessage('已删除');
    end;
  end
  else
  begin
    MessageBox(Handle,'无科目可删除','提示',MB_OK+MB_ICONINFORMATION);
  end;
end;

procedure TfrmKM.btnGenNewYearClick(Sender: TObject);
var
  sCurrentYear,sNewYear : string;
begin
  if MessageBox(Handle,'确实要生成下一年度科目吗？','提示',mb_YesNo+MB_ICONQUESTION) = ID_NO  then exit;
  sCurrentYear := FormatDateTime('YYYY',Now);
  sNewYear := IntToStr(strtoint(sCurrentYear) + 1);
  with qry_tmp do
  begin
    Close;
    sql.Clear;
    SQL.Add('insert into zhuijia_kmdm select '+QuotedStr(sNewYear)+',KMDM,KMMC,SZLX,JC,inUse,Memo1 from zhuijia_kmdm where sYear='+QuotedStr(sCurrentYear));
    ExecSQL;
  end;
  ShowMessage('生成新年度科目表完成！');
  qry_tmp.Close;
end;

procedure TfrmKM.btnInsertClick(Sender: TObject);
begin
  if Not qry1.Active then exit;
  InputActive(True);
  qry1.Insert;
  btnInsert.Enabled := false;
  dbgrd1.Enabled := false;
  dbtYear.SetFocus;
end;

procedure TfrmKM.btnModifyClick(Sender: TObject);
begin
  if Not qry1.Active then exit;
  if qry1.RecordCount = 0 then exit;
  InputActive(True);
  qry1.Edit;
  btnModify.Enabled := false;
  dbtYear.SetFocus;
end;

procedure TfrmKM.btnQueryClick(Sender: TObject);
var
 sWhere :string;
begin
  sWhere := '';
  sWhere := ' where sYear='+QuotedStr(cbbYear.Text);
  if Trim(edtKMDM.Text) <> ''  then
  begin
    sWhere := sWhere + ' And KMDM like '''+ Trim(edtKMDM.Text) + '%'' ';
  end;
  with qry1 do
  begin
    Close;
    SQL.Clear;
    SQL.Add('select * from zhuijia_kmdm '+sWhere);
    open;
  end;
end;

procedure TfrmKM.btnSaveClick(Sender: TObject);
begin
  qry1.Post;
  dbgrd1.Enabled :=true;
  InputActive(False);
end;

procedure TfrmKM.cbbYearChange(Sender: TObject);
begin
  btnQuery.Click;
end;

procedure TfrmKM.edtKMDMChange(Sender: TObject);
begin
  btnQuery.Click;
end;

procedure TfrmKM.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  qry1.Active := false;
end;

procedure TfrmKM.InputActive(bBool: Boolean);//Enable or Disable input controle
begin
    dbtYear.Enabled := bBool;
    dbtKMDM.Enabled := bBool;
    dbtKMMC.Enabled := bBool;
    cbbSZLX.Enabled := bBool;
    cbbKMJC.Enabled := bBool;
    cbbUse.Enabled := bBool;
    dbmmo.Enabled := bBool;
    btnSave.Enabled:= bBool;
    btnCancel.Enabled:= bBool;
    btnDel.Enabled := Not bBool;
    btnModify.Enabled := Not bBool;
    btnInsert.Enabled := Not bBool;
end;

procedure TfrmKM.qry1AfterOpen(DataSet: TDataSet);
begin
  lbl8.Caption := '当前共有： '+IntToStr(qry1.RecordCount)+ ' 条记录。';
end;

initialization
  CoInitialize(Nil);
  RegisterClass(TfrmKM);
finalization
  UnRegisterClass(TfrmKM);
  CoUninitialize;
  FreeAndNil(frmKM);

end.

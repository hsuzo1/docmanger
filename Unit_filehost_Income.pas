unit Unit_filehost_Income;    //׷���ļ��Ǽ�

interface

uses
  Windows, Messages, SysUtils, Classes,  Controls, Forms,
  Dialogs,StdCtrls, ExtCtrls, Buttons, DB, ADODB, ComCtrls,ActiveX,
  DBGridEhGrouping, GridsEh, DBGridEh, Menus, ToolWin, ImgList, Grids, DBGrids,
  ToolCtrlsEh, DBGridEhToolCtrls, DynVarsEh, EhLibVCL, DBAxisGridsEh, AppEvnts,
  ShellAPI,Variants, DBGrid2Excel;


type
  TfrmIncome = class(TForm)
    btn_Query: TButton;
    qry_shangji: TADOQuery;
    ds1: TDataSource;
    pgc1: TPageControl;
    tsShangji: TTabSheet;
    tsBenji: TTabSheet;
    btn5: TButton;
    btnExport: TBitBtn;
    cbb_wenhao: TComboBox;
    edt_title: TEdit;
    edt_KMDM: TEdit;
    cbb_yixiada: TComboBox;
    cbb_keshi: TComboBox;
    qry_temp: TADOQuery;
    cbb_year: TComboBox;
    lbl1: TLabel;
    lbl2: TLabel;
    lbl3: TLabel;
    lbl4: TLabel;
    lbl6: TLabel;
    lbl9: TLabel;
    lbl5: TLabel;
    lbl7: TLabel;
    lbl8: TLabel;
    lbl10: TLabel;
    ctrlbr1: TControlBar;
    tlb1: TToolBar;
    il1: TImageList;
    btn6: TToolButton;
    btn7: TToolButton;
    btn8: TToolButton;
    btn9: TToolButton;
    ToolButton1: TToolButton;
    btn1: TButton;
    qry_sbj: TADOQuery;
    ds2: TDataSource;
    dbgrd1: TDBGrid;
    dbgrd_sbj: TDBGrid;
    pmMain: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    Excel1: TMenuItem;
    btn2: TButton;
    btn11: TButton;
    btn12: TButton;
    pnl1: TPanel;
    spl1: TSplitter;
    dbDetail: TDBGridEh;
    chkDetail: TCheckBox;
    qryDetail: TADOQuery;
    btnCancel: TButton;
    btnCancel2: TButton;
    cbbYearSBJ: TComboBox;
    edtKMDMSBJ: TEdit;
    cbbKeshiSBJ: TComboBox;
    cbbWenhaoSBJ: TComboBox;
    cbbXiadaSBJ: TComboBox;
    edtTitleSBJ: TEdit;
    lbl11: TLabel;
    lbl12: TLabel;
    btn10: TToolButton;
    dsDetail: TDataSource;
    dlgSave1: TSaveDialog;
    dbgrd2xcl1: TDBGrid2Excel;
    btnConfig: TToolButton;
    N3: TMenuItem;
    N4: TMenuItem;
    N5: TMenuItem;
    dlgOpen1: TOpenDialog;
    N6: TMenuItem;
    N7: TMenuItem;
    procedure btn1Click(Sender: TObject);
    procedure btn_QueryClick(Sender: TObject);
    procedure cbb_keshiChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure pgc1Change(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnExportClick(Sender: TObject);
    procedure dbgrd1DblClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btn6Click(Sender: TObject);
    procedure btn7Click(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure Excel1Click(Sender: TObject);
    procedure btn5Click(Sender: TObject);
    procedure btn2Click(Sender: TObject);
    procedure btn11Click(Sender: TObject);
    procedure btn12Click(Sender: TObject);
    procedure chkDetailClick(Sender: TObject);
    procedure dbgrd1CellClick(Column: TColumn);
    procedure dbgrd1KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure dbgrd1KeyPress(Sender: TObject; var Key: Char);
    procedure btnCancelClick(Sender: TObject);
    procedure btnCancel2Click(Sender: TObject);
    procedure cbbWenhaoSBJChange(Sender: TObject);
    procedure edtTitleSBJChange(Sender: TObject);
    procedure edtKMDMSBJChange(Sender: TObject);
    procedure cbbKeshiSBJDropDown(Sender: TObject);
    procedure cbbKeshiSBJChange(Sender: TObject);
    procedure cbb_wenhaoChange(Sender: TObject);
    procedure edt_titleChange(Sender: TObject);
    procedure edt_KMDMChange(Sender: TObject);
    procedure cbb_keshiDropDown(Sender: TObject);
    procedure cbb_yixiadaChange(Sender: TObject);
    procedure cbbXiadaSBJChange(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure btn8Click(Sender: TObject);
    procedure btnConfigClick(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure N4Click(Sender: TObject);
    procedure dbgrd_sbjDblClick(Sender: TObject);
    procedure N6Click(Sender: TObject);
    procedure N7Click(Sender: TObject);
  private
    { Private declarations }
    var
      sTable, sWhereStr, s_Year, s_Wenhao,s_Title, s_KMDM,s_Xiada, sTemppath : string;
      s_yearSBJ,s_WenhaoSBJ,s_TitleSBJ, s_KMDMSBJ, s_XiadaSBJ : string;
      procedure OnMouseWheel(var Msg:TMsg;var Handled : Boolean);//�¼��������������
      procedure uploadfile(Sid,Fname,sOrder:string);        //�ϴ��ļ�����
      procedure AppendFile(tQuery : TADOQuery;sLevel,sFlag: string);//�����ļ� Query���ƣ�����(0)or����(1)
      procedure Openfile(tDbgrid :TDBGrid;tQuery : TADOQuery);  //�򿪲��鿴�ļ�
      procedure DeleteRecord(tmpAQry : TADOQuery; sLevel : String); //ɾ����¼
      procedure DeleteAttach(tmpAQry : TADOQuery; sLevel,sFlag: String); //ɾ�������ļ� ADOQuery '9'�ϼ���'7'������ ,'1'���� '2'����
  public
    { Public declarations }
    var
      sAdmin{�Ƿ��Ĺ�Ա},ADuser{�û�} : string;
  end;

var
  frmIncome: TfrmIncome;

implementation

uses ComObj  , Unit_ZhuijiaApp,Unit_ZhuijiaYSKM, DataMoudle,Unit_Function,UnitFileThread_zhuijia;

{$R *.dfm}
 {
procedure TfrmIncome.aplctnvnts1Message(var Msg: tagMSG; var Handled: Boolean);
begin

  if (DBGrd1.Focused) And (Msg.message = WM_MOUSEWHEEL) then
  begin
    if Msg.wParam > 0 then
      SendMessage(DBGrd1.Handle, WM_KEYDOWN, VK_UP, 0)
    else
      SendMessage(DBGrd1.Handle, WM_KEYDOWN, VK_DOWN, 0);

    Handled := True;

  end;

end;
}

procedure TfrmIncome.AppendFile(tQuery : TADOQuery;sLevel,sFlag:string);   //sLevel ��ʡ�����б����ĺ�'9' '7'
var
  sName,sMark,sOrd:string;        //sName:�ֶ����ƣ�sMark:�ֶ����ݱ�ǣ�sOrd����������1���Ǹ���2
  sID,sN : string;                //sId:��¼��ʾ��sN���ϴ����ļ�����
begin
  if tQuery.Active = False then exit;
  if sFlag='1' then
  begin
    sName := '����';
    sMark := '������';
    sOrd  := '';
  end
  else
  begin
    sName := '����';
    sMark := '�и���';
    sOrd  := '1';
  end;
  if Trim(tQuery.FieldByName(sName).AsString)=sMark then
  begin
    if MessageDlg('���С� '+sName+' ������ȷʵҪ�ϴ�������',mtinformation,[mbyes,mbno],0) = id_no then Exit;
  end;
  if dlgOpen1.Execute then
  begin
    try
      if Unit_Function.IsFileInUse(dlgOpen1.FileName)=True then
      begin
        ShowMessage('�ļ����ڱ���������ʹ�ã����ȹر��ļ������ԡ�');
        exit;
      end;
      sID := Trim(tQuery.Fields[0].AsString);
      sN  := Trim(dlgOpen1.FileName);
      uploadfile(sLevel+sID,sN,sOrd);
      with qry_temp do
      begin
       Close;
       sql.Clear;
       sql.Add('Update '+sTable+' Set file'+sFlag+'='+QuotedStr(sMark)+' Where sID='+sID );
       ExecSQL;
      end;
    except
      ShowMessage('�ϴ�ʧ��');
      qry_temp.CancelUpdates;
      Exit;
    end;
    tQuery.Requery;
    ShowMessage('�ϴ��ɹ���');
    Unit_Function.InsertLog(Now,ADuser,'�ϴ��ļ���'+sN);
  end;
end;

procedure TfrmIncome.btn11Click(Sender: TObject);
begin
  qry_shangji.Edit;
  qry_shangji.Post;
  qry_shangji.UpdateBatch(arAll);
end;

procedure TfrmIncome.btn12Click(Sender: TObject);
begin
  qry_sbj.Edit;
  qry_sbj.Post;
  qry_sbj.UpdateBatch(arall);
end;

procedure TfrmIncome.btn1Click(Sender: TObject);
begin
  Close;
end;

procedure TfrmIncome.btn_QueryClick(Sender: TObject);
begin
  if pgc1.ActivePage.Name = 'tsShangji' then
    begin
     sWhereStr :='';
     sWhereStr  := ' Where BudgetYear ='+QuotedStr(cbb_year.Text);
     sWhereStr  := sWhereStr + s_Wenhao + s_Title + s_KMDM + s_Xiada;
     with qry_shangji do
     begin
      Close;
      sql.Clear;
      sql.Add('select sID,AddDate as �Ǽ�����,YSLY as �ʽ���Դ,ZJLX as �ʽ�����,isWZZ as ������,isPrior as ��ǰ�´�,'
            +'ItemNumber as ��Ŀ����,WJBT as �ļ�����,wenhao as �ĺ�,DetailWenhao as �����´��ĺ�,'
            +'KMDM as �����Ŀ,KMDM1 as ���ܿ�Ŀ,KMDM2 as ���ÿ�Ŀ,MIJI as ��,FileDate as ��������,'
            +'ZGkeshi as ���ܿ���,YSZJ as �ܽ��,SBJ as �б���,CQ_XN as ������,'
            +'CQ_qx as ������,CQ_xxt as ��������,CQ_jn as ������ ,CQ_yn as ������,'
            +'CQ_lq as ������,CQ_wm as ������,K_gx as ������,K_jk as ������,K_dm as ������,'
            +'K_qxs as ����ɽ,X_hx as ����,X_by as ������,X_sl as ������,X_ms as ��ɽ��,'
            +'X_la as ¡����,file1 as ����,file2 as ����,Memo as ��ע from zhuijia_sheng_tan '
            + sWhereStr + ' Order by �ĺ� Desc');
      Open;
     end;
     btn5.Enabled := True;
    end;
  if pgc1.ActivePage.Name = 'tsBenji'   then
  begin
    begin
     sWhereStr :='';
     sWhereStr  := ' Where BudgetYear ='+QuotedStr(cbbYearSBJ.Text);
     sWhereStr  := sWhereStr + s_WenhaoSBJ + s_TitleSBJ + s_KMDMSBJ + s_XiadaSBJ ;
     with qry_sbj do
     begin
      Close;
      sql.Clear;
      sql.Add('select sID,AddDate as �Ǽ�����,YSLY as �ʽ���Դ,ZJLX as �ʽ�����,isWZZ as ������,isPrior as ��ǰ�´�,'
            +'ItemNumber as ��Ŀ����,WJBT as �ļ�����,Wenhao as �ĺ�,'
            +'DetailWenhao as �ϼ��ĺ�,KMDM as �����Ŀ,KMDM1 as ֧�����ܿ�Ŀ,KMDM2 as ���ÿ�Ŀ,MIJI as ��,FileDate as ��������,'
            +'ZGkeshi as ���ܿ���,YSZJ as �ܽ��,SBJ as �б���,CQ_XN as ������,'
            +'CQ_qx as ������,CQ_xxt as ��������,CQ_jn as ������ ,CQ_yn as ������,'
            +'CQ_lq as ������,CQ_wm as ������,K_gx as ������,K_jk as ������,K_dm as ������,'
            +'K_qxs as ����ɽ,X_hx as ����,X_by as ������,X_sl as ������,X_ms as ��ɽ��,'
            +'X_la as ¡����,file1 as ����,file2 as ����,Memo as ��ע from zhuijia_shi_tan '
            + sWhereStr + ' Order by �ĺ� Desc');
      Open;
     end;
    end;
    btn2.Enabled := True;
  end;

//  for i := 0 to dbgrdh1.Columns.Count - 1 do
//    begin
//      with dbgrdh1.Columns[i] do
//      begin
//        OptimizeWidth;
//      end;
//    end;
end;

procedure TfrmIncome.btn2Click(Sender: TObject);
begin
  dbgrd_sbj.ReadOnly := Not dbgrd_sbj.ReadOnly;
  btn12.Enabled := Not btn12.Enabled;
  btnCancel2.Enabled := Not btnCancel2.Enabled;
  if btn2.Caption = '�޸�' then btn2.Caption := 'ֻ��' else btn2.Caption := '�޸�';
end;

procedure TfrmIncome.btnExportClick(Sender: TObject);
begin
  if (Not qry_shangji.Active ) And (pgc1.ActivePageIndex = 0)  then exit;
  if (Not qry_sbj.Active ) And (pgc1.ActivePageIndex = 1)  then exit;
  dbgrd2xcl1.Workbook := nil;
  dbgrd2xcl1.WorksheetName := pgc1.ActivePage.Caption;
  try
    if pgc1.ActivePageIndex = 0 then dbgrd2xcl1.DBGrid := dbgrd1;
    if pgc1.ActivePageIndex = 1 then dbgrd2xcl1.DBGrid := dbgrd_sbj;
    if dlgSave1.Execute then
    begin
      dbgrd2xcl1.SaveDBGridAs(dlgSave1.FileName);
      ShowMessage('���ݱ���ɹ���');
    end;
  except
    ShowMessage('���ݱ�����ִ���');
  end;
end;

procedure TfrmIncome.btn5Click(Sender: TObject);
begin
  dbgrd1.ReadOnly := Not dbgrd1.ReadOnly;
  Btn11.Enabled := Not Btn11.Enabled;
  btnCancel.Enabled := Not btnCancel.Enabled;
  if btn5.Caption = '�޸�' then btn5.Caption := 'ֻ��' else btn5.Caption := '�޸�';
end;

procedure TfrmIncome.btn6Click(Sender: TObject);
var
  frm_ZhuijiaApp: Tfrm_ZhuijiaApp;
begin
  frm_ZhuijiaApp := Tfrm_ZhuijiaApp.Create(nil);
  Try
    frm_ZhuijiaApp.ShowModal;
  Finally
    FreeAndNil(frm_ZhuijiaApp);
  End;
end;

procedure TfrmIncome.btn7Click(Sender: TObject);  //ɾ����¼
begin
  if pgc1.ActivePage.Name = 'tsShangji' then DeleteRecord(qry_shangji,'9') else DeleteRecord(qry_sbj,'7');
end;

procedure TfrmIncome.btn8Click(Sender: TObject);
begin
  if (pgc1.ActivePageIndex =0) and (btn11.Enabled) then
  begin
   btn11.Click;
   ShowMessage('����ɹ���');
  end;
  if (pgc1.ActivePageIndex =1) and (btn12.Enabled) then
  begin
    ShowMessage('����ɹ���');
    btn12.Click;
  end;

end;

procedure TfrmIncome.btnCancel2Click(Sender: TObject);
begin
  qry_sbj.CancelBatch(arAll);
  qry_sbj.Requery();
end;

procedure TfrmIncome.btnCancelClick(Sender: TObject);
begin
  qry_shangji.CancelBatch(arAll);
  qry_shangji.Requery();
  btn5.Click;
end;

procedure TfrmIncome.btnConfigClick(Sender: TObject);
var
  frmKM: TfrmKM;
begin
  frmKM := TfrmKM.Create(nil);
  Try
    frmKM.ShowModal;
  Finally
    FreeAndNil(frmKM);
  End;
end;

procedure TfrmIncome.cbbKeshiSBJChange(Sender: TObject);
begin
  if (cbbKeshiSBJ.ItemIndex = 0) OR (Not qry_sbj.Active) then
  begin
    qry_sbj.Filtered := False;
    exit;
  end;
  qry_sbj.Filter := '���ܿ���='+QuotedStr(cbbKeshiSBJ.Text);
  qry_sbj.Filtered := True;
end;

procedure TfrmIncome.cbbKeshiSBJDropDown(Sender: TObject);
begin
  if cbbKeshiSBJ.Items.Count > 1 then exit;
  with qry_temp do
  begin
    close;
    sql.Clear;
    sql.Add('Select distinct zgkeshi from '+sTable+' where BudgetYear='+QuotedStr(cbbYearSBJ.Text));
    open;
    while Not Eof do
    begin
      if Trim(FieldByName('zgkeshi').AsString) <>'' then cbbKeshiSBJ.Items.Add(FieldByName('zgkeshi').AsString);
      Next;
    end;
    close;
  end;
end;

procedure TfrmIncome.cbbWenhaoSBJChange(Sender: TObject);
begin
 if (Trim(cbbWenhaoSBJ.Text)<>'')  then
  begin
    s_WenhaoSBJ := ' And (Wenhao Like ''%'+Trim(cbbWenhaoSBJ.Text)+ '%'') ';
  end
  else
  begin
    s_WenhaoSBJ := '';
  end;
  btn_Query.Click;
end;

procedure TfrmIncome.cbbXiadaSBJChange(Sender: TObject);
begin
  case cbbXiadaSBJ.ItemIndex of
  0 : s_XiadaSBJ := '';
  1 : s_XiadaSBJ := ' And ( DetailID is Not Null) ';
  2 : s_XiadaSBJ := ' And ( DetailID is Null) ';
  end;
  btn_Query.Click;
end;

procedure TfrmIncome.cbb_keshiChange(Sender: TObject);
begin
  if (cbb_keshi.ItemIndex = 0) OR (Not qry_shangji.Active) then
  begin
    qry_shangji.Filtered := False;
    exit;
  end;
  qry_shangji.Filter := '���ܿ���='+QuotedStr(cbb_keshi.Text);
  qry_shangji.Filtered := True;
end;

procedure TfrmIncome.cbb_keshiDropDown(Sender: TObject);
begin
  if cbb_keshi.Items.Count > 1 then exit;
  with qry_temp do
  begin
    close;
    sql.Clear;
    sql.Add('Select distinct zgkeshi from '+sTable+' where BudgetYear='+QuotedStr(cbb_year.Text));
    open;
    while Not Eof do
    begin
      if Trim(FieldByName('zgkeshi').AsString) <>'' then cbb_keshi.Items.Add(FieldByName('zgkeshi').AsString);
      Next;
    end;
    close;
  end;
end;

procedure TfrmIncome.cbb_wenhaoChange(Sender: TObject);
begin
if (Trim(cbb_wenhao.Text)<>'')  then
  begin
    s_Wenhao := ' And (Wenhao Like ''%'+Trim(cbb_wenhao.Text)+ '%'') ';
  end
  else
  begin
    s_Wenhao := '';
  end;
  btn_Query.Click;
end;

procedure TfrmIncome.cbb_yixiadaChange(Sender: TObject);
begin
  case cbb_yixiada.ItemIndex of
  0 : s_Xiada := '';
  1 : s_Xiada := ' And ( DetailID is Not Null) ';
  2 : s_Xiada := ' And ( DetailID is Null) ';
  end;
  btn_Query.Click;
end;

procedure TfrmIncome.chkDetailClick(Sender: TObject);
begin
  if chkDetail.Checked then
  begin
    dbDetail.Visible := true;
    dbDetail.Height := 300;
    dbgrd1.Height := pnl1.Height - 303;
  end
  else
  begin
    dbDetail.Visible := false;
    dbgrd1.Height := pnl1.Height - 3;
  end;
end;

procedure TfrmIncome.dbgrd1CellClick(Column: TColumn);
begin
  if Not chkDetail.Checked then exit;
  if Trim(qry_shangji.Fields[0].AsString)='' then exit;
  qryDetail.Close;
  qryDetail.SQL.clear;
  qryDetail.SQL.Add('select sID,AddDate as �Ǽ�����,YSLY as �ʽ���Դ,ZJLX as �ʽ�����,isWZZ as ������,isPrior as ��ǰ�´�,'
            +'ItemNumber as ��Ŀ����,WJBT as �ļ�����,Wenhao as �ĺ�,'
            +'DetailWenhao as �ϼ��ĺ�,KMDM as �����Ŀ,KMDM1 as ֧�����ܿ�Ŀ,KMDM2 as ���ÿ�Ŀ,MIJI as ��,FileDate as ��������,'
            +'ZGkeshi as ���ܿ���,YSZJ as �ܽ��,SBJ as �б���,CQ_XN as ������,'
            +'CQ_qx as ������,CQ_xxt as ��������,CQ_jn as ������ ,CQ_yn as ������,'
            +'CQ_lq as ������,CQ_wm as ������,K_gx as ������,K_jk as ������,K_dm as ������,'
            +'K_qxs as ����ɽ,X_hx as ����,X_by as ������,X_sl as ������,X_ms as ��ɽ��,'
            +'X_la as ¡����,file1 as ����,file2 as ����,Memo as ��ע from zhuijia_shi_tan where DetailID = '
            + QuotedStr(Trim(qry_shangji.FieldByName('sID').AsString)));
  qryDetail.Open;
end;

procedure TfrmIncome.dbgrd1DblClick(Sender: TObject);  //�鿴�ĵ�
begin
  Openfile(dbgrd1,qry_shangji);
end;

procedure TfrmIncome.dbgrd1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Not dbgrd1.ReadOnly) And (dbgrd1.SelectedIndex = 0) then Key := 0;
end;

procedure TfrmIncome.dbgrd1KeyPress(Sender: TObject; var Key: Char);
begin
  if (Not dbgrd1.ReadOnly) And (dbgrd1.SelectedIndex = 0) then Key := #0;
end;

procedure TfrmIncome.dbgrd_sbjDblClick(Sender: TObject);
begin
  Openfile(dbgrd_sbj,qry_sbj);
end;

procedure TfrmIncome.DeleteAttach(tmpAQry: TADOQuery; sLevel,sFlag: String); //ɾ������
var
  RecID,Str : string;
begin
  if (Not tmpAQry.Active) OR (tmpAQry.RecordCount = 0)  then exit;
  if Application.MessageBox('ȷʵҪɾ����','��ʾ',mb_YesNo) = ID_YES  then
  begin
    try
      RecID := sLevel+Trim(tmpAQry.FieldByName('sID').AsString);
      if Trim(sFlag) = '' then Str := 'file1' else Str := 'file2';
      //delete attachment
      with qry_temp do
      begin
        Close;
        sql.Clear;
        sql.Add('Update Zhuijia_FileTable Set [filename'+sFlag+']=NULL, fileblob'+sFlag+'=NULL'+' Where fieldid='+QuotedStr(RecID));
        SQL.Add('Update '+sTable+ ' Set '+Str+ '=''��'' where sID='+Quotedstr(Trim(tmpAQry.FieldByName('sID').AsString)));
        ExecSQL;
      end;
      qry_temp.Close;
      Application.MessageBox('ɾ���ɹ���','��ʾ',64);
      Unit_Function.InsertLog(Now,ADuser,'ɾ��'+sLevel+'��¼'+RecID);
    except
      Application.MessageBox('ϵͳ����','��ʾ',64);
    end;
  end;
  tmpAQry.Requery();
end;

procedure TfrmIncome.DeleteRecord(tmpAQry: TADOQuery; sLevel: String);   //ɾ����ǰ��¼   ��ǰADOQuery���ƣ���9�������� ��7���б���
var
  sTableID, RecID : string;
begin
  if sLevel = '9' then sTableID := '������׷��' else  sTableID := '�б�����';
  if (Not tmpAQry.Active) OR (tmpAQry.RecordCount = 0)  then exit;
  if Application.MessageBox('ȷʵҪɾ����ǰ���ݼ�¼��','��ʾ',mb_YesNo+MB_ICONQUESTION+MB_DEFBUTTON2) = ID_YES  then
  begin
    try
      RecID := Trim(tmpAQry.FieldByName('sID').AsString);
      tmpAQry.Delete;//Delete current Record from maintable
      //delete attachment
      if (Trim(tmpAQry.FieldByName('����').AsString) <> '') OR (Trim(tmpAQry.FieldByName('����').AsString) <> '') then
      begin
        with qry_temp do
        begin
          Close;
          sql.Clear;
          sql.Add('Delete from Zhuijia_FileTable Where fieldid='+QuotedStr(sLevel+RecID));
          ExecSQL;
        end;
        qry_temp.Close;
      end;
      Application.MessageBox('ɾ���ɹ���','��ʾ',64);
      Unit_Function.InsertLog(Now,ADuser,'ɾ��'+sTableID+'��¼'+RecID);
    except
      Application.MessageBox('ϵͳ����','��ʾ',64);
    end;
  end;
  tmpAQry.Requery();
end;

procedure TfrmIncome.edtKMDMSBJChange(Sender: TObject);
begin
  if Length(Trim(edtKMDMSBJ.Text))>2 then
    begin
      s_KMDMSBJ := ' And (KMDM1 Like '''+Trim(edtKMDMSBJ.Text)+ '%'') ';
    end
    else
    begin
      s_KMDMSBJ := '';
    end;
  btn_Query.Click;
end;

procedure TfrmIncome.edtTitleSBJChange(Sender: TObject);
begin
  if Trim(edttitleSBJ.Text)<>'' then
    begin
      s_TitleSBJ := ' And (WJBT Like ''%'+Trim(edtTitleSBJ.Text)+ '%'') ';
    end
    else
    begin
      s_TitleSBJ := '';
    end;
  btn_Query.Click;
end;

procedure TfrmIncome.edt_KMDMChange(Sender: TObject);
begin
  if Length(Trim(edt_KMDM.Text))>2 then
    begin
      s_KMDM := ' And (KMDM1 Like '''+Trim(edt_KMDM.Text)+ '%'') ';
    end
    else
    begin
      s_KMDM := '';
    end;
  btn_Query.Click;
end;

procedure TfrmIncome.edt_titleChange(Sender: TObject);
begin
  if Trim(edt_title.Text)<>'' then
    begin
      s_Title := ' And (WJBT Like ''%'+Trim(edt_title.Text)+ '%'') ';
    end
    else
    begin
      s_Title := '';
    end;
  btn_Query.Click;
end;

procedure TfrmIncome.Excel1Click(Sender: TObject);
begin
  btn9.Click;
end;

procedure TfrmIncome.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   Unit_Function.deleTempFile;
   ACtion := caFree;
end;

procedure TfrmIncome.FormCreate(Sender: TObject);
var
  AComponent: TComponent;
begin
  Application.OnMessage := OnmouseWheel;
  //��ǹ���ԱȨ��
  sAdmin := 'N';
  AComponent := Application.MainForm.FindComponent('StatusBar1');
  ADuser:=Trim((Acomponent as TStatusBar).Panels[1].Text);
  {
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
  }
end;

procedure TfrmIncome.FormResize(Sender: TObject);
begin
  if chkDetail.Checked then exit;
  dbDetail.Height := 0;
  dbgrd1.Height := pnl1.Height - 3;
end;

procedure TfrmIncome.FormShow(Sender: TObject);
begin
  cbb_year.Text := FormatDateTime('YYYY',Now);
  sTable := 'Zhuijia_sheng_tan';
  s_Year     := '';
  s_Wenhao   := '';
  s_Title    := '';
  s_KMDM     := '';
  s_Xiada     := '';
  s_YearSBJ     := '';
  s_WenhaoSBJ   := '';
  s_TitleSBJ    := '';
  s_KMDMSBJ     := '';
  s_XiadaSBJ     := '';
  dbDetail.Height := 0;
  dbgrd1.Height := pnl1.Height - 3;
  sTemppath := ExtractFilePath(Application.ExeName)+'tempfile\';
end;

procedure TfrmIncome.N1Click(Sender: TObject);
begin
  btn7.Click;
end;

procedure TfrmIncome.N3Click(Sender: TObject); //������
begin
  if pgc1.ActivePageIndex = 0 then
  begin
    AppendFile(qry_shangji,'9','1');
  end
  else
  begin
    AppendFile(qry_sbj,'7','1');
  end;
end;

procedure TfrmIncome.N4Click(Sender: TObject);    //������
begin
  if pgc1.ActivePageIndex = 0 then
  begin
    AppendFile(qry_shangji,'9','2');
  end
  else
  begin
    AppendFile(qry_sbj,'7','2');
  end;
end;

procedure TfrmIncome.N6Click(Sender: TObject);
begin
  if pgc1.ActivePageIndex = 0 then DeleteAttach(qry_shangji,'9','')  else DeleteAttach(qry_sbj,'7','');  
end;

procedure TfrmIncome.N7Click(Sender: TObject);
begin
  if pgc1.ActivePageIndex = 0 then DeleteAttach(qry_shangji,'9','1')  else DeleteAttach(qry_sbj,'7','1');
end;

procedure TfrmIncome.uploadfile(Sid, Fname, sOrder: string);   //�ϴ��ļ��Ĵ������   ��¼Ψһ��ţ��ļ����ƣ��Ƿ����ģ�0��
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

procedure TfrmIncome.OnMouseWheel(var Msg: TMsg; var Handled: Boolean);
begin
  try
    if (msg.message =WM_MOUSEWHEEL) and ((Screen.ActiveForm.ActiveControl.ClassName='TDBGrid') or
           (Screen.ActiveForm.ActiveControl.ClassName='TDBGridInplaceEdit')) then
    begin
      if Msg.wParam >0  then
        SendMessage(Screen.ActiveForm.ActiveControl.Handle,WM_VSCROLL,SB_PAGEUP,0) //SB_PageUP����һҳ��SB_LINEUP ��
      else
        SendMessage(Screen.ActiveForm.ActiveControl.Handle,WM_VSCROLL,SB_PAGEDOWN,0);
      Handled := True;
    end;
  except
  end;
end;

procedure TfrmIncome.Openfile(tDbgrid: TDBGrid; tQuery: TADOQuery);  //���ĵ�
var
  S : TMemoryStream;
  AQry : TADOQuery;
  sFileName,sOrder,sPrefixFlag : String;
begin
  if tQuery.Active = False then Exit ;
  if Not( (Trim(tDbgrid.SelectedField.FieldName)='����') OR (Trim(tDbgrid.SelectedField.FieldName)='����') )then exit   ;
  if (Trim(tDbgrid.SelectedField.FieldName)='����') And (trim(tQuery.FieldByName('����').AsString) = '��') then exit;
  if (Trim(tDbgrid.SelectedField.FieldName)='����') And (trim(tQuery.FieldByName('����').AsString) = '��') then exit;

  if Trim(tDbgrid.SelectedField.FieldName)='����' then  sOrder :='' else sOrder := '1';
  if pgc1.ActivePageIndex = 0 then  sPrefixFlag := '9' else sPrefixFlag := '7';
  if Application.MessageBox('ȷ���򿪸��ļ���','���Ĺ���',MB_OKCancel) = idOK then
  begin
    Try
      Screen.Cursor := crHourGlass;
      AQry := TADOQuery.Create(nil);
      AQRY.Connection := tQuery.Connection;
      With AQry do
      begin
        Close;
        SQL.Clear;
        SQL.Add('Select filename'+sOrder+',fileblob'+sOrder+' from Zhuijia_FileTable Where fieldid=' +sPrefixFlag+ Trim(tQuery.Fields[0].AsString));
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
      Showmessage('���ļ�ʧ��');
    End;
  end;
end;

procedure TfrmIncome.pgc1Change(Sender: TObject);
begin
  if pgc1.ActivePage.Name = 'tsShangji' then sTable := 'Zhuijia_sheng_tan';
  if pgc1.ActivePage.Name = 'tsBenji' then sTable := 'Zhuijia_shi_tan';
end;

initialization
  CoInitialize(Nil);
  RegisterClass(TfrmIncome);
finalization
  UnRegisterClass(TfrmIncome);
  CoUninitialize;
  FreeAndNil(frmIncome);
end.

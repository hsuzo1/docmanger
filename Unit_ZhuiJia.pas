unit Unit_ZhuiJia;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs,ActiveX, ComCtrls, StdCtrls, ExtCtrls, Mask, DB, ADODB,
  DBGridEhGrouping,ToolCtrlsEh, DBGridEhToolCtrls, DynVarsEh, EhLibVCL,
  GridsEh, DBGridEh, Buttons, Menus, DBAxisGridsEh;

type
  Tfrm_ZhuijiaApp = class(TForm)
    lbl_Year: TLabel;
    lbl_zjlx: TLabel;
    lbl_title: TLabel;
    lbl_wenhao: TLabel;
    lbl_KMDM: TLabel;
    lbl_MJ: TLabel;
    lbl_filedate: TLabel;
    lbl_ZGkeshi: TLabel;
    lbl_money: TLabel;
    cbb_Year: TComboBox;
    cbb_ZJLX: TComboBox;
    chk_WZZ: TCheckBox;
    cbb_MJ: TComboBox;
    edt_title: TEdit;
    cbb_Depart: TComboBox;
    cbb_fileyear: TComboBox;
    edt_filenumber: TEdit;
    lbl_Num: TLabel;
    dtp_filedate: TDateTimePicker;
    cbb_charger: TComboBox;
    edt_KMDM: TEdit;
    edt_money: TEdit;
    pnl1: TPanel;
    lbl_SBJ: TLabel;
    lbl1: TLabel;
    Label1: TLabel;
    lbl2: TLabel;
    lbl3: TLabel;
    lbl4: TLabel;
    lbl5: TLabel;
    lbl6: TLabel;
    lbl7: TLabel;
    lbl8: TLabel;
    lbl9: TLabel;
    lbl10: TLabel;
    lbl11: TLabel;
    lbl12: TLabel;
    lbl13: TLabel;
    lbl14: TLabel;
    lbl_QXS: TLabel;
    edt_sbj: TEdit;
    edt_XN: TEdit;
    edt_QX: TEdit;
    edt_XXT: TEdit;
    edt_JN: TEdit;
    edt_YN: TEdit;
    edt_LQ: TEdit;
    edt_WM: TEdit;
    edt_GX: TEdit;
    edt_JK: TEdit;
    edt_DM: TEdit;
    edt_QXS: TEdit;
    edt_HX: TEdit;
    edt_BY: TEdit;
    edt_SL: TEdit;
    edt_MS: TEdit;
    edt_LA: TEdit;
    lbl_KMDM2: TLabel;
    edt_KMDM2: TEdit;
    edt_KMMC: TEdit;
    edt_KMMC2: TEdit;
    btn_Close: TButton;
    btn_OK: TButton;
    qry1: TADOQuery;
    lbl_memo: TLabel;
    mmo1: TMemo;
    lbl15: TLabel;
    lbl16: TLabel;
    lbl17: TLabel;
    edt_KMDM1: TEdit;
    edt_KMMC1: TEdit;
    pnl3: TPanel;
    dsDetail: TDataSource;
    dbgrdh1: TDBGridEh;
    qry_Detail: TADOQuery;
    chk_prior: TCheckBox;
    lbl18: TLabel;
    cbb_Type: TComboBox;
    spl1: TSplitter;
    dbgrdh2: TDBGridEh;
    edt_sjwh: TEdit;
    rb1: TRadioButton;
    rb2: TRadioButton;
    btn_Qry: TSpeedButton;
    dsMain: TDataSource;
    qry_Main: TADOQuery;
    lbl19: TLabel;
    cbb_item: TComboBox;
    btn_AddItem: TSpeedButton;
    lbl20: TLabel;
    lbl21: TLabel;
    edt_uploadfile1: TEdit;
    edt_uploadfile2: TEdit;
    btn_open1: TSpeedButton;
    btn_open2: TSpeedButton;
    dlgOpen1: TOpenDialog;
    lbl22: TLabel;
    cbb_YSLY: TComboBox;
    lbl_info: TLabel;
    pmDetail: TPopupMenu;
    N1: TMenuItem;
    lblTips: TLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure edt_moneyExit(Sender: TObject);
    procedure btn_CloseClick(Sender: TObject);
    procedure edt_sbjKeyPress(Sender: TObject; var Key: Char);
    procedure edt_moneyEnter(Sender: TObject);
    procedure edt_KMDMChange(Sender: TObject);
    procedure btn_OKClick(Sender: TObject);
    procedure edt_sbjExit(Sender: TObject);
    procedure cbb_TypeChange(Sender: TObject);
    procedure edt_sjwhEnter(Sender: TObject);
    procedure btn_QryClick(Sender: TObject);
    procedure edt_sjwhKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cbb_itemDropDown(Sender: TObject);
    procedure edt_KMDM2Change(Sender: TObject);
    procedure edt_KMDM1Change(Sender: TObject);
    procedure cbb_TypeCloseUp(Sender: TObject);
    procedure cbb_chargerDropDown(Sender: TObject);
    procedure btn_open1Click(Sender: TObject);
    procedure btn_open2Click(Sender: TObject);
    procedure cbb_YSLYExit(Sender: TObject);
    procedure cbb_DepartDropDown(Sender: TObject);
    procedure cbb_DepartExit(Sender: TObject);
    procedure dbgrdh1CellClick(Column: TColumnEh);
    procedure dbgrdh1TitleBtnClick(Sender: TObject; ACol: Integer;
      Column: TColumnEh);
    procedure N1Click(Sender: TObject);
    procedure qry_MainAfterScroll(DataSet: TDataSet);
    procedure edt_filenumberExit(Sender: TObject);
  private
    { Private declarations }
    var
      iTotal,iSum : Currency;
      sMainSqlStr,sItemNum,sTable :string;
    procedure CheckInput; //��������Ҫ���Ƿ�׼ȷ
    procedure uploadfile(Sid,Fname,sOrder:string);        //�ϴ��ļ�
    function generateID:string;
    function GetInputedKMMC(Var sEdtText : string):string;//��ʾ��Ŀ����
    procedure GetDetail;
  public
    { Public declarations }
  end;

var
  frm_ZhuijiaApp: Tfrm_ZhuijiaApp;

implementation

uses DataMoudle,UnitFileThread_zhuijia;

{$R *.dfm}

function Tfrm_ZhuijiaApp.generateID:string; //���ɼ�¼���
var
  i : string;
begin
  with qry1 do
  begin
    close;
    sql.Clear;
    SQL.Add('Select Max(sID) as CtID from '+sTable+' where sID like '''+FormatDateTime('YYYYMMDD',Now)+'%'' ');
    Open;
    if Trim(FieldByName('CtID').AsString) = ''  then i := FormatDateTime('YYYYMMDD',Now)+'0001'
    else i :=IntToStr(StrToInt64(trim(FieldByName('CtID').AsString)) +1) ;
    Close;
  end;
  Result := i;
end;

procedure Tfrm_ZhuijiaApp.GetDetail;
begin
  if cbb_Type.ItemIndex <> 1 then exit;
  if Trim(qry_Main.FieldByName('�б���').AsString)<>'' then
  begin
    edt_title.Text   :=Trim(qry_Main.FieldByName('�ļ�����').AsString);
    edt_KMDM.Text    :=Trim(qry_Main.FieldByName('�����Ŀ').AsString);
    edt_KMDM1.Text    :=Trim(qry_Main.FieldByName('���ܿ�Ŀ').AsString);
    edt_KMDM2.Text    :=Trim(qry_Main.FieldByName('���ÿ�Ŀ').AsString);
    cbb_charger.Text :=Trim(qry_Main.FieldByName('���ܿ���').AsString);
    edt_money.Text :=Trim(qry_Main.FieldByName('�б���').AsString);
    mmo1.Lines.Text :=Trim(qry_Main.FieldByName('��ע').AsString);
  end;
  with qry_Detail do          //����ϸ�������ʾ����Ҫ�ֽ��´���ļ��Ѿ��ֽ�����
  begin
    Close;
    sql.Clear;
    sql.Add('select sID as ���,AddDate as �Ǽ�����,WJBT as �ļ�����,Wenhao as �ĺ�,'
            +'KMDM as �����Ŀ,KMDM1 as ���ܿ�Ŀ,KMDM2 as ���ÿ�Ŀ,FileDate as ��������,'
            +'ZGkeshi as ���ܿ���,YSZJ as �ܽ��,SBJ as �б���,CQ_XN as ������,'
            +'CQ_qx as ������,CQ_xxt as ��������,CQ_jn as ������ ,CQ_yn as ������,'
            +'CQ_lq as ������,CQ_wm as ������,K_gx as ������,K_jk as ������,K_dm as ������,'
            +'K_qxs as ����ɽ,X_hx as ����,X_by as ������,X_sl as ������,X_ms as ��ɽ��,'
            +'X_la as ¡����,file1 as ����,file2 as ����,Memo as ��ע from '+sTable
            +' where BudgetYear='+Trim(cbb_Year.Text) + ' And DetailID='+QuotedStr(Trim(qry_Main.FieldByName('sID').AsString))
            + ' order by sID Desc ');
    open;
    //��֤�ֽ��´�ʱ�Ƿ��ܶ�
    if ((strtocurr(dbgrdh2.GetFooterValue(0,dbgrdh2.Columns[9])) >= strtocurr(edt_money.Text)) And (strtocurr(edt_money.Text) > 0))
      or (Trim(qry_Main.FieldByName('�б���').AsString)='0') then
    begin
      btn_OK.Enabled := false;
    end else btn_OK.Enabled := true;
  end;
end;

function Tfrm_ZhuijiaApp.GetInputedKMMC(Var sEdtText : string): string; //��ʾ��Ŀ����   ͨ������ Edt.text ʵ��
var
  strSzlx : string;
begin
  strSzlx := '';
  case cbb_ZJLX.ItemIndex of
  0 : strSzlx := ' and szlx like ''_0'' ';
  1 : strSzlx := ' and szlx like ''_1'' ';
  end;
  if Length(sEdtText) < 3 then
  begin
    Result := '';
    exit;
  end;
  with Qry1 do
  begin
    Close;
    sql.Clear;
    sql.Add('select top 1 KMMC from zhuijia_kmdm where sYear='+QuotedStr(Trim(cbb_Year.Text))
             +' And KMDM =''' +Trim(sEdtText)+ ''' and inuse=''1'' '+strSzlx);
    Open;
    Result := qry1.FieldByName('KMMC').AsString;
    if trim(qry1.FieldByName('KMMC').AsString) ='' then Result := '�޴ˡ�'+cbb_zjlx.Text+'����Ŀ������';
    Close;
  end;
end;

procedure Tfrm_ZhuijiaApp.N1Click(Sender: TObject);
begin
  if Trim(qry_Detail.Fields[0].AsString) = '' then exit;  
  if MessageBox(Handle,'ȷ��ɾ���˼�¼��','��ʾ',MB_ICONQUESTION+MB_OKCancel) <> ID_OK then exit;
  try
    qry_Detail.Delete;
  finally
    MessageBox(Handle,'ɾ���ɹ�','��ʾ',MB_ICONINFORMATION+MB_OK);
    qry_Detail.Requery();
  end;
end;

procedure Tfrm_ZhuijiaApp.qry_MainAfterScroll(DataSet: TDataSet);
begin
  GetDetail;
end;

procedure Tfrm_ZhuijiaApp.uploadfile(Sid, Fname, sOrder: string);   //�ϴ��ļ��Ĵ������
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

procedure Tfrm_ZhuijiaApp.btn_OKClick(Sender: TObject);          //ȷ����Ӽ�¼
var
  i : Integer;
  sWZZ,sPrior,sID, sAttach, sAttach1, sWenhao, sShowDetail :string;
begin
  CheckInput;
  if chk_WZZ.Checked then sWZZ := 'Y' else sWZZ := 'N';       //������
  if chk_prior.Checked then sPrior := 'Y' else sPrior := 'N'; //��ǰ�´�
  sAttach := '��';
  sAttach1 :='��';
  if edt_uploadfile1.Text <> '' then sAttach := '������';
  if edt_uploadfile2.Text <> '' then sAttach1 := '�и���';
  sWenhao := Trim(cbb_Depart.Text)+'['+Trim(cbb_fileyear.Text)+']'+Trim(edt_filenumber.Text)+'��';
  DataModule2.ADOConnection1.BeginTrans;
  try
  if cbb_Type.ItemIndex <> 1 then   //׷�ӵǼ��ϼ��ļ����´ﱾ�������ļ�
  begin
  with qry1 do
  begin
    sID := generateID;
    close;
    sql.Clear;
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
    sql.Add('Insert into '+sTable+' (sID,AddDate,BudgetYear,YSLY,ZJLX,isWZZ,isPrior,MIJI,'
            +'ItemNumber,WJBT,Wenhao,KMDM,KMDM1,KMDM2,FileDate,ZGkeshi,YSZJ,SBJ,CQ_XN,CQ_qx,CQ_xxt,CQ_jn,CQ_yn,'
            +'CQ_lq,CQ_wm,K_gx,K_jk,K_dm,K_qxs,X_hx,X_by,X_sl,X_ms,X_la,file1,file2,Memo) values ('''
            +sID+''','''      //��¼�����
            +FormatDateTime('YYYY-MM-DD hh:mm:ss',Now)+''','''    //�Ǽ�����
            +cbb_Year.Text+''','''     //�������
            +cbb_YSLY.Text+''','''     //Ԥ����Դ
            +cbb_ZJLX.Text+''','''     //�ʽ�����
            +sWZZ+''','''              //�Ƿ��������ʽ�
            +sPrior+''','''            //�Ƿ���ǰ�´�
            +Trim(cbb_MJ.Text)+''','''       //�ܼ�
            +Trim(cbb_item.Text)+''','''      //��Ŀ����
            +Trim(edt_title.Text)+''','''    //�ļ�����
            +sWenhao+''','''  //�ĺ�
            +Trim(edt_KMDM.Text)+''','''     //�����Ŀ����
            +Trim(edt_KMDM1.Text)+''','''     //֧�����ܿ�Ŀ����
            +Trim(edt_KMDM2.Text)+''','''    //֧�����ÿ�Ŀ����
            +DateToStr(dtp_filedate.Date)+''','''  //��������
            +Trim(cbb_charger.Text)+''','  //���ܿ���
            +edt_money.Text+','    //Ԥ���ʽ�
            +edt_sbj.Text+','     //�б���
            +edt_xn.Text+','
            +edt_qx.Text+','
            +edt_xxt.Text+','
            +edt_jn.Text+','
            +edt_yn.Text+','
            +edt_lq.Text+','
            +edt_wm.Text+','
            +edt_gx.Text+','
            +edt_jk.Text+','
            +edt_dm.Text+','
            +edt_qxs.Text+','
            +edt_hx.Text+','
            +edt_by.Text+','
            +edt_sl.Text+','
            +edt_ms.Text+','
            +edt_la.Text+','''
            +sAttach+''','''
            +sAttach1+''','''
            +mmo1.Lines.Text+ ''' '    //��ע
            +')');
     ExecSQL;
     close;
  end;
  end;
  if cbb_Type.ItemIndex =1  then    //�ֽ��´��ϼ��ʽ�
  begin
    if Trim(qry_Main.FieldByName('sID').AsString) = '' then
    begin
      ShowMessage('��ѡ��Ҫ�ֽ��´��ָ��');
      exit;
    end;
    sShowDetail := ' and DetailID ='+QuotedStr(Trim(qry_Main.FieldByName('sID').AsString));
  with qry1 do
  begin
    close;
    sql.clear;
    sID := generateID;
    if Trim(edt_uploadfile1.Text)<>'' then
     begin
       uploadfile('7'+Trim(sID),edt_uploadfile1.Text,'');  //'7'��ʾ�������ļ�
       sAttach := '������';
     end;
    //�ϴ���������
    if Trim(edt_uploadfile2.Text)<>'' then
     begin
       uploadfile('7'+Trim(sID),edt_uploadfile1.text,'1');
       sAttach1 := '�и���';
     end;
    sql.Add('Insert into Zhuijia_shi_tan (sID,AddDate,BudgetYear,YSLY,ZJLX,isWZZ,isPrior,WJBT,Wenhao,DetailID,DetailWenhao,'
            +'ItemNumber,KMDM,KMDM1,KMDM2,MIJI,FileDate,ZGkeshi,YSZJ,SBJ,CQ_XN,CQ_qx,CQ_xxt,CQ_jn,CQ_yn,'
            +'CQ_lq,CQ_wm,K_gx,K_jk,K_dm,K_qxs,X_hx,X_by,X_sl,X_ms,X_la,file1,file2,Memo) values ('''
            +sID+''','''      //��¼�����
            +FormatDateTime('YYYY-MM-DD hh:mm:ss',Now)+''','''    //�Ǽ�����
            +cbb_Year.Text+''','''     //�������
            +cbb_YSLY.Text+''','''     //Ԥ����Դ
            +cbb_ZJLX.Text+''','''     //�ʽ�����
            +sWZZ+''','''              //�Ƿ��������ʽ�
            +sPrior+''','''            //�Ƿ���ǰ�´�
            +Trim(edt_title.Text)+''','''    //�ļ�����
            +sWenhao+''','''  //�ĺ�
            +Trim(qry_Main.FieldByName('sID').AsString)+''','''  //��Ӧ�ϼ���¼ID
            +Trim(qry_Main.FieldByName('�ĺ�').AsString)+''','''  //��Ӧ�ϼ���¼�ĺ�
            +Trim(cbb_item.Text)+''','''      //��Ŀ����
            +Trim(edt_KMDM.Text)+''','''     //�����Ŀ����
            +Trim(edt_KMDM1.Text)+''','''     //֧�����ܿ�Ŀ����
            +Trim(edt_KMDM2.Text)+''','''    //֧�����ÿ�Ŀ����
            +Trim(cbb_MJ.Text)+''','''       //�ܼ�
            +DateToStr(dtp_filedate.Date)+''','''  //��������
            +Trim(cbb_charger.Text)+''','  //���ܿ���
            +edt_money.Text+','    //Ԥ���ʽ�
            +edt_sbj.Text+','     //�б���
            +edt_xn.Text+','
            +edt_qx.Text+','
            +edt_xxt.Text+','
            +edt_jn.Text+','
            +edt_yn.Text+','
            +edt_lq.Text+','
            +edt_wm.Text+','
            +edt_gx.Text+','
            +edt_jk.Text+','
            +edt_dm.Text+','
            +edt_qxs.Text+','
            +edt_hx.Text+','
            +edt_by.Text+','
            +edt_sl.Text+','
            +edt_ms.Text+','
            +edt_la.Text+','''
            +sAttach+''','''
            +sAttach1+''','''
            +mmo1.Lines.Text+ ''' '    //��ע
            +') ');
     Sql.Add('Update Zhuijia_sheng_tan set DetailID=ISNULL(DetailID,'''')+'+QuotedStr(Trim(sID)+ ',')+
            ',DetailWenhao=IsNull(DetailWenhao,'''')+' +QuotedStr(sWenhao+',')
            +' Where sID='+QuotedStr(Trim(qry_Main.FieldByName('sID').AsString)));
     ExecSQL;
     close;
  end;
  end;
  DataModule2.ADOConnection1.CommitTrans;
  except  on E:Exception do
    begin
     ShowMessage('¼��������飺'+e.Message);
     DataModule2.ADOConnection1.rollbacktrans;
     sAttach := '��';
     ShowMessage('�ļ�¼�����');
     Exit;
    end;
  end;
  with qry_Detail do
  begin
       close;
       sql.Clear;
       sql.Add('select Top 10 sID as ���,AddDate as �Ǽ�����,WJBT as �ļ�����,Wenhao as �ĺ�,'
            +'KMDM as �����Ŀ,KMDM1 as ���ܿ�Ŀ,KMDM2 as ���ÿ�Ŀ,FileDate as ��������,'
            +'ZGkeshi as ���ܿ���,YSZJ as �ܽ��,SBJ as �б���,CQ_XN as ������,'
            +'CQ_qx as ������,CQ_xxt as ��������,CQ_jn as ������ ,CQ_yn as ������,'
            +'CQ_lq as ������,CQ_wm as ������,K_gx as ������,K_jk as ������,K_dm as ������,'
            +'K_qxs as ����ɽ,X_hx as ����,X_by as ������,X_sl as ������,X_ms as ��ɽ��,'
            +'X_la as ¡����,file1 as ����,file2 as ����,Memo as ��ע from '+sTable
            +' where BudgetYear='+Trim(cbb_Year.Text) + sShowDetail + ' order by sID Desc ');
       open;
  end;
  edt_money.Text := '0';
  edt_uploadfile1.Text :='';
  edt_uploadfile2.Text :='';
  lbl_info.Caption := '';
  //���������ֵ,����Ϊ0.
  for I := 0 to pnl1.ControlCount - 1 do
    if pnl1.Controls[i] is TEdit then
      (pnl1.Controls[i] as TEdit).Text := '0';
  iTotal := 0;
  iSum   := 0;
  ShowMessage('�ļ�¼��ɹ���');
end;

procedure Tfrm_ZhuijiaApp.btn_open1Click(Sender: TObject);
begin
  if dlgOpen1.Execute then
  begin
    edt_uploadfile1.Text := dlgOpen1.FileName;
  end;
end;

procedure Tfrm_ZhuijiaApp.btn_open2Click(Sender: TObject);
begin
  if dlgOpen1.Execute then
  begin
    edt_uploadfile2.Text := dlgOpen1.FileName;
  end;
end;

procedure Tfrm_ZhuijiaApp.btn_QryClick(Sender: TObject);
begin
  if edt_sjwh.Text = 'ɸѡ�ؼ���' then exit;
  if rb1.Checked then
  begin
    sMainSqlStr := ' And (Wenhao Like ''%' + Trim(edt_sjwh.Text) + '%'') ' ;
  end
  else
  begin
    sMainSqlStr := ' And (WJBT Like ''%' + Trim(edt_sjwh.Text) + '%'') ' ;
  end;
  if Trim(edt_sjwh.Text) = '' then sMainSqlStr := ' ';
  with qry_Main do
  begin
    Close;
    sql.Clear;
    sql.Add('select sID, AddDate as �Ǽ�����,YSLY as Ԥ����Դ, itemnumber as ��Ŀ����,WJBT as �ļ�����, Wenhao as �ĺ�,Miji,'
            +'KMDM as �����Ŀ,KMDM1 as ���ܿ�Ŀ,KMDM2 as ���ÿ�Ŀ,FileDate as ��������,'
            +'ZGkeshi as ���ܿ���,YSZJ as �ܽ��,SBJ as �б���,CQ_XN as ������,'
            +'CQ_qx as ������,CQ_xxt as ��������,CQ_jn as ������ ,CQ_yn as ������,'
            +'CQ_lq as ������,CQ_wm as ������,K_gx as ������,K_jk as ������,K_dm as ������,'
            +'K_qxs as ����ɽ,X_hx as ����,X_by as ������,X_sl as ������,X_ms as ��ɽ��,'
            +'X_la as ¡����,Memo as ��ע from Zhuijia_sheng_tan Where BudgetYear ='+ QuotedStr(Trim(cbb_Year.Text))
            + sMainSqlStr);
    Open;
  end;
end;

procedure Tfrm_ZhuijiaApp.cbb_chargerDropDown(Sender: TObject);  //���ܲ����б�
begin
  if cbb_charger.Items.Count <> 0 then exit;
  cbb_charger.Items.Clear;
  with qry1 do
  begin
    close;
    sql.clear;
    sql.Add('select sOrder,DptName from Zhuijia_Dpt ');
    open;
    while not eof do
    begin
      cbb_charger.Items.Add(Trim(FieldByName('DptName').AsString));
      Next;
    end;
    close;
  end;

end;

procedure Tfrm_ZhuijiaApp.cbb_DepartDropDown(Sender: TObject);
var
 sFilter : string;
begin
  //ˢ�·����ֺ����
  cbb_Depart.Items.Clear;
  if cbb_Type.ItemIndex = 0 then sFilter := ' Where whjc like ''��%'' '
  else sFilter := ' Where whjc like ''��%'' '  ;
  with qry1 do
  begin
    Close;
    sql.Clear;
    sql.Add('select distinct whjc from wenhao '+sFilter+' order by whjc Asc');
    open;
  end;
  qry1.First;
  while not qry1.Eof  do
  begin
    cbb_Depart.Items.Add(Trim(qry1.FieldByName('whjc').AsString));
    qry1.Next;
  end;
  qry1.Close;
end;

procedure Tfrm_ZhuijiaApp.cbb_DepartExit(Sender: TObject); //����µķ����ֺ�
begin
  with qry1 do
  begin
    Close;
    sql.Clear;
    sql.Add('select distinct whjc from wenhao Where whjc='+QuotedStr(Trim(cbb_Depart.Text)));
    open;
    if Trim(FieldByName('whjc').AsString) ='' then
    begin
      Close;
      sql.Clear;
      sql.Add('insert into wenhao  (whjc) values ('+QuotedStr(Trim(cbb_Depart.Text))+')');
      ExecSQL;
    end;
    Close;
  end;
end;

procedure Tfrm_ZhuijiaApp.cbb_itemDropDown(Sender: TObject);   //ˢ����Ŀ�����б�
begin
  cbb_item.Items.Clear;
  with qry1 do
  begin
    close;
    sql.clear;
    sql.Add('select sItemNumber,sItemName from Zhuijia_Items Where sYear='+QuotedStr(Trim(cbb_Year.Text))
            +' Order By sItemName ');
    open;
    while not eof do
    begin
      cbb_item.Items.Add(Trim(FieldByName('sItemName').AsString));
      Next;
    end;
    close;
  end;
end;

procedure Tfrm_ZhuijiaApp.cbb_TypeChange(Sender: TObject);
begin
  if cbb_Type.ItemIndex = 1 then
  begin
    rb1.Enabled := True;
    rb2.Enabled := True;
    edt_sjwh.Enabled := True;
    edt_sjwh.Text := 'ɸѡ�ؼ���';
    edt_sjwh.Font.Color := clGrayText;
    btn_Qry.Enabled := True;
  end
  else
  begin
    rb1.Enabled := False;
    rb2.Enabled := False;
    edt_sjwh.Enabled := False;
    btn_Qry.Enabled := False;
    btn_OK.Enabled := true;
    qry_Detail.Active := false;
  end;
  cbb_Depart.ItemIndex := -1;
  edt_filenumber.Text :='';
  edt_title.Text :='';
  cbb_YSLY.ItemIndex := -1;
  if qry_Main.Active then qry_Main.Active := false;  
end;

procedure Tfrm_ZhuijiaApp.cbb_TypeCloseUp(Sender: TObject);
begin
  if cbb_Type.ItemIndex = 0 then
  begin
    sTable := 'zhuijia_sheng_tan';
  end
  else
  begin
    sTable := 'zhuijia_shi_tan'
  end;
end;

procedure Tfrm_ZhuijiaApp.cbb_YSLYExit(Sender: TObject);
begin
  if (cbb_Type.ItemIndex<2) and (cbb_YSLY.ItemIndex > 4) then
  begin
    ShowMessage('���ϼ��ļ���ҵ����ͨ�����������´�');
    cbb_YSLY.SetFocus;
    exit;
  end;
  if (cbb_Type.ItemIndex=2) and (cbb_YSLY.ItemIndex < 5) then
  begin
    ShowMessage('���������´���ļ�Ҫѡ��ͨ������ת��֧�������ս����´�');
    cbb_YSLY.SetFocus;
    exit;
  end;
end;

procedure Tfrm_ZhuijiaApp.CheckInput; //��֤������Ч��
var
 swenhao : string;
begin
  if (iTotal = 0) and (iSum = 0)  then  Abort;
  if sTable = '' then
  begin
    ShowMessage('��ѡ��ҵ������');
    cbb_Type.SetFocus;
    Abort;
  end;
  if Length(Trim(edt_title.Text)) < 5 then
  begin
    ShowMessage('�ļ�����̫�̣����顣');
    Abort;
  end;
  if (Trim(cbb_Depart.Text) = '') OR (Trim(edt_filenumber.Text) = '') then
  begin
    ShowMessage('��¼���ļ���');
    edt_filenumber.SetFocus;
    Abort;
  end;
  if iTotal <> iSum then
  begin
    ShowMessage('�ܽ������ϸ���ϼƲ��ȣ����顣');
    Abort;
  end;
  if Trim(cbb_YSLY.Text) ='' then
  begin
    ShowMessage('��ѡ��Ԥ���ʽ���Դ');
    cbb_YSLY.SetFocus;
    Abort;
  end;
  if (Trim(edt_KMDM.Text)='') And (Trim(edt_KMDM1.Text)='') then
  begin
    ShowMessage('��¼�������Ŀ���ܿ�Ŀ');
    Abort;
  end;
  if Trim(cbb_charger.Text) = '' then
  begin
    ShowMessage('��ѡ�����ܿ���');
    cbb_charger.SetFocus;
    Abort;
  end;
  //��ѯ�Ƿ����ظ���¼
  with qry1 do
  begin
    sWenhao := Trim(cbb_Depart.Text)+'['+Trim(cbb_fileyear.Text)+']'+Trim(edt_filenumber.Text)+'��';
    close;
    sql.Text :='';
    sql.Add('select * from '+sTable+ ' where '
            +'BudgetYear='''+ cbb_Year.Text+''' and '     //�������
            +'YSLY='''+cbb_YSLY.Text+''' and '     //Ԥ����Դ
            +'ZJLX='''+cbb_ZJLX.Text+''' and '     //�ʽ�����
            +'WJBT='''+Trim(edt_title.Text)+''' and '    //�ļ�����
            +'Wenhao='''+sWenhao+''' and '  //�ĺ�
            +'KMDM='''+Trim(edt_KMDM.Text)+''' and '     //�����Ŀ����
            +'KMDM1='''+Trim(edt_KMDM1.Text)+''' and '     //֧�����ܿ�Ŀ����
            +'KMDM2='''+Trim(edt_KMDM2.Text)+''' and '     //֧�����ܿ�Ŀ����
            +'YSZJ='+edt_money.Text+' and '    //Ԥ���ʽ�
            +'SBJ='+edt_sbj.Text     //�б���
            +' ');
    Open;
  end;
  if qry1.RecordCount > 0 then
  begin
    ShowMessage('ϵͳ�Ѿ�������ͬ��¼�����顣');
    Abort;
  end;
end;

procedure Tfrm_ZhuijiaApp.dbgrdh1CellClick(Column: TColumnEh);
begin
  GetDetail;
end;

procedure Tfrm_ZhuijiaApp.dbgrdh1TitleBtnClick(Sender: TObject; ACol: Integer;
  Column: TColumnEh);
var
  sortstring:string; //������
begin
  //��������
  with Column do
  begin
    if FieldName = '' then
      Exit;
    case Title.SortMarker of
      smNoneEh:
      begin
        Title.SortMarker := smDownEh;
        sortstring := Column.FieldName + ' ASC';
      end;
      smDownEh: sortstring := Column.FieldName + ' ASC';
      smUpEh: sortstring := Column.FieldName + ' DESC';
    end;
  //��������
    try
      qry_Main.Sort := sortstring //datasetΪʵ�����ݼ�������
    except
    end;
  end;
end;

procedure Tfrm_ZhuijiaApp.btn_CloseClick(Sender: TObject);
begin
  close;
end;

procedure Tfrm_ZhuijiaApp.edt_filenumberExit(Sender: TObject);    //����Ƿ��Ѿ�¼���Լ�¼�����Ϣ
var
  sWhere : string;
begin
  if cbb_Type.ItemIndex=1 then exit;
  sWhere := ' And (Wenhao=' + QuotedStr(Trim(cbb_Depart.Text)+'['+Trim(cbb_fileyear.Text)+']'+Trim(edt_filenumber.Text) + '��') +') ' ;
  with qry_Main do
  begin
    Close;
    sql.Clear;
    sql.Add('select sID, AddDate as �Ǽ�����,YSLY as Ԥ����Դ, itemnumber as ��Ŀ����,WJBT as �ļ�����, Wenhao as �ĺ�,Miji,'
            +'KMDM as �����Ŀ,KMDM1 as ���ܿ�Ŀ,KMDM2 as ���ÿ�Ŀ,FileDate as ��������,'
            +'ZGkeshi as ���ܿ���,YSZJ as �ܽ��,SBJ as �б���,CQ_XN as ������,'
            +'CQ_qx as ������,CQ_xxt as ��������,CQ_jn as ������ ,CQ_yn as ������,'
            +'CQ_lq as ������,CQ_wm as ������,K_gx as ������,K_jk as ������,K_dm as ������,'
            +'K_qxs as ����ɽ,X_hx as ����,X_by as ������,X_sl as ������,X_ms as ��ɽ��,'
            +'X_la as ¡����,Memo as ��ע from Zhuijia_sheng_tan Where BudgetYear ='+ QuotedStr(Trim(cbb_Year.Text))
            + sWhere);
    Open;
  end;
end;

procedure Tfrm_ZhuijiaApp.edt_KMDM1Change(Sender: TObject);
var
 s : string;
begin
  s :=  Trim(edt_kmdm1.Text);
  edt_KMMC1.Text := GetInputedKMMC(s);
end;

procedure Tfrm_ZhuijiaApp.edt_KMDM2Change(Sender: TObject); //���ÿ�Ŀ
var
 s : string;
begin
  s :=  Trim(edt_kmdm2.Text);
  edt_KMMC2.Text := GetInputedKMMC(s);
end;

procedure Tfrm_ZhuijiaApp.edt_KMDMChange(Sender: TObject);
var
 s : string;
begin
  s :=  Trim(edt_kmdm.Text);
  edt_KMMC.Text := GetInputedKMMC(s);
end;

procedure Tfrm_ZhuijiaApp.edt_moneyEnter(Sender: TObject);
begin
//  edt_money.Text := StringReplace(edt_money.Text,',','',[rfReplaceAll]);
  (Sender as TEdit).Text := StringReplace((Sender as TEdit).Text,',','',[rfReplaceAll]);
end;

procedure Tfrm_ZhuijiaApp.edt_moneyExit(Sender: TObject);
begin
//  if Trim(edt_money.Text) <> '' then
//     edt_money.Text := FormatFloat('#,##0.00',StrToFloat(edt_money.Text));
   if Trim((Sender as TEdit).Text) = ''  then (Sender as TEdit).Text := '0';
end;

procedure Tfrm_ZhuijiaApp.edt_sbjExit(Sender: TObject);
var
  i : integer;
begin
  if Trim(edt_money.Text) = '' then exit;
  iSum := 0;   //��ϸ�ϼ�
  iTotal :=  StrToCurr(StringReplace(edt_money.Text,',','',[rfReplaceAll]));
  if cbb_Type.ItemIndex <> 1 then     //ҵ�������������Ǽ��ϼ��ļ��򱾼��������ŵ��ļ��Ǽ�
  begin
  for I := 0 to pnl1.ControlCount - 1 do
    if pnl1.Controls[i] is TEdit then
    begin
      if Trim((pnl1.Controls[i] as TEdit).Text) <> '' then
      begin
        iSum := StrToCurr((pnl1.Controls[i] as TEdit).Text) + iSum;        //���㵥Ԫ��ϼ�
      end
      else
      begin
        (pnl1.Controls[i] as TEdit).Text := '0';
      end;
    end;
    lbl_info.Caption := '�ɷ�'+CurrToStr(iTotal)+'����ϸ'+ CurrToStr(iSum)+'����'+CurrToStr(iTotal-isum)+'��';
  end
  else
  begin                     //�ֽ��´��ϼ��ļ�
    for I := 0 to pnl1.ControlCount - 1 do
    if pnl1.Controls[i] is TEdit then
    begin
      if Trim((pnl1.Controls[i] as TEdit).Name) <> 'edt_sbj' then
      begin
        if Trim((pnl1.Controls[i] as TEdit).Text) = '' then  (pnl1.Controls[i] as TEdit).Text := '0';
        iSum := StrToCurr((pnl1.Controls[i] as TEdit).Text) + iSum;
      end;
    end;
//    edt_sbj.Text :=  CurrToStr(iTotal - iSum ) ;
    lbl_info.Caption := '�ɷ�'+CurrToStr(iTotal)+'����ϸ'+ CurrToStr(iSum)+'����'+CurrToStr(iTotal-isum)+'��';
  end;
  if (iSum > iTotal) And (Trim((Sender as TEdit).Text)<>'') then
  begin
    lblTips.Caption := '����ϸ�ϼ����ʽ���������ȣ����飡';
  end else lblTips.Caption := '';
end;

procedure Tfrm_ZhuijiaApp.edt_sbjKeyPress(Sender: TObject; var Key: Char);
begin
  if Not CharInSet(key, ['0'..'9','.','-',#8,#32]) then   //�˸����esc��
       Key:= #0;
  if (Key = '.') and (Pos('.',(Sender as TEdit).Text)>0) then
       Key:= #0;
end;

procedure Tfrm_ZhuijiaApp.edt_sjwhEnter(Sender: TObject);
begin
  edt_sjwh.Font.Color := clWindowText;
  if edt_sjwh.Text ='ɸѡ�ؼ���' then edt_sjwh.Text := '';
end;

procedure Tfrm_ZhuijiaApp.edt_sjwhKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_RETURN then btn_Qry.Click;
end;

procedure Tfrm_ZhuijiaApp.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  ACtion := caFree;
  Self.Release;
end;

initialization
  CoInitialize(Nil);
  RegisterClass(Tfrm_ZhuijiaApp);
finalization
  UnRegisterClass(Tfrm_ZhuijiaApp);
  CoUninitialize;
  FreeAndNil(frm_ZhuijiaApp);
end.

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
    procedure CheckInput; //检查输入的要素是否准确
    procedure uploadfile(Sid,Fname,sOrder:string);        //上传文件
    function generateID:string;
    function GetInputedKMMC(Var sEdtText : string):string;//显示科目名称
    procedure GetDetail;
  public
    { Public declarations }
  end;

var
  frm_ZhuijiaApp: Tfrm_ZhuijiaApp;

implementation

uses DataMoudle,UnitFileThread_zhuijia;

{$R *.dfm}

function Tfrm_ZhuijiaApp.generateID:string; //生成记录编号
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
  if Trim(qry_Main.FieldByName('市本级').AsString)<>'' then
  begin
    edt_title.Text   :=Trim(qry_Main.FieldByName('文件标题').AsString);
    edt_KMDM.Text    :=Trim(qry_Main.FieldByName('收入科目').AsString);
    edt_KMDM1.Text    :=Trim(qry_Main.FieldByName('功能科目').AsString);
    edt_KMDM2.Text    :=Trim(qry_Main.FieldByName('经济科目').AsString);
    cbb_charger.Text :=Trim(qry_Main.FieldByName('主管科室').AsString);
    edt_money.Text :=Trim(qry_Main.FieldByName('市本级').AsString);
    mmo1.Lines.Text :=Trim(qry_Main.FieldByName('备注').AsString);
  end;
  with qry_Detail do          //在明细表格里显示即将要分解下达的文件已经分解的情况
  begin
    Close;
    sql.Clear;
    sql.Add('select sID as 序号,AddDate as 登记日期,WJBT as 文件标题,Wenhao as 文号,'
            +'KMDM as 收入科目,KMDM1 as 功能科目,KMDM2 as 经济科目,FileDate as 发文日期,'
            +'ZGkeshi as 主管科室,YSZJ as 总金额,SBJ as 市本级,CQ_XN as 兴宁区,'
            +'CQ_qx as 青秀区,CQ_xxt as 西乡塘区,CQ_jn as 江南区 ,CQ_yn as 邕宁区,'
            +'CQ_lq as 良庆区,CQ_wm as 武鸣区,K_gx as 高新区,K_jk as 经开区,K_dm as 东盟区,'
            +'K_qxs as 青秀山,X_hx as 横县,X_by as 宾阳县,X_sl as 上林县,X_ms as 马山县,'
            +'X_la as 隆安县,file1 as 正文,file2 as 附表,Memo as 备注 from '+sTable
            +' where BudgetYear='+Trim(cbb_Year.Text) + ' And DetailID='+QuotedStr(Trim(qry_Main.FieldByName('sID').AsString))
            + ' order by sID Desc ');
    open;
    //验证分解下达时是否超总额
    if ((strtocurr(dbgrdh2.GetFooterValue(0,dbgrdh2.Columns[9])) >= strtocurr(edt_money.Text)) And (strtocurr(edt_money.Text) > 0))
      or (Trim(qry_Main.FieldByName('市本级').AsString)='0') then
    begin
      btn_OK.Enabled := false;
    end else btn_OK.Enabled := true;
  end;
end;

function Tfrm_ZhuijiaApp.GetInputedKMMC(Var sEdtText : string): string; //显示科目名称   通过传递 Edt.text 实现
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
    if trim(qry1.FieldByName('KMMC').AsString) ='' then Result := '无此”'+cbb_zjlx.Text+'“科目！！！';
    Close;
  end;
end;

procedure Tfrm_ZhuijiaApp.N1Click(Sender: TObject);
begin
  if Trim(qry_Detail.Fields[0].AsString) = '' then exit;  
  if MessageBox(Handle,'确定删除此记录？','提示',MB_ICONQUESTION+MB_OKCancel) <> ID_OK then exit;
  try
    qry_Detail.Delete;
  finally
    MessageBox(Handle,'删除成功','提示',MB_ICONINFORMATION+MB_OK);
    qry_Detail.Requery();
  end;
end;

procedure Tfrm_ZhuijiaApp.qry_MainAfterScroll(DataSet: TDataSet);
begin
  GetDetail;
end;

procedure Tfrm_ZhuijiaApp.uploadfile(Sid, Fname, sOrder: string);   //上传文件的处理过程
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

procedure Tfrm_ZhuijiaApp.btn_OKClick(Sender: TObject);          //确定添加记录
var
  i : Integer;
  sWZZ,sPrior,sID, sAttach, sAttach1, sWenhao, sShowDetail :string;
begin
  CheckInput;
  if chk_WZZ.Checked then sWZZ := 'Y' else sWZZ := 'N';       //稳增长
  if chk_prior.Checked then sPrior := 'Y' else sPrior := 'N'; //提前下达
  sAttach := '无';
  sAttach1 :='无';
  if edt_uploadfile1.Text <> '' then sAttach := '有正文';
  if edt_uploadfile2.Text <> '' then sAttach1 := '有附表';
  sWenhao := Trim(cbb_Depart.Text)+'['+Trim(cbb_fileyear.Text)+']'+Trim(edt_filenumber.Text)+'号';
  DataModule2.ADOConnection1.BeginTrans;
  try
  if cbb_Type.ItemIndex <> 1 then   //追加登记上级文件或下达本级财力文件
  begin
  with qry1 do
  begin
    sID := generateID;
    close;
    sql.Clear;
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
    sql.Add('Insert into '+sTable+' (sID,AddDate,BudgetYear,YSLY,ZJLX,isWZZ,isPrior,MIJI,'
            +'ItemNumber,WJBT,Wenhao,KMDM,KMDM1,KMDM2,FileDate,ZGkeshi,YSZJ,SBJ,CQ_XN,CQ_qx,CQ_xxt,CQ_jn,CQ_yn,'
            +'CQ_lq,CQ_wm,K_gx,K_jk,K_dm,K_qxs,X_hx,X_by,X_sl,X_ms,X_la,file1,file2,Memo) values ('''
            +sID+''','''      //记录的序号
            +FormatDateTime('YYYY-MM-DD hh:mm:ss',Now)+''','''    //登记日期
            +cbb_Year.Text+''','''     //财政年度
            +cbb_YSLY.Text+''','''     //预算来源
            +cbb_ZJLX.Text+''','''     //资金类型
            +sWZZ+''','''              //是否稳增长资金
            +sPrior+''','''            //是否提前下达
            +Trim(cbb_MJ.Text)+''','''       //密级
            +Trim(cbb_item.Text)+''','''      //项目名称
            +Trim(edt_title.Text)+''','''    //文件标题
            +sWenhao+''','''  //文号
            +Trim(edt_KMDM.Text)+''','''     //收入科目代码
            +Trim(edt_KMDM1.Text)+''','''     //支出功能科目代码
            +Trim(edt_KMDM2.Text)+''','''    //支出经济科目代码
            +DateToStr(dtp_filedate.Date)+''','''  //发文日期
            +Trim(cbb_charger.Text)+''','  //主管科室
            +edt_money.Text+','    //预算资金
            +edt_sbj.Text+','     //市本级
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
            +mmo1.Lines.Text+ ''' '    //备注
            +')');
     ExecSQL;
     close;
  end;
  end;
  if cbb_Type.ItemIndex =1  then    //分解下达上级资金
  begin
    if Trim(qry_Main.FieldByName('sID').AsString) = '' then
    begin
      ShowMessage('请选择要分解下达的指标');
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
       uploadfile('7'+Trim(sID),edt_uploadfile1.Text,'');  //'7'表示本级表文件
       sAttach := '有正文';
     end;
    //上传其他附件
    if Trim(edt_uploadfile2.Text)<>'' then
     begin
       uploadfile('7'+Trim(sID),edt_uploadfile1.text,'1');
       sAttach1 := '有附件';
     end;
    sql.Add('Insert into Zhuijia_shi_tan (sID,AddDate,BudgetYear,YSLY,ZJLX,isWZZ,isPrior,WJBT,Wenhao,DetailID,DetailWenhao,'
            +'ItemNumber,KMDM,KMDM1,KMDM2,MIJI,FileDate,ZGkeshi,YSZJ,SBJ,CQ_XN,CQ_qx,CQ_xxt,CQ_jn,CQ_yn,'
            +'CQ_lq,CQ_wm,K_gx,K_jk,K_dm,K_qxs,X_hx,X_by,X_sl,X_ms,X_la,file1,file2,Memo) values ('''
            +sID+''','''      //记录的序号
            +FormatDateTime('YYYY-MM-DD hh:mm:ss',Now)+''','''    //登记日期
            +cbb_Year.Text+''','''     //财政年度
            +cbb_YSLY.Text+''','''     //预算来源
            +cbb_ZJLX.Text+''','''     //资金类型
            +sWZZ+''','''              //是否稳增长资金
            +sPrior+''','''            //是否提前下达
            +Trim(edt_title.Text)+''','''    //文件标题
            +sWenhao+''','''  //文号
            +Trim(qry_Main.FieldByName('sID').AsString)+''','''  //对应上级记录ID
            +Trim(qry_Main.FieldByName('文号').AsString)+''','''  //对应上级记录文号
            +Trim(cbb_item.Text)+''','''      //项目名称
            +Trim(edt_KMDM.Text)+''','''     //收入科目代码
            +Trim(edt_KMDM1.Text)+''','''     //支出功能科目代码
            +Trim(edt_KMDM2.Text)+''','''    //支出经济科目代码
            +Trim(cbb_MJ.Text)+''','''       //密级
            +DateToStr(dtp_filedate.Date)+''','''  //发文日期
            +Trim(cbb_charger.Text)+''','  //主管科室
            +edt_money.Text+','    //预算资金
            +edt_sbj.Text+','     //市本级
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
            +mmo1.Lines.Text+ ''' '    //备注
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
     ShowMessage('录入出错，请检查：'+e.Message);
     DataModule2.ADOConnection1.rollbacktrans;
     sAttach := '无';
     ShowMessage('文件录入出错！');
     Exit;
    end;
  end;
  with qry_Detail do
  begin
       close;
       sql.Clear;
       sql.Add('select Top 10 sID as 序号,AddDate as 登记日期,WJBT as 文件标题,Wenhao as 文号,'
            +'KMDM as 收入科目,KMDM1 as 功能科目,KMDM2 as 经济科目,FileDate as 发文日期,'
            +'ZGkeshi as 主管科室,YSZJ as 总金额,SBJ as 市本级,CQ_XN as 兴宁区,'
            +'CQ_qx as 青秀区,CQ_xxt as 西乡塘区,CQ_jn as 江南区 ,CQ_yn as 邕宁区,'
            +'CQ_lq as 良庆区,CQ_wm as 武鸣区,K_gx as 高新区,K_jk as 经开区,K_dm as 东盟区,'
            +'K_qxs as 青秀山,X_hx as 横县,X_by as 宾阳县,X_sl as 上林县,X_ms as 马山县,'
            +'X_la as 隆安县,file1 as 正文,file2 as 附表,Memo as 备注 from '+sTable
            +' where BudgetYear='+Trim(cbb_Year.Text) + sShowDetail + ' order by sID Desc ');
       open;
  end;
  edt_money.Text := '0';
  edt_uploadfile1.Text :='';
  edt_uploadfile2.Text :='';
  lbl_info.Caption := '';
  //批量清空数值,重置为0.
  for I := 0 to pnl1.ControlCount - 1 do
    if pnl1.Controls[i] is TEdit then
      (pnl1.Controls[i] as TEdit).Text := '0';
  iTotal := 0;
  iSum   := 0;
  ShowMessage('文件录入成功！');
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
  if edt_sjwh.Text = '筛选关键字' then exit;
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
    sql.Add('select sID, AddDate as 登记日期,YSLY as 预算来源, itemnumber as 项目名称,WJBT as 文件标题, Wenhao as 文号,Miji,'
            +'KMDM as 收入科目,KMDM1 as 功能科目,KMDM2 as 经济科目,FileDate as 发文日期,'
            +'ZGkeshi as 主管科室,YSZJ as 总金额,SBJ as 市本级,CQ_XN as 兴宁区,'
            +'CQ_qx as 青秀区,CQ_xxt as 西乡塘区,CQ_jn as 江南区 ,CQ_yn as 邕宁区,'
            +'CQ_lq as 良庆区,CQ_wm as 武鸣区,K_gx as 高新区,K_jk as 经开区,K_dm as 东盟区,'
            +'K_qxs as 青秀山,X_hx as 横县,X_by as 宾阳县,X_sl as 上林县,X_ms as 马山县,'
            +'X_la as 隆安县,Memo as 备注 from Zhuijia_sheng_tan Where BudgetYear ='+ QuotedStr(Trim(cbb_Year.Text))
            + sMainSqlStr);
    Open;
  end;
end;

procedure Tfrm_ZhuijiaApp.cbb_chargerDropDown(Sender: TObject);  //主管部门列表
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
  //刷新发文字号类别
  cbb_Depart.Items.Clear;
  if cbb_Type.ItemIndex = 0 then sFilter := ' Where whjc like ''桂%'' '
  else sFilter := ' Where whjc like ''南%'' '  ;
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

procedure Tfrm_ZhuijiaApp.cbb_DepartExit(Sender: TObject); //添加新的发文字号
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

procedure Tfrm_ZhuijiaApp.cbb_itemDropDown(Sender: TObject);   //刷新项目名称列表
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
    edt_sjwh.Text := '筛选关键字';
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
    ShowMessage('对上级文件的业务不能通过本级财力下达');
    cbb_YSLY.SetFocus;
    exit;
  end;
  if (cbb_Type.ItemIndex=2) and (cbb_YSLY.ItemIndex < 5) then
  begin
    ShowMessage('本级财力下达的文件要选择通过本级转移支付或年终结算下达');
    cbb_YSLY.SetFocus;
    exit;
  end;
end;

procedure Tfrm_ZhuijiaApp.CheckInput; //验证输入有效性
var
 swenhao : string;
begin
  if (iTotal = 0) and (iSum = 0)  then  Abort;
  if sTable = '' then
  begin
    ShowMessage('请选择业务类型');
    cbb_Type.SetFocus;
    Abort;
  end;
  if Length(Trim(edt_title.Text)) < 5 then
  begin
    ShowMessage('文件标题太短，请检查。');
    Abort;
  end;
  if (Trim(cbb_Depart.Text) = '') OR (Trim(edt_filenumber.Text) = '') then
  begin
    ShowMessage('请录入文件号');
    edt_filenumber.SetFocus;
    Abort;
  end;
  if iTotal <> iSum then
  begin
    ShowMessage('总金额与明细金额合计不等，请检查。');
    Abort;
  end;
  if Trim(cbb_YSLY.Text) ='' then
  begin
    ShowMessage('请选择预算资金来源');
    cbb_YSLY.SetFocus;
    Abort;
  end;
  if (Trim(edt_KMDM.Text)='') And (Trim(edt_KMDM1.Text)='') then
  begin
    ShowMessage('请录入收入科目或功能科目');
    Abort;
  end;
  if Trim(cbb_charger.Text) = '' then
  begin
    ShowMessage('请选择主管科室');
    cbb_charger.SetFocus;
    Abort;
  end;
  //查询是否有重复记录
  with qry1 do
  begin
    sWenhao := Trim(cbb_Depart.Text)+'['+Trim(cbb_fileyear.Text)+']'+Trim(edt_filenumber.Text)+'号';
    close;
    sql.Text :='';
    sql.Add('select * from '+sTable+ ' where '
            +'BudgetYear='''+ cbb_Year.Text+''' and '     //财政年度
            +'YSLY='''+cbb_YSLY.Text+''' and '     //预算来源
            +'ZJLX='''+cbb_ZJLX.Text+''' and '     //资金类型
            +'WJBT='''+Trim(edt_title.Text)+''' and '    //文件标题
            +'Wenhao='''+sWenhao+''' and '  //文号
            +'KMDM='''+Trim(edt_KMDM.Text)+''' and '     //收入科目代码
            +'KMDM1='''+Trim(edt_KMDM1.Text)+''' and '     //支出功能科目代码
            +'KMDM2='''+Trim(edt_KMDM2.Text)+''' and '     //支出功能科目代码
            +'YSZJ='+edt_money.Text+' and '    //预算资金
            +'SBJ='+edt_sbj.Text     //市本级
            +' ');
    Open;
  end;
  if qry1.RecordCount > 0 then
  begin
    ShowMessage('系统已经存在相同记录，请检查。');
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
  sortstring:string; //排序列
begin
  //进行排序
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
  //进行排序
    try
      qry_Main.Sort := sortstring //dataset为实际数据集变量名
    except
    end;
  end;
end;

procedure Tfrm_ZhuijiaApp.btn_CloseClick(Sender: TObject);
begin
  close;
end;

procedure Tfrm_ZhuijiaApp.edt_filenumberExit(Sender: TObject);    //检查是否已经录入以及录入的信息
var
  sWhere : string;
begin
  if cbb_Type.ItemIndex=1 then exit;
  sWhere := ' And (Wenhao=' + QuotedStr(Trim(cbb_Depart.Text)+'['+Trim(cbb_fileyear.Text)+']'+Trim(edt_filenumber.Text) + '号') +') ' ;
  with qry_Main do
  begin
    Close;
    sql.Clear;
    sql.Add('select sID, AddDate as 登记日期,YSLY as 预算来源, itemnumber as 项目名称,WJBT as 文件标题, Wenhao as 文号,Miji,'
            +'KMDM as 收入科目,KMDM1 as 功能科目,KMDM2 as 经济科目,FileDate as 发文日期,'
            +'ZGkeshi as 主管科室,YSZJ as 总金额,SBJ as 市本级,CQ_XN as 兴宁区,'
            +'CQ_qx as 青秀区,CQ_xxt as 西乡塘区,CQ_jn as 江南区 ,CQ_yn as 邕宁区,'
            +'CQ_lq as 良庆区,CQ_wm as 武鸣区,K_gx as 高新区,K_jk as 经开区,K_dm as 东盟区,'
            +'K_qxs as 青秀山,X_hx as 横县,X_by as 宾阳县,X_sl as 上林县,X_ms as 马山县,'
            +'X_la as 隆安县,Memo as 备注 from Zhuijia_sheng_tan Where BudgetYear ='+ QuotedStr(Trim(cbb_Year.Text))
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

procedure Tfrm_ZhuijiaApp.edt_KMDM2Change(Sender: TObject); //经济科目
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
  iSum := 0;   //明细合计
  iTotal :=  StrToCurr(StringReplace(edt_money.Text,',','',[rfReplaceAll]));
  if cbb_Type.ItemIndex <> 1 then     //业务类型是新增登记上级文件或本级财力安排的文件登记
  begin
  for I := 0 to pnl1.ControlCount - 1 do
    if pnl1.Controls[i] is TEdit then
    begin
      if Trim((pnl1.Controls[i] as TEdit).Text) <> '' then
      begin
        iSum := StrToCurr((pnl1.Controls[i] as TEdit).Text) + iSum;        //计算单元格合计
      end
      else
      begin
        (pnl1.Controls[i] as TEdit).Text := '0';
      end;
    end;
    lbl_info.Caption := '可分'+CurrToStr(iTotal)+'万，明细'+ CurrToStr(iSum)+'万，余'+CurrToStr(iTotal-isum)+'万';
  end
  else
  begin                     //分解下达上级文件
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
    lbl_info.Caption := '可分'+CurrToStr(iTotal)+'万，明细'+ CurrToStr(iSum)+'万，余'+CurrToStr(iTotal-isum)+'万';
  end;
  if (iSum > iTotal) And (Trim((Sender as TEdit).Text)<>'') then
  begin
    lblTips.Caption := '各明细合计与资金总数不相等，请检查！';
  end else lblTips.Caption := '';
end;

procedure Tfrm_ZhuijiaApp.edt_sbjKeyPress(Sender: TObject; var Key: Char);
begin
  if Not CharInSet(key, ['0'..'9','.','-',#8,#32]) then   //退格键，esc键
       Key:= #0;
  if (Key = '.') and (Pos('.',(Sender as TEdit).Text)>0) then
       Key:= #0;
end;

procedure Tfrm_ZhuijiaApp.edt_sjwhEnter(Sender: TObject);
begin
  edt_sjwh.Font.Color := clWindowText;
  if edt_sjwh.Text ='筛选关键字' then edt_sjwh.Text := '';
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

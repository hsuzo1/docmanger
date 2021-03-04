unit Unit_FileHost_Edit;

interface

uses
  Windows, Messages, SysUtils, Classes,  Controls, Forms,
  Dialogs,StdCtrls, ExtCtrls, Buttons, DB, ADODB, ComCtrls,ActiveX;
type

  TFrm_Edit = class(TForm)
    btn1: TButton;
    btn2: TButton;
    pnl1: TPanel;
    Label1: TLabel;
    edt1: TEdit;
    lbl1: TLabel;
    lbl9: TLabel;
    cbb_Secure: TComboBox;
    lbl3: TLabel;
    lbl6: TLabel;
    lbl4: TLabel;
    lbl8: TLabel;
    edt_Title: TEdit;
    cbb_Send: TComboBox;
    cbb_Creater: TComboBox;
    edt_Memo: TEdit;
    lbl7: TLabel;
    cbb_Type: TComboBox;
    lbl5: TLabel;
    dtp1: TDateTimePicker;
    edt_Name: TEdit;
    qry_Edit: TADOQuery;
    btn3: TButton;
    lbl_xxgk: TLabel;
    cbb_xxgk: TComboBox;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure cbb_SendDropDown(Sender: TObject);
    procedure cbb_CreaterDropDown(Sender: TObject);
    procedure cbb_SecureKeyPress(Sender: TObject; var Key: Char);
    procedure cbb_SecureChange(Sender: TObject);
    procedure cbb_TypeKeyPress(Sender: TObject; var Key: Char);
    procedure btn1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btn3Click(Sender: TObject);
    procedure btn2Click(Sender: TObject);

  private
    { Private declarations }
    procedure GetOridata;//获取要编辑的数据
    var
     s1,s2 : string;//比较文号是否有变化
  public
    { Public declarations }
  end;

var
  Frm_Edit: TFrm_Edit;

implementation


{$R *.dfm}

procedure TFrm_Edit.btn1Click(Sender: TObject);       //提交数据
var
  ADOQ : TADOQuery;
begin
 if MessageBox(Handle,PChar('您确定保存？'),'公文管理',MB_YESNO+MB_ICONQUESTION)=7 then  exit;
 if (Trim(edt_Title.Text) ='') OR (Trim(edt_Name.Text)='') then
 begin
   ShowMessage('必须输入文件名称和发文字号');
   exit;
 end;
 S2 := edt_Name.Text;
 if S1 <> S2 then
 begin
   ADOQ := TADOQuery.Create(Self);
   ADOQ.Connection := qry_Edit.Connection;
   try
     ADOQ.Close;
     ADOQ.SQL.Clear;
     ADOQ.SQL.Add('select Count(filenumber) as iCount from maininfo where filenumber='+QuotedStr(Trim(s2)));
     ADOQ.Open;
     if ADOQ.FieldByName('iCount').AsInteger > 0 then
     begin
       ShowMessage('系统中已有该文号，请检查。');
       ADOQ.Close;
       exit;
     end;
   finally
     ADOQ.Free;
   end;
 end;
 with qry_Edit do
 begin
    Close;
    sql.Clear;
    sql.Add('Select Top 1 filenumber,miji,title,sendto,ftype,creater,crtime,memo1,xxgk From Maininfo Where fileID='+QuotedStr(edt1.Text));
    open;
 end;
 qry_Edit.Edit;
 qry_Edit.Fields[0].AsString:= edt_Name.Text;
 qry_Edit.Fields[1].AsString:= cbb_Secure.Text;
 qry_Edit.Fields[2].AsString:= edt_Title.Text ;
 qry_Edit.Fields[3].AsString:= cbb_Send.Text ;
 qry_Edit.Fields[4].AsString:= cbb_Type.Text ;
 qry_Edit.Fields[5].AsString:= cbb_Creater.Text ;
 qry_Edit.Fields[6].AsString:= DateToStr(dtp1.Date) ;
 qry_Edit.Fields[7].AsString:= edt_Memo.Text ;
 qry_Edit.Fields[8].AsString:= cbb_xxgk.Text;
 qry_Edit.Post;
 qry_Edit.Close;
 btn3.Click;
end;


procedure TFrm_Edit.btn2Click(Sender: TObject);
begin
  qry_Edit.Cancel;
  GetOridata;
end;

procedure TFrm_Edit.btn3Click(Sender: TObject);
begin
  Close;
end;

procedure TFrm_Edit.cbb_CreaterDropDown(Sender: TObject);
begin
//刷新拟稿人列表
  if cbb_Creater.Items.Count >1 then exit;
  cbb_Creater.Clear;
  with qry_Edit do
  begin
    Close;
    sql.Clear;
    sql.Add('select creater from usertable where inuse=''1'' Order by sorder ASC');
    open;
  end;
  qry_Edit.First;
  while not qry_Edit.Eof  do
  begin
    cbb_Creater.Items.Add(Trim(qry_Edit.FieldByName('creater').AsString));
    qry_Edit.Next;
  end;
  qry_Edit.Close;
end;

procedure TFrm_Edit.cbb_SecureChange(Sender: TObject);
begin
  if Length(cbb_Secure.Text)<2 then cbb_Secure.Text :='';
end;

procedure TFrm_Edit.cbb_SecureKeyPress(Sender: TObject; var Key: Char);
begin
  if Not (AnsiChar(Key) in [#8,#46]) then Key :=#0;
end;

procedure TFrm_Edit.cbb_SendDropDown(Sender: TObject);
begin
  if cbb_Send.Items.Count > 3 then exit;
  cbb_Send.Clear;
//刷新主送单位列表
  with qry_Edit do
  begin
    Close;
    sql.Clear;
    sql.Add('Select distinct sendto from sendto order by sendto');
    open;
  end;
  qry_Edit.First;
  while not qry_Edit.Eof  do
  begin
    cbb_Send.Items.Add(Trim(qry_Edit.FieldByName('sendto').AsString));
    qry_Edit.Next;
  end;
  qry_Edit.Close;
end;

procedure TFrm_Edit.cbb_TypeKeyPress(Sender: TObject; var Key: Char);
begin
  if Not (AnsiChar(Key) in [#8,#46]) then Key :=#0;
end;

procedure TFrm_Edit.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  ACtion := caFree;
  Self.Release;
end;

procedure TFrm_Edit.FormShow(Sender: TObject);
begin
  GetOridata;
  S1 := edt_Name.Text;
end;

procedure TFrm_Edit.GetOridata;  //获取原始记录信息
begin
  with qry_Edit do
  begin
    Close;
    sql.Clear;
    sql.Add('Select  Top 1 filenumber,miji,title,sendto,ftype,creater,crtime,memo1,xxgk From Maininfo Where fileID='+QuotedStr(edt1.Text));
    open;
  end;
  edt_Name.Text  := qry_Edit.Fields[0].AsString;
  cbb_Secure.Text := qry_Edit.Fields[1].AsString;
  edt_Title.Text := qry_Edit.Fields[2].AsString;
  cbb_Send.Text := qry_Edit.Fields[3].AsString;
  cbb_Type.Text := qry_Edit.Fields[4].AsString;
  cbb_Creater.Text := qry_Edit.Fields[5].AsString;
  dtp1.Date := qry_Edit.Fields[6].AsDateTime;
  edt_Memo.Text := qry_Edit.Fields[7].AsString;
  if trim(qry_Edit.Fields[8].AsString)='' then cbb_xxgk.ItemIndex := 0 else
     cbb_xxgk.Text := qry_Edit.Fields[8].AsString;
  qry_Edit.Edit;
end;

initialization
  CoInitialize(Nil);
  RegisterClass(TFrm_Edit);
finalization
  UnRegisterClass(TFrm_Edit);
  CoUninitialize;
  FreeAndNil(Frm_Edit);

end.

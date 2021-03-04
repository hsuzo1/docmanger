unit Unit_BKMX;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ActiveX, ComCtrls,AnsiStrings ;

type
  Tfrm_BKMX = class(TForm)
    btn_close: TButton;
    lbl_title: TLabel;
    lbl_year: TLabel;
    cbb_year: TComboBox;
    lbl_item: TLabel;
    lbl_skdw: TLabel;
    lbl_account: TLabel;
    lbl_bank: TLabel;
    lbl_yongtu: TLabel;
    lbl_memo: TLabel;
    lbl_money: TLabel;
    edt_yongtu: TEdit;
    edt_money: TEdit;
    lbl_date: TLabel;
    dtp1: TDateTimePicker;
    tv1: TTreeView;
    lbl_zjly: TLabel;
    cbb_item: TComboBox;
    lbl_availabe: TLabel;
    cbb_unit: TComboBox;
    cbb_account: TComboBox;
    cbb_bank: TComboBox;
    mmo1: TMemo;
    lbl_daxie: TLabel;
    lbl_DX: TLabel;
    lbl1: TLabel;
    Button1: TButton;
    Button2: TButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btn_closeClick(Sender: TObject);
    procedure edt_moneyKeyPress(Sender: TObject; var Key: Char);
    procedure edt_moneyExit(Sender: TObject);
    procedure edt_moneyChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure edt_moneyEnter(Sender: TObject);

  private
    { Private declarations }
    function UpMoney( const n: real): string;
  public
    { Public declarations }
  end;

var
  frm_BKMX: Tfrm_BKMX;

implementation

{$R *.dfm}
{ȡedt_money ����ֵʱע��ת������ʽ','}

procedure Tfrm_BKMX.btn_closeClick(Sender: TObject);
begin
  close;
end;

procedure Tfrm_BKMX.edt_moneyChange(Sender: TObject);
begin
  if (copy((Sender as TEdit).Text,1,1) = '.') And (Length((Sender as TEdit).Text) = 1) then
  begin
    (Sender as TEdit).Text := '0'+(Sender as TEdit).Text;
     (Sender as TEdit).SelStart :=2;
  end;
  lbl_DX.Caption:=UpMoney(StrToFloat(StringReplace(edt_money.Text,',','',[rfReplaceAll])));
end;

procedure Tfrm_BKMX.edt_moneyEnter(Sender: TObject);
begin
 (Sender as TEdit).Text := StringReplace(edt_money.Text,',','',[rfReplaceAll]);
end;

procedure Tfrm_BKMX.edt_moneyExit(Sender: TObject);
begin
  if Trim((Sender as TEdit).Text) = '' then (Sender as TEdit).Text := '0';
 (Sender as TEdit).Text := FormatFloat('#,##0.00',StrToFloat(edt_money.Text));
end;

procedure Tfrm_BKMX.edt_moneyKeyPress(Sender: TObject; var Key: Char);
begin
  if Not CharInSet(key, ['0'..'9','.','-',#8,#32]) then   //�˸����esc��
       Key:= #0;
  if (Key = '.') and (Pos('.',(Sender as TEdit).Text)>0) then
       Key:= #0;
  if ((Length((Sender as TEdit).Text) >14) and (Pos('.',(Sender as TEdit).Text)>0)) or
   ((Length((Sender as TEdit).Text) >11) and (Pos('.',(Sender as TEdit).Text)=0)) then
  begin
    ShowMessage('����');
    Key:= #0;
  end;
end;

procedure Tfrm_BKMX.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure Tfrm_BKMX.FormShow(Sender: TObject);
begin
  dtp1.Date := now;
end;

function Tfrm_BKMX.UpMoney(const n: real): string;
const cNum: WideString='��Ҽ��������½��ƾ�--��Ǫ��ʰ��Ǫ��ʰ��Ǫ��ʰԪ�Ƿ�';
      cCha:array[0..1, 0..15]of string =
      (('��Ԫ','��ʰ','���','��Ǫ','����','����','����','������',
        '����','����','����','����','��Ԫ','���','���','����'),
       ('Ԫ','��','��','��','��','��','��','��',
        '��','��','��','��','Ԫ','��','��','��'));
var i : Integer;
    sNum,sTemp : WideString;
begin
  result :='';
  sNum := format('%15d',[round(n * 100)]);
  for i := 0 to 14 do
  begin
    stemp := copy(snum,i+1,1);
    if stemp=' ' then continue
      else result := result + cNum[strtoint(stemp)+1] + cNum[i+13];
  end;
  for i:= 0 to 15 do //ȥ���������
    Result := StringReplace(Result, cCha[0,i], cCha[1,i], [rfReplaceAll]);
  if n = 0 then Result := '��Ԫ��';      
end;

initialization
  CoInitialize(Nil);
  RegisterClass(Tfrm_BKMX);
finalization
  UnRegisterClass(Tfrm_BKMX);
  CoUninitialize;
  FreeAndNil(frm_BKMX);
end.

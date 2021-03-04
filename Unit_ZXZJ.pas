unit Unit_ZXZJ;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ActiveX, ComCtrls, Grids, DBGrids, ExtCtrls;

type
  Tfrm_iteminfo = class(TForm)
    btn_close: TButton;
    lbl_zxdm: TLabel;
    edt_zxdm: TEdit;
    lbl_year: TLabel;
    edt_name: TEdit;
    cbb_year: TComboBox;
    lbl_name: TLabel;
    lbl_type: TLabel;
    cbb_type: TComboBox;
    lbl_mode: TLabel;
    lbl_kmdm: TLabel;
    lbl_jici: TLabel;
    lbl_statyear: TLabel;
    lbl_endyear: TLabel;
    edt_chargeDept: TEdit;
    lbl_zgbm: TLabel;
    lbl_keshi: TLabel;
    cbb_mode: TComboBox;
    cbb_level: TComboBox;
    cbb_stat: TComboBox;
    cbb_end: TComboBox;
    cbb_keshi: TComboBox;
    cbb_kmdm: TComboBox;
    pgc1: TPageControl;
    ts1: TTabSheet;
    ts2: TTabSheet;
    lbl_title: TLabel;
    pgc2: TPageControl;
    ts3: TTabSheet;
    ts4: TTabSheet;
    dbgrd1: TDBGrid;
    dbgrd2: TDBGrid;
    lbl_zxmc: TLabel;
    cbb_zxmc: TComboBox;
    lbl_zj_year: TLabel;
    cbb_zj_year: TComboBox;
    shp1: TShape;
    lbl_km: TLabel;
    shp2: TShape;
    shp3: TShape;
    shp4: TShape;
    shp5: TShape;
    shp6: TShape;
    shp7: TShape;
    shp8: TShape;
    shp9: TShape;
    shp10: TShape;
    shp11: TShape;
    lbl1: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    cbb_km: TComboBox;
    edt_total: TEdit;
    edt_zy: TEdit;
    edt_sheng: TEdit;
    edt_shiYS: TEdit;
    edt_shiJJ: TEdit;
    edt_shiGZ: TEdit;
    edt_shiSB: TEdit;
    edt_shiZQ: TEdit;
    edt_shiOther: TEdit;
    shp12: TShape;
    lbl2: TLabel;
    edt_file: TEdit;
    Shape1: TShape;
    Label9: TLabel;
    edt_mmo: TEdit;
    btn_addMoney: TButton;
    btn_modi: TButton;
    btn_delezj: TButton;
    procedure btn_closeClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btn_addMoneyClick(Sender: TObject);
    procedure edt_zyKeyPress(Sender: TObject; var Key: Char);
    procedure edt_zyKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure edt_zyChange(Sender: TObject);
    procedure edt_zyExit(Sender: TObject);
    procedure pgc1Change(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure edt_totalChange(Sender: TObject);
  private
    { Private declarations }
    procedure MoneySum; //自动求合计金额
    procedure clearMoneyEdt;  //清空金额输入框
  public
    { Public declarations }
  end;

var
  frm_iteminfo: Tfrm_iteminfo;

implementation

{$R *.dfm}

procedure Tfrm_iteminfo.btn_addMoneyClick(Sender: TObject);
begin
  MoneySum;
  clearMoneyEdt;
end;

procedure Tfrm_iteminfo.btn_closeClick(Sender: TObject);
begin
  close;
end;


procedure Tfrm_iteminfo.clearMoneyEdt;
begin
  edt_total.Text := '0';
  edt_zy.Text :=  '0';
  edt_sheng.Text := '0';
  edt_shiYS.Text :=  '0';
  edt_shiJJ.Text :=  '0';
  edt_shiGZ.Text :=  '0';
  edt_shiSB.Text :=  '0';
  edt_shiZQ.Text :=  '0';
  edt_shiOther.Text :=  '0';
  edt_file.Text := '';
  edt_mmo.Text := '';
  btn_addMoney.Enabled := false;
end;

procedure Tfrm_iteminfo.edt_totalChange(Sender: TObject);
begin
  if edt_total.Text<> '0' then btn_addMoney.Enabled := true;
end;

procedure Tfrm_iteminfo.edt_zyChange(Sender: TObject);
begin
  if Trim((Sender as TEdit).Text) = '' then (Sender as TEdit).Text := '0';
  if (copy((Sender as TEdit).Text,1,1) = '.') And (Length((Sender as TEdit).Text) = 1) then
  begin
    (Sender as TEdit).Text := '0'+(Sender as TEdit).Text;
     (Sender as TEdit).SelStart :=2;
  end;
  MoneySum;
end;

procedure Tfrm_iteminfo.edt_zyExit(Sender: TObject);
begin
  (Sender as TEdit).Text := FloatToStr(strtofloat((Sender as TEdit).Text));
end;

procedure Tfrm_iteminfo.edt_zyKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_RETURN then
  begin
    (FindNextControl((Sender as TEdit),True,False,false) as TEdit).SetFocus;
  end;
end;

procedure Tfrm_iteminfo.edt_zyKeyPress(Sender: TObject; var Key: Char);
begin
  if Not CharInSet(key, ['0'..'9','.','-',#8,#32]) then   //退格键，esc键
       Key:= #0;
  if (Key = '.') and (Pos('.',(Sender as TEdit).Text)>0) then
       Key:= #0;
end;

procedure Tfrm_iteminfo.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  ACtion := caFree;
end;

procedure Tfrm_iteminfo.FormShow(Sender: TObject);
begin
  pgc1.ActivePageIndex := 0;
end;

procedure Tfrm_iteminfo.MoneySum;
begin
  edt_total.Text :=  floattostr(StrTofloat(edt_zy.Text)+StrTofloat(edt_sheng.Text)+ StrTofloat(edt_shiYS.Text)
                 +StrTofloat(edt_shiJJ.Text)+StrTofloat(edt_shiGZ.Text)+StrTofloat(edt_shiSB.Text)
                 +StrTofloat(edt_shiZQ.Text)+StrTofloat(edt_shiOther.Text));
end;

procedure Tfrm_iteminfo.pgc1Change(Sender: TObject);
begin
  pgc2.ActivePageIndex := pgc1.ActivePageIndex;
end;

initialization
  CoInitialize(Nil);
  RegisterClass(Tfrm_iteminfo);
finalization
  UnRegisterClass(Tfrm_iteminfo);
  CoUninitialize;
  FreeAndNil(frm_iteminfo);
end.

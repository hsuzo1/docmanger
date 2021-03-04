unit Unit_DWXX;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ActiveX, ExtCtrls, ComCtrls, Grids, DBGrids;

type
  Tfrm_DWXX = class(TForm)
    c: TButton;
    pgc1: TPageControl;
    ts1: TTabSheet;
    ts2: TTabSheet;
    pgc2: TPageControl;
    ts3: TTabSheet;
    ts4: TTabSheet;
    lblTitle: TLabel;
    edt_name: TEdit;
    lbl_name: TLabel;
    lbl_zone: TLabel;
    cbb_diqu: TComboBox;
    lbl_type: TLabel;
    rb_company: TRadioButton;
    rb_person: TRadioButton;
    lbl_address: TLabel;
    edt_address: TEdit;
    lbl_zzjgdm: TLabel;
    edt_zzjgdm: TEdit;
    lbl_gsdjhm: TLabel;
    edt_gsdjhm: TEdit;
    dbgrd1: TDBGrid;
    dbgrd2: TDBGrid;
    lbl_tax: TLabel;
    edt_tax: TEdit;
    lbl_fr: TLabel;
    edt_fr: TEdit;
    lbl_frID: TLabel;
    edt_frID: TEdit;
    lbl_lxr1: TLabel;
    edt_lxr1: TEdit;
    lbl_phone1: TLabel;
    edt_phone1: TEdit;
    lbl1: TLabel;
    edt_lxr2: TEdit;
    lbl2: TLabel;
    edt_phone2: TEdit;
    lbl_memo: TLabel;
    mmo1: TMemo;
    lbl_BKname: TLabel;
    lbl_khh: TLabel;
    lbl_acc: TLabel;
    edt_AccountBank: TEdit;
    cbb_accOnwer: TComboBox;
    cbb_AccountName: TComboBox;
    btn_addCompany: TButton;
    btn_delCom: TButton;
    btn_modiCom: TButton;
    btn1: TButton;
    btn2: TButton;
    btn3: TButton;
    lbl3: TLabel;
    lbl_state: TLabel;
    chk_Accstate: TCheckBox;
    lbl_ssdw: TLabel;
    edt_Account: TEdit;
    procedure cClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure pgc1Change(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm_DWXX: Tfrm_DWXX;

implementation

{$R *.dfm}


procedure Tfrm_DWXX.cClick(Sender: TObject);
begin
  close;
end;

procedure Tfrm_DWXX.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure Tfrm_DWXX.pgc1Change(Sender: TObject);
begin
  pgc2.ActivePageIndex := pgc1.ActivePageIndex;
end;

initialization
  CoInitialize(Nil);
  RegisterClass(Tfrm_DWXX);
finalization
  UnRegisterClass(Tfrm_DWXX);
  CoUninitialize;
  FreeAndNil(frm_DWXX);
end.

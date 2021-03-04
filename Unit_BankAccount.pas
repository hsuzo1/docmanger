unit Unit_BankAccount;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs,ActiveX, StdCtrls;

type
  Tfrm_BankAcc = class(TForm)
    btn_close: TButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btn_closeClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm_BankAcc: Tfrm_BankAcc;

implementation

{$R *.dfm}

procedure Tfrm_BankAcc.btn_closeClick(Sender: TObject);
begin
  close;
end;

procedure Tfrm_BankAcc.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

initialization
  CoInitialize(Nil);
  RegisterClass(Tfrm_BankAcc);
finalization
  UnRegisterClass(Tfrm_BankAcc);
  CoUninitialize;
  FreeAndNil(frm_BankAcc);
end.

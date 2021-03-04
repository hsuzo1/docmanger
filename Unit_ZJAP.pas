unit Unit_ZJAP;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ActiveX;

type
  Tfrm_ZJAP = class(TForm)
    btn_close: TButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btn_closeClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm_ZJAP: Tfrm_ZJAP;

implementation

{$R *.dfm}



procedure Tfrm_ZJAP.btn_closeClick(Sender: TObject);
begin
  close;
end;

procedure Tfrm_ZJAP.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

initialization
  CoInitialize(Nil);
  RegisterClass(Tfrm_ZJAP);
finalization
  UnRegisterClass(Tfrm_ZJAP);
  CoUninitialize;
  FreeAndNil(frm_ZJAP);
end.

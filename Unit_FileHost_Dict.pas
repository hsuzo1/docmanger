unit Unit_FileHost_Dict;

interface

uses
  Windows, SysUtils, Classes, Controls, Forms, Dialogs, ActiveX, StdCtrls,
  ExtCtrls, ComCtrls, DB, ADODB, Grids, DBGrids, DBCtrls;

type
  TFrm_Dict = class(TForm)
    tbc1: TTabControl;
    btn_Close: TButton;
    dbgrd1: TDBGrid;
    ds1: TDataSource;
    qry1: TADOQuery;
    dbnvgr1: TDBNavigator;
    pnl1: TPanel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btn_CloseClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure tbc1Change(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Frm_Dict: TFrm_Dict;

implementation

{$R *.dfm}

procedure TFrm_Dict.btn_CloseClick(Sender: TObject);
begin
  qry1.Close;
  Close;
end;

procedure TFrm_Dict.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  ACtion := caFree;
  Self.Release;
end;

procedure TFrm_Dict.FormShow(Sender: TObject);
begin
  With qry1 do
  begin
    Close;
    SQL.clear;
    SQL.add('select * from wenhao order by whjc');
    Open;
  end;
end;

procedure TFrm_Dict.tbc1Change(Sender: TObject);
begin
  With qry1 do
  begin
    Close;
    SQL.clear;
  Case tbc1.TabIndex of
  0: SQL.add('select * from wenhao order by whjc');
  1: SQL.add('select * from sendto order by sendto');
  2: SQL.add('select * from Usertable order by creater');
  End;
    Open;
  end;
end;

initialization
  CoInitialize(Nil);
  RegisterClass(TFrm_Dict);
finalization
  UnRegisterClass(TFrm_Dict);
  CoUninitialize;
  FreeAndNil(Frm_Dict);





end.

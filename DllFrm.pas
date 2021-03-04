unit DllFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes,Controls, Forms,
  Dialogs, DB, ADODB, ExtCtrls, StdCtrls, Buttons,GridsEh, DBGridEh,
  DBGridEhGrouping;

type
  TDllForm = class(TForm)
    DS1: TDataSource;
    DLLPanel1: TPanel;
    Button2: TButton;
    DBGrid1: TDBGridEh;
    procedure Button2Click(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

procedure ShowDetailForm(H:Thandle; AdoQ:TADOQuery);stdcall;

var
  DllForm: TDllForm;

implementation

{$R *.dfm}

procedure ShowDetailForm(H:Thandle; AdoQ:TADOQuery);
Begin
  Application.Handle := H;
  DllForm := TDllForm.Create(Application);
  DllForm.DS1.DataSet := AdoQ;
  try
    DllForm.ShowModal;
  finally
    DllForm.Free;
//    Application.Handle := 0;
  end;
end;

procedure TDllForm.Button2Click(Sender: TObject);
begin
  self.close;
end;

procedure TDllForm.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #27 then Self.Close;
end;

procedure TDllForm.FormShow(Sender: TObject);
var
  i : Integer;
begin
  for I := 0 to DBGrid1.Columns.Count - 1 do
  begin
   if Length(DBGrid1.Columns[i].FieldName) = 3 then
    begin
      DBGrid1.Columns[i].DisplayFormat := '#,##0.00';
      DBGrid1.Columns[i].Title.Alignment := taCenter;
      DBGrid1.Columns[i].AutoFitColWidth := True;
    end;
  end;
end;

end.

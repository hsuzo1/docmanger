unit frm_pwd;

interface

uses
  Windows, SysUtils, Variants, Classes, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Mask, ExtCtrls, DB, ADODB;

type
  TForm2 = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Panel1: TPanel;
    MaskEdit1: TMaskEdit;
    MaskEdit2: TMaskEdit;
    MaskEdit3: TMaskEdit;
    BitBtn1: TBitBtn;
    ADOQuery1: TADOQuery;
    Button1: TButton;
    procedure BitBtn1Click(Sender: TObject);
    procedure MaskEdit3KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Button1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;
{
var
  Form2: TForm2;
 }
  function Form2: TForm2;

implementation

uses DataMoudle, frm_login,Unit_Function;

{$R *.dfm}

function Form2: TForm2;
begin
  Result := TForm2.Create(nil);
end;


procedure TForm2.BitBtn1Click(Sender: TObject);
begin
  if Trim(MaskEdit1.Text) = '' then
    begin
      Application.MessageBox('请输入原密码','公文管理',0+64);
      MaskEdit1.SetFocus;
      Exit;
    end;
  if (Trim(MaskEdit2.Text) = '') and (Trim(MaskEdit3.Text) = '') then
    begin
      Application.MessageBox('请输入并确认新密码','公文管理',0+64);
      Exit;
    end;
  if ( Trim(MaskEdit2.Text) <> Trim(MaskEdit3.Text) )  then
    begin
      Application.MessageBox('两次输入的密码不一致，请重新输入！','公文管理',0+64);
      MaskEdit2.Clear;
      MaskEdit3.Clear;
      MaskEdit2.SetFocus;
      Exit;
    end;
  With ADOQuery1 do
  begin
    Close;
    SQL.Clear;
    SQL.Add('Select * from Login Where LoginName=' +QuotedStr(frm_login.USER)+
            ' and Password=' +QuotedStr(Trim(MaskEdit1.Text)) );
    Open;
    if RecordCount > 0 then
      begin
        Close;
        SQL.Clear;
        SQL.Add('Update Login  Set Password=CONVERT(varbinary,' +QuotedStr(Trim(MaskEdit2.Text))+
                ') Where LoginName=' + QuotedStr(Trim(frm_login.USER)));
        ExecSQL;
        Application.MessageBox('密码修改成功！','公文管理',0+64);
        Unit_Function.InsertLog(Now,frm_login.USER,'修改了密码');
        ADOQuery1.Close;
        ADOQuery1.Free;
        Form2.Close
      end
      else
      begin
        Application.MessageBox('原密码错误','公文管理',0+64);
        MaskEdit1.SetFocus;
        ADOQuery1.Close;
      end;
  end;
end;

procedure TForm2.Button1Click(Sender: TObject);
begin
  Close;
end;

procedure TForm2.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TForm2.MaskEdit3KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_Return then BitBtn1.Click;
end;

end.

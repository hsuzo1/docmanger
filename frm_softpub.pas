unit frm_softpub;

interface

uses
  Windows, SysUtils, Classes, Controls, Forms,
  Mask, Buttons, StdCtrls, IdBaseComponent, IdComponent,
  IdTCPConnection, IdTCPClient, IdExplicitTLSClientServerBase, IdFTP,
  ActiveX, DB, ADODB, ExtCtrls, ComCtrls, Dialogs;

type
  TForm4 = class(TForm)
    lbl1: TLabel;
    lbl2: TLabel;
    lbl3: TLabel;
    lbl4: TLabel;
    edt1: TEdit;
    btn1: TSpeedButton;
    edt2: TEdit;
    medt1: TMaskEdit;
    lbl5: TLabel;
    edt3: TEdit;
    edt4: TEdit;
    lbl6: TLabel;
    edt5: TEdit;
    lbl7: TLabel;
    edt6: TEdit;
    lbl8: TLabel;
    btn2: TButton;
    btn3: TButton;
    dlgOpen1: TOpenDialog;
    idftp2: TIdFTP;
    qry1: TADOQuery;
    edt7: TEdit;
    lbl_path: TLabel;
    edt_path: TEdit;
    edt_downpath: TEdit;
    lbl_down: TLabel;
    pnl1: TPanel;
    pb1: TProgressBar;
    procedure btn2Click(Sender: TObject);
    procedure btn1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btn3Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure edt2KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure idftp2Status(ASender: TObject; const AStatus: TIdStatus;
      const AStatusText: string);
    procedure idftp2WorkBegin(ASender: TObject; AWorkMode: TWorkMode;
      AWorkCountMax: Int64);
    procedure idftp2Work(ASender: TObject; AWorkMode: TWorkMode;
      AWorkCount: Int64);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form4: TForm4;

implementation

Uses DataMoudle;

{$R *.dfm}

procedure TForm4.btn1Click(Sender: TObject);
begin
  if dlgOpen1.Execute then
  begin
    edt1.Text := dlgOpen1.FileName;
    edt6.Text := FormatDateTime('yyyymmdd',Now);
    edt7.SetFocus;
  end;
end;

procedure TForm4.btn2Click(Sender: TObject);
var
  FilePath,  FileName, strSQL : string;
begin
  if Trim(edt1.Text) = '' then exit;
  if (Trim(edt5.Text) = '') Or  (Trim(edt6.Text) = '') or (Trim(edt7.Text) = '') OR (edt_path.Text='')
     or (edt_downpath.Text ='') then
  begin
    Application.MessageBox('����д���������Ϣ','���Ĺ���',0);
    Exit;
  end;
  idftp2.Host := Trim(edt3.Text);
  idftp2.Port := StrToInt(Trim(edt4.Text));
  idftp2.Username := Trim(edt2.Text);
  idftp2.Password := Trim(medt1.Text);
  FilePath := Trim(edt1.Text);
  FileName := Trim(edt5.Text);
  try
    strSQL := 'insert into appversion (sDate,cType,sVersion,sNew,sUrl, sName) values ('
            + 'getdate(),''sj'','+quotedstr(Trim(edt6.Text))    //���ڣ��������汾��
            +','+quotedstr(Trim(edt7.Text))+','                 //����˵��
            +quotedstr(Trim(edt_downpath.Text)+Trim(edt5.Text)) +','
            +QuotedStr(Trim(edt5.Text))+' ) ';  //����·��
    try
      with qry1 do
      begin
        close;
        sql.Clear;
        sql.Add(strSQL);
        ExecSQL;
      end;
      qry1.Close;
    except
      Application.MessageBox('�޷�����Ϣд�����ݿ⣡','���Ĺ���',0+MB_ICONERROR);
      exit;
    end;
   if Not idftp2.Connected Then IdFTP2.Connect;
   IdFTP2.IOHandler.DefStringEncoding := tencoding.Default;
   idftp2.ChangeDir(Trim(edt_path.Text));
   pb1.Visible := True;
   btn2.Enabled := False;
   IdFTP2.Put(FilePath,FileName,False);
  except
   Application.MessageBox('�ϴ���FTP������ʧ�ܣ����顣','���Ĺ���',0+MB_ICONERROR);
   idftp2.Disconnect;
   pb1.Visible := False;
   exit;
  end;
  Application.MessageBox('������������ϣ�','���Ĺ���',0+MB_ICONINFORMATION);
  pb1.Visible := False;
  btn2.Enabled :=True;
end;

procedure TForm4.btn3Click(Sender: TObject);
begin
  Close;
end;

procedure TForm4.edt2KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_RETURN then medt1.SetFocus;
end;

procedure TForm4.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  IdFTP2.Free;
  qry1.Active := False;
  Action := caFree;
end;

procedure TForm4.FormShow(Sender: TObject);
begin
  edt2.SetFocus;
end;

procedure TForm4.idftp2Status(ASender: TObject; const AStatus: TIdStatus;
  const AStatusText: string);
begin
 case AStatus of
  ftpAborted: Application.MessageBox('����ʧ��','���Ĺ���',0+MB_ICONERROR);
 end;
end;

procedure TForm4.idftp2Work(ASender: TObject; AWorkMode: TWorkMode;
  AWorkCount: Int64);
begin
  pb1.Position := AWorkCount;
  Application.ProcessMessages;
end;

procedure TForm4.idftp2WorkBegin(ASender: TObject; AWorkMode: TWorkMode;
  AWorkCountMax: Int64);
begin
  pb1.Min := 0;
  pb1.Position := 0;
  pb1.Max := AWorkCountMax;
end;

initialization
  CoInitialize(Nil);
  RegisterClass(TForm4);
finalization
  UnRegisterClass(TForm4);
  CoUninitialize;
  FreeAndNil(Form4);

end.

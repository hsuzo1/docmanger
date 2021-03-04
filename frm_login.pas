unit frm_login;

interface

uses
  Windows, Messages, SysUtils, Classes, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Buttons, DB, ADODB, XPMan, IniFiles, Mask,
  ComCtrls, IdAntiFreezeBase, IdAntiFreeze, IdBaseComponent, IdComponent,
  IdTCPConnection, IdTCPClient, IdHTTP, ShellAPI;

type
  TFrmLogin = class(TForm)
    BtnLogin: TBitBtn;
    BtnExit: TBitBtn;
    Label1: TLabel;
    Label2: TLabel;
    EdtPass: TEdit;
    ComboEmpl: TComboBox;
    ADOQuery: TADOQuery;
    BitBtn1: TBitBtn;
    Panel1: TPanel;
    Panel2: TPanel;
    Edit1: TEdit;
    Edit2: TEdit;
    Button1: TButton;
    Edit3: TMaskEdit;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    ProgressBar1: TProgressBar;
    idhttp1: TIdHTTP;
    IdAntiFreeze1: TIdAntiFreeze;
    lbl1: TLabel;
    edt_dbname: TEdit;
    lbl_dpt: TLabel;
    cbb_dpt: TComboBox;
    ADOCheck: TADOConnection;
    tmr1: TTimer;
    procedure FormCreate(Sender: TObject);
    procedure BtnLoginClick(Sender: TObject);
    procedure EdtPassKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BitBtn1Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure ComboEmplKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BtnExitClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure idhttp1WorkBegin(ASender: TObject; AWorkMode: TWorkMode;
      AWorkCountMax: Int64);
    procedure idhttp1Work(ASender: TObject; AWorkMode: TWorkMode;
      AWorkCount: Int64);
    procedure idhttp1WorkEnd(ASender: TObject; AWorkMode: TWorkMode);
    procedure FormActivate(Sender: TObject);
    procedure ComboEmplDropDown(Sender: TObject);
    procedure ComboEmplCloseUp(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure tmr1Timer(Sender: TObject);
  private
    { Private declarations }
    BPLHandle : Cardinal;
    iError : integer;
    ExePath : String;  //�����Ŀ¼
    procedure CheckUpdate; //����Ƿ��������ļ�
    Function CheckServer:Boolean;  //��������״̬
    var ServerStatu : Boolean; //��������״̬

  public
    { Public declarations }

  end;

var
  FrmLogin: TFrmLogin;
  USER{��ǰ�û�����},DPTNAME{��������} : STRING;

implementation

uses DataMoudle, Unit_Function;


{$R *.dfm}

var
  hThread: THandle;
{�߳���ں���}

//������Ϣ���ܺ���
const
   XorKey: array[0..7] of Byte = ($B2, $09, $BB, $55, $93, $6D, $44, $47); //�ַ���������
function Dec(Str: string): string; //�ַ����ܺ���
var
   i, j: Integer;
begin
   Result := '';
   j := 0;
   for i := 1 to Length(Str) div 2 do
   begin
      Result := Result + Char(StrToInt('$' + Copy(Str, i * 2 - 1, 2)) xor XorKey[j]);
      j := (j + 1) mod 8;
   end;
end;
function Enc(Str: string): string; //�ַ����ܺ���  �@���õ�һ���������
var
   i, j: Integer;
begin
   Result := '';
   j := 0;
   for i := 1 to Length(Str) do
   begin
      Result := Result + IntToHex(Byte(Str[i]) xor XorKey[j], 2);
      j := (j + 1) mod 8;
   end;
end;
//���ܺ�������

function TFrmLogin.CheckServer: Boolean;   //��������������Ϣ
var
  MyIni : Tinifile;
  DBip, dbUser, dbPWD,dbName : String;
  vTableNames:   TStringList; //���ݿ����б�����
begin
  Myini := TInifile.Create(ExtractFilePath(paramstr(0))+'Config.ini');
  vTableNames :=  TStringList.Create;
  Try
    DBip := Myini.ReadString('ServerInfo','SQLIP','');
    dbUser := Dec(Myini.ReadString('ServerInfo','SQLUser',''));
    dbPWD := Dec(MyIni.ReadString('ServerInfo','SQLPWD',''));
    dbName := Dec(Myini.ReadString('ServerInfo','DBNAME',''));
    ADOCheck.Close;
    ADOCheck.ConnectionString:='Provider=SQLOLEDB.1;Persist Security Info=True;'+
    'User ID=' +Trim(dbUser)+ ';Password=' +dbPWD+';Initial Catalog='+dbName+';Data Source=' +Trim(DBip);
    Try
      ADOCheck.Connected:=True;
      ADOCheck.GetTableNames(vTableNames); //ȡ�����б���
      if vTableNames.IndexOf('Dept')>= 0 then //�ж��Ƿ����
      begin
        Result:=True;   // ���ӷ������ɹ�
        ServerStatu := True;
      end
      else
        result:= False; //���ݿ����Ʋ��ԣ��Ҳ���Dept��
    except
      on   E:exception   do
      begin
        tmr1.Enabled := false;
        MessageBox(Handle, StringToOleStr(E.Message + '����ϵ����Ա�������������ݿ����ӡ�') ,'���Ĺ���', MB_OK+MB_ICONERROR );
        result:= False; // ���ӷ�����ʧ��
        ServerStatu := False;
      end;
    End;
  Finally
    Myini.Free;
    vTableNames.Free;
    ADOCheck.Connected := False;
  End;
end;

procedure TFrmLogin.CheckUpdate; //����Ƿ��������ļ�
var
  sCurrentVer,sNew, sUrl, sName : string;
  sNewVer    : Integer;
  MyStream : TMemoryStream;
begin
  With ADOQuery do
  begin
    Close;
    SQL.clear;
    SQL.Add('select Top 1 * from appversion where cType=''sj'' Order By sDate Desc');
    Open;
  end;
  if ADOQuery.RecordCount = 0 then Exit;
  sCurrentVer := Copy(Caption,length(caption)-7,8);
  sNewVer := ADOQuery.FieldByName('sVersion').AsInteger;
  sNew    := ADOQuery.FieldByName('sNew').AsString;
  sUrl    := ADOQuery.FieldByName('sUrl').AsString;   // download url
  sName   := Trim(ADOQuery.FieldByName('sName').AsString); //installer package name
  if StrToInt(sCurrentVer) >= sNewVer then  Exit;
  if MessageBox(Handle, Pchar('������������ �°汾�ţ�'+inttostr(sNewVer)
           +#13+#13+'�Ƿ�����������'), '���Ĺ���', MB_OKCANCEL + MB_ICONINFORMATION  ) = 2 then      Exit;
  //��ʼ����
  IdAntiFreeze1.OnlyWhenIdle:=False;//����ʹ�����з�Ӧ.
  BitBtn1.Enabled := False;
  BtnLogin.Enabled:= False;
��MyStream:=TMemoryStream.Create;
��try
��  IdHTTP1.Get(sUrl, MyStream);
��except
��  MessageBox(Handle, '�����ļ�ʧ�ܣ�', '���Ĺ���', MB_OK+MB_ICONERROR);
����MyStream.Free;
����Exit;
��end;
  if FileExists( ExePath+sName) then DeleteFile( ExePath + sName);   //Delete Old InstallerPack
��MyStream.SaveToFile( ExePath + sName);
��MyStream.Free;
  Close;
  Application.Terminate;
  ShellExecute(0,PChar('open'),PChar( ExePath + sName),PChar(''),nil,SW_NORMAL);
end;

function MyThreadFun(p: Pointer): DWORD; stdcall;
begin
  FrmLogin.CheckUpdate; {���� Form ��ķ���}
  Result := 99;   {�������ֵ����Ϊ�̵߳��˳�����, 99 ���������������}
end;

procedure TFrmLogin.FormActivate(Sender: TObject);
  var
  ID: DWORD;
begin
  if ServerStatu then
  begin
    tmr1.Enabled := False;
    hThread := CreateThread(nil, 0, @MyThreadFun, nil, 0, ID);
  end;
end;

procedure TFrmLogin.FormClose(Sender: TObject; var Action: TCloseAction);
var
   MyIni : Tinifile;
begin
   Myini := TInifile.Create(ExePath+'Config.ini');
   Myini.WriteString('UserInfo','User',Trim(ComboEmpl.Text));
   Myini.Free;
   if BPLHandle <> 0 then UnloadPackage(BPLHandle);
   Action :=caFree;
   Self.Release;
end;

procedure TFrmLogin.FormCreate(Sender: TObject);  //װ���������ӵ�Ԫ
begin
  ServerStatu := False; //��ʼ��������״̬ΪFalse
  BPLHandle := 0;
  ExePath := ExtractFilePath(paramstr(0));
end;

procedure TFrmLogin.FormShow(Sender: TObject); //��ʾ���������б�
begin
  FrmLogin.Height := 192;
  if Not CheckServer then
  begin
    Exit;
  end;
  BPLHandle := LoadPackage('dm.bpl');
  //Get Dpt List
  with ADOQuery do
  begin
    Close;
    SQL.Clear;
    SQL.Add('Select DeptName From Dept Order by DeptNo');
    Open;
    cbb_dpt.Clear;
    while not Eof do
    begin
      cbb_dpt.Items.Add(FieldByName('DeptName').AsString);
      Next;
    end;
  end;
  ServerStatu := True;
  iError := 0;
end;

procedure TFrmLogin.idhttp1Work(ASender: TObject; AWorkMode: TWorkMode;
  AWorkCount: Int64);
begin
  ProgressBar1.Position:=AWorkCount;
  Application.ProcessMessages;
end;

procedure TFrmLogin.idhttp1WorkBegin(ASender: TObject; AWorkMode: TWorkMode;
  AWorkCountMax: Int64);
begin
  ProgressBar1.Visible := True;
  ProgressBar1.Max:=AWorkCountMax;
��ProgressBar1.Min:=0;
��ProgressBar1.Position:=0;
end;

procedure TFrmLogin.idhttp1WorkEnd(ASender: TObject; AWorkMode: TWorkMode);
begin
  MessageBox(Handle,'��װ���������','���Ĺ���', MB_OK+MB_ICONINFORMATION );
  ProgressBar1.Visible := False;
end;

procedure TFrmLogin.tmr1Timer(Sender: TObject);
var
  h: HWND;
begin
  h := GetActiveWindow;
  if h = Self.Handle  then  exit;
  SetWindowPos(Handle, HWND_TOPMOST, Left, Top, Width, Height, SWP_SHOWWINDOW); //�����ö����Ǽ���״̬��
//   SetForegroundWindow(Self.Handle);  //�Ѵ����ö��������
end;

procedure TFrmLogin.ComboEmplCloseUp(Sender: TObject);
begin
  if ComboEmpl.ItemIndex >-1 then EdtPass.SetFocus;
end;

procedure TFrmLogin.ComboEmplDropDown(Sender: TObject);//��ʾ������Ա�б�
begin
  if Trim(cbb_dpt.Text) = '' then exit;
  //Get User List
  with ADOQuery do
  begin
    Close;
    SQL.Clear;
    SQL.Add('Select LoginName From Login Where (inuse is NULL) and DeptNo=(select DeptNo from Dept where DeptName='+QuotedStr(cbb_dpt.Text)
           +') Order by LoginNo');
    Open;
    ComboEmpl.Clear;
    while not Eof do
    begin
      ComboEmpl.Items.Add(FieldByName('LoginName').AsString);
      Next;
    end;
  end;
end;

procedure TFrmLogin.ComboEmplKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_Return then EdtPass.Focused;
end;

procedure TFrmLogin.EdtPassKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_Return then BtnLogin.Click;
end;

procedure TFrmLogin.BitBtn1Click(Sender: TObject);
begin
  if FrmLogin.Height > 300 then
    begin
      FrmLogin.Height := 192
    end
    else  FrmLogin.Height := 365;
end;

procedure TFrmLogin.BtnExitClick(Sender: TObject);
var
  ExitCode: DWORD;
begin
  GetExitCodeThread(hThread, ExitCode);
  if ExitCode = STILL_ACTIVE then
  begin
    // Text := Format('�߳����˳�, �˳�������: %d', [ExitCode]);
    TerminateThread(hThread,0); //����ֹ�߳�
  end;
  Close;
  Application.Terminate;
end;

procedure TFrmLogin.BtnLoginClick(Sender: TObject);     //��֤����¼ϵͳ
var
  LoginName, LoginPass: string;
begin
 if ComboEmpl.Text <> '' then
  begin
    LoginName := ComboEmpl.Text;
    LoginPass := EdtPass.Text;
    with ADOQuery do
    begin
      Close;
      SQL.Clear;
//      SQL.Add('Exec compare :LoginName,:Pass');
//      Parameters.ParamByName('LoginName').Value := LoginName;
//      Parameters.ParamByName('Pass').Value := LoginPass;
      SQL.Add('Select * from Login Where LoginName=' + QuotedStr(LoginName) +
       ' And Password=' + Quotedstr(LoginPass) +
       ' and DeptNo=(select a.DeptNo from Dept a where a.DeptName='+QuotedStr(cbb_dpt.Text)+') and InUse is null ' );
      Open;
      if Not Fields[0].IsNull then
      begin
        DPTNAME := Trim(cbb_dpt.Text);
        USER := Trim(ComboEmpl.Text);
        Unit_Function.InsertLog(Now,USER,'����ϵͳ');
        Close;        //�ر�Query����
        Self.Tag := 1;
        Self.Close;
      end
      else
      begin
        iError := iError + 1;
        if iError > 2 then
        begin
          tmr1.Enabled := false;
          Application.MessageBox(Pchar('�����������3�Σ�ϵͳ���رա�'),'���Ĺ���', MB_ICONERROR);
          Application.Terminate;
        end;
        tmr1.Enabled := false;
        Application.MessageBox(Pchar('��������������롣'),'���Ĺ���', MB_ICONWARNING);
        EdtPass.Clear;
        EdtPass.SetFocus;
        tmr1.Enabled := true;
      end;
    end;
  end;
end;

procedure TFrmLogin.Button1Click(Sender: TObject); //���÷�������Ϣ
var
   MyIni : Tinifile;
begin
  if Trim(Edit1.Text) = '' then
  begin
    Showmessage('����д��������ַ');
    Exit;
  end;
  if Trim(Edit2.Text) = '' then
  begin
    Showmessage('����д���ݿ��û�����');
    Exit;
  end;
  if Trim(edt_dbname.Text) = '' then
  begin
    Showmessage('���ݿ����Ʋ���Ϊ��');
    Exit;
  end;
  Myini := TInifile.Create( ExePath +'Config.ini');
  Try
    Myini.WriteString('ServerInfo','SQLIP',Trim(EDit1.Text));
    Myini.WriteString('ServerInfo','SQLUser',Enc(Trim(EDit2.Text)));
    Myini.WriteString('ServerInfo','SQLPWD',Enc(Trim(EDit3.Text)));
    Myini.WriteString('ServerInfo','DBNAME',Enc(Trim(edt_dbname.Text)));
  Finally
    Myini.Free;
  End;
  if Not CheckServer then
  begin
    MessageBox(Handle,'�޷����ӷ����������������á�','���Ĺ���', MB_OK+MB_ICONERROR);
    exit
  end
  else
  begin
    MessageBox(Handle,'���ݿ����óɹ��������µ�¼��','���Ĺ���', MB_OK+MB_ICONINFORMATION );
    Application.Terminate;
  end;
end;

end.


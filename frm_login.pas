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
    ExePath : String;  //程序根目录
    procedure CheckUpdate; //检查是否有升级文件
    Function CheckServer:Boolean;  //检查服务器状态
    var ServerStatu : Boolean; //检查服务器状态

  public
    { Public declarations }

  end;

var
  FrmLogin: TFrmLogin;
  USER{当前用户姓名},DPTNAME{部门名称} : STRING;

implementation

uses DataMoudle, Unit_Function;


{$R *.dfm}

var
  hThread: THandle;
{线程入口函数}

//连接信息解密函数
const
   XorKey: array[0..7] of Byte = ($B2, $09, $BB, $55, $93, $6D, $44, $47); //字符串加密用
function Dec(Str: string): string; //字符解密函數
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
function Enc(Str: string): string; //字符加密函數  這是用的一個異或加密
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
//解密函数结束

function TFrmLogin.CheckServer: Boolean;   //检查服务器连接信息
var
  MyIni : Tinifile;
  DBip, dbUser, dbPWD,dbName : String;
  vTableNames:   TStringList; //数据库所有表名称
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
      ADOCheck.GetTableNames(vTableNames); //取得所有表名
      if vTableNames.IndexOf('Dept')>= 0 then //判断是否存在
      begin
        Result:=True;   // 连接服务器成功
        ServerStatu := True;
      end
      else
        result:= False; //数据库名称不对，找不到Dept表。
    except
      on   E:exception   do
      begin
        tmr1.Enabled := false;
        MessageBox(Handle, StringToOleStr(E.Message + '请联系管理员或重新设置数据库连接。') ,'公文管理', MB_OK+MB_ICONERROR );
        result:= False; // 连接服务器失败
        ServerStatu := False;
      end;
    End;
  Finally
    Myini.Free;
    vTableNames.Free;
    ADOCheck.Connected := False;
  End;
end;

procedure TFrmLogin.CheckUpdate; //检查是否有升级文件
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
  if MessageBox(Handle, Pchar('发现升级程序！ 新版本号：'+inttostr(sNewVer)
           +#13+#13+'是否立即升级？'), '公文管理', MB_OKCANCEL + MB_ICONINFORMATION  ) = 2 then      Exit;
  //开始升级
  IdAntiFreeze1.OnlyWhenIdle:=False;//设置使程序有反应.
  BitBtn1.Enabled := False;
  BtnLogin.Enabled:= False;
　MyStream:=TMemoryStream.Create;
　try
　  IdHTTP1.Get(sUrl, MyStream);
　except
　  MessageBox(Handle, '下载文件失败！', '公文管理', MB_OK+MB_ICONERROR);
　　MyStream.Free;
　　Exit;
　end;
  if FileExists( ExePath+sName) then DeleteFile( ExePath + sName);   //Delete Old InstallerPack
　MyStream.SaveToFile( ExePath + sName);
　MyStream.Free;
  Close;
  Application.Terminate;
  ShellExecute(0,PChar('open'),PChar( ExePath + sName),PChar(''),nil,SW_NORMAL);
end;

function MyThreadFun(p: Pointer): DWORD; stdcall;
begin
  FrmLogin.CheckUpdate; {调用 Form 类的方法}
  Result := 99;   {这个返回值将成为线程的退出代码, 99 是我随意给的数字}
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

procedure TFrmLogin.FormCreate(Sender: TObject);  //装载数据连接单元
begin
  ServerStatu := False; //初始化服务器状态为False
  BPLHandle := 0;
  ExePath := ExtractFilePath(paramstr(0));
end;

procedure TFrmLogin.FormShow(Sender: TObject); //显示部门名称列表
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
　ProgressBar1.Min:=0;
　ProgressBar1.Position:=0;
end;

procedure TFrmLogin.idhttp1WorkEnd(ASender: TObject; AWorkMode: TWorkMode);
begin
  MessageBox(Handle,'安装包下载完成','公文管理', MB_OK+MB_ICONINFORMATION );
  ProgressBar1.Visible := False;
end;

procedure TFrmLogin.tmr1Timer(Sender: TObject);
var
  h: HWND;
begin
  h := GetActiveWindow;
  if h = Self.Handle  then  exit;
  SetWindowPos(Handle, HWND_TOPMOST, Left, Top, Width, Height, SWP_SHOWWINDOW); //窗口置顶，非激活状态。
//   SetForegroundWindow(Self.Handle);  //把窗口置顶并激活窗口
end;

procedure TFrmLogin.ComboEmplCloseUp(Sender: TObject);
begin
  if ComboEmpl.ItemIndex >-1 then EdtPass.SetFocus;
end;

procedure TFrmLogin.ComboEmplDropDown(Sender: TObject);//显示操作人员列表
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
    // Text := Format('线程已退出, 退出代码是: %d', [ExitCode]);
    TerminateThread(hThread,0); //　终止线程
  end;
  Close;
  Application.Terminate;
end;

procedure TFrmLogin.BtnLoginClick(Sender: TObject);     //验证并登录系统
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
        Unit_Function.InsertLog(Now,USER,'登入系统');
        Close;        //关闭Query连接
        Self.Tag := 1;
        Self.Close;
      end
      else
      begin
        iError := iError + 1;
        if iError > 2 then
        begin
          tmr1.Enabled := false;
          Application.MessageBox(Pchar('密码连续输错3次，系统将关闭。'),'公文管理', MB_ICONERROR);
          Application.Terminate;
        end;
        tmr1.Enabled := false;
        Application.MessageBox(Pchar('密码错，请重新输入。'),'公文管理', MB_ICONWARNING);
        EdtPass.Clear;
        EdtPass.SetFocus;
        tmr1.Enabled := true;
      end;
    end;
  end;
end;

procedure TFrmLogin.Button1Click(Sender: TObject); //设置服务器信息
var
   MyIni : Tinifile;
begin
  if Trim(Edit1.Text) = '' then
  begin
    Showmessage('请填写服务器地址');
    Exit;
  end;
  if Trim(Edit2.Text) = '' then
  begin
    Showmessage('请填写数据库用户名称');
    Exit;
  end;
  if Trim(edt_dbname.Text) = '' then
  begin
    Showmessage('数据库名称不能为空');
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
    MessageBox(Handle,'无法连接服务器，请重新设置。','公文管理', MB_OK+MB_ICONERROR);
    exit
  end
  else
  begin
    MessageBox(Handle,'数据库设置成功！请重新登录。','公文管理', MB_OK+MB_ICONINFORMATION );
    Application.Terminate;
  end;
end;

end.


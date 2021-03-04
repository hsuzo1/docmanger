program xcfile;

    { Reduce EXE size by disabling as much of RTTI as possible (delphi 2009/2010) }
    {$IF CompilerVersion >= 21.0}
    {$WEAKLINKRTTI ON}
    {$RTTI EXPLICIT METHODS([]) PROPERTIES([]) FIELDS([])}
    {$IFEND}

uses
  FastMM4,
  Forms,windows,
  frm_login in 'frm_login.pas' {FrmLogin},
  frm_main in 'frm_main.pas' {MainForm},
  frm_pwd in 'frm_pwd.pas' {Form2},
  frm_ABOUT in 'frm_ABOUT.pas' {AboutBox};

{$E exe}
{$R *.res}

var
  hAppMutex: THandle; //声明互斥变量
begin
  Application.Title := '公文管理软件';
  hAppMutex := CreateMutex(nil, false, pchar(Application.Title)); //创建互斥对象projectname工程名称
  if ( (hAppMutex <> 0) and (GetLastError() = ERROR_ALREADY_EXISTS)) then
  begin   // hAppMutex <> 0 说明互斥对象创建成功
    Application.MessageBox('该程序正在运行！','提示',MB_OK);
  end
  else
  begin
    Application.Initialize;
    FrmLogin := TFrmLogin.Create(nil);
    FrmLogin.ShowModal;
    if FrmLogin.Tag = 1 then
    begin
      FrmLogin.Free;
      Application.Title := '公文管理软件';
      Application.CreateForm(TMainForm, MainForm);
      Application.MainFormOnTaskBar := True;
      Application.Run;
    end;
  end;
  ReleaseMutex(hAppMutex); //关闭互斥体 CloseHandle(hAppMutex)作用一样
end.


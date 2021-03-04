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
  hAppMutex: THandle; //�����������
begin
  Application.Title := '���Ĺ������';
  hAppMutex := CreateMutex(nil, false, pchar(Application.Title)); //�����������projectname��������
  if ( (hAppMutex <> 0) and (GetLastError() = ERROR_ALREADY_EXISTS)) then
  begin   // hAppMutex <> 0 ˵��������󴴽��ɹ�
    Application.MessageBox('�ó����������У�','��ʾ',MB_OK);
  end
  else
  begin
    Application.Initialize;
    FrmLogin := TFrmLogin.Create(nil);
    FrmLogin.ShowModal;
    if FrmLogin.Tag = 1 then
    begin
      FrmLogin.Free;
      Application.Title := '���Ĺ������';
      Application.CreateForm(TMainForm, MainForm);
      Application.MainFormOnTaskBar := True;
      Application.Run;
    end;
  end;
  ReleaseMutex(hAppMutex); //�رջ����� CloseHandle(hAppMutex)����һ��
end.


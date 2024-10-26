unit YBMain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, CoolTrayIcon, Menus, DB, ADODB, IniFiles, Grids, DBGrids,
  ExtCtrls, DBCtrls, StdCtrls, Gauges, ImgList, ComCtrls, DateUtils,
  OleCtrls, SHDocVw, IdMessage, IdBaseComponent, IdComponent,
  IdTCPConnection, IdTCPClient, IdMessageClient, IdSMTP, MemDS, DBAccess,
  MyAccess;

type
  TMainForm = class(TForm)
    CoolIcon: TCoolTrayIcon;
    PopupMenu1: TPopupMenu;
    ShowWindow1: TMenuItem;
    N1: TMenuItem;
    Exit1: TMenuItem;
    ADOTable1: TADOTable;
    Panel2: TPanel;
    MainMenu1: TMainMenu;
    Function1: TMenuItem;
    Exit2: TMenuItem;
    Label2: TLabel;
    Panel3: TPanel;
    ImageCurrentStatus: TImage;
    N2: TMenuItem;
    SystemStatus: TStatusBar;
    ADOQuerySelect: TADOQuery;
    ADOQueryExec: TADOQuery;
    synWorkingRec: TMenuItem;
    ADOQueryInner: TADOQuery;
    TimerForUpdate: TTimer;
    Help: TMenuItem;
    About1: TMenuItem;
    GOrder: TGauge;
    Options1: TMenuItem;
    Setting1: TMenuItem;
    ADOQueryEmpl: TADOQuery;
    WebBrowser1: TWebBrowser;
    GUser: TGauge;
    SMTP: TIdSMTP;
    IdMsgSend: TIdMessage;
    EmailContent: TMemo;
    memo: TMemo;
    con_my: TMyConnection;
    tbl_myUser: TMyTable;
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure ShowWindow1Click(Sender: TObject);
    procedure CoolIconMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure FormCreate(Sender: TObject);
    procedure Exit1Click(Sender: TObject);
    procedure CoolIconBalloonHintHide(Sender: TObject);
    procedure Exit2Click(Sender: TObject);
    procedure ImageCurrentStatusClick(Sender: TObject);
    procedure synWorkingRecClick(Sender: TObject);
    procedure TimerForUpdateTimer(Sender: TObject);
    procedure About1Click(Sender: TObject);
    procedure Setting1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    CanDo :Boolean;
    accessFileName : String;
    mysqlDbServer :String;
    mySqlDbName : String;
    mySqlUserName : String;
    mySqlPassword : String;

    MySqlConnectionString : String;
    MsSqlConnectionString : String;

    msSqlDbServer : String;
    msSqlDbName : String;
    msSqlUserName : String;
    msSqlPassword : String;

    //url string
    urlAutoSchedule : string;
    urlStatisticsBigSchedule : string;

    //send email part
    smtpHost : string;
    SmtpPort : integer;
    SmtpAuthType : integer;
    SmtpUserName : string;
    SmtpPassWord : string;

    procedure readParameters;
    procedure changeStatus;
    procedure Send(AFromEmail,AToEmail,ACCEmail,ABCCEmail,ASubject: string);
    procedure SendMail;
  public
    ByDays : Boolean;
    PreDays : Integer;
    StartDate, EndDate : TDateTime;
    
    // Some extra stuff necessary for the "Close to tray" option:
    SessionEnding: Boolean;
    procedure displayInfo(s : String);
    procedure WMQueryEndSession(var Message: TMessage); message WM_QUERYENDSESSION;
    procedure tryToConnection();
    procedure sync();
    procedure sendmailWithCSharp();
  end;

var
  MainForm: TMainForm;

implementation

uses unLib, YBAbout, YBOptions, YBSynchronize;

{$R *.dfm}
const
  constIniFileName = 'setting.ini';
  constAccessProvider = 'Provider=Microsoft.Jet.OLEDB.4.0;';
  constAccessDBPassword = 'Persist Security Info=False;Jet OLEDB:Database Password=admin';
  constMySqlConnectString = 'Provider=MSDASQL.1;Persist Security Info=true;Password=root;Extended Properties="DRIVER={MySQL ODBC 3.51 Driver};DESC=;DATABASE=yb;SERVER=localhost;UID=root;PASSWORD=root;PORT=;OPTION=18475;STMT=;"';
  constMsSqlConnectString = 'Provider=SQLOLEDB.1;Password=123456;Persist Security Info=True;User ID=sa;Initial Catalog=temp;Data Source=IT-SERVER';

procedure TMainForm.WMQueryEndSession(var Message: TMessage);
{ This method is a hack. It intercepts the WM_QUERYENDSESSION message.
  This way we can decide if we want to ignore the "Close to tray" option.
  Otherwise, when selected, the option would make Windows unable to shut down. }
begin
  Message.Result := 1;
end;

procedure TMainForm.Send(AFromEmail,AToEmail,ACCEmail,ABCCEmail,ASubject:string);
begin
   with IdMsgSend do
      begin
         Body.Assign(EmailContent.Lines);
         From.Text := AFromEmail;
         ReplyTo.EMailAddresses := AFromEmail;
         Recipients.EMailAddresses := AToEmail; { To: header }
         Subject := ASubject; { Subject: header }
         Priority := TIdMessagePriority(3); { Message Priority }
         CCList.EMailAddresses := ACCEmail; {CC}
         BccList.EMailAddresses := ABCCEmail; {BBC}
         ReceiptRecipient.Text := ''; {We set the recipient to the From E-Mail address }
         ContentType := 'text/html';
         CharSet := 'big5';
      end;

  {authentication settings}
   case SmtpAuthType of
      0: SMTP.AuthenticationType := atNone;
      1: SMTP.AuthenticationType := atLogin; {Simple Login}
   end;
   SMTP.Username := SmtpUserName;
   SMTP.Password := SmtpPassWord;

   {General setup}
   SMTP.Host := smtpHost;
   SMTP.Port := SmtpPort;
   SMTP.Username := 'jeasonwangxl';
   SMTP.Password := '771688';

   {now we send the message}
   SMTP.Connect;
   try
      SMTP.Send(IdMsgSend);
   finally
      SMTP.Disconnect;
   end;
end;

procedure TMainForm.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  CanClose := SessionEnding;
  if not CanClose then
  begin
    CoolIcon.HideMainForm;
    CoolIcon.IconVisible := True;
  end;
end;

procedure TMainForm.ShowWindow1Click(Sender: TObject);
begin
  CoolIcon.ShowMainForm;    // ALWAYS use this method!!!
end;

procedure TMainForm.CoolIconMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  if Assigned(PopupMenu1) then
    if not PopupMenu1.AutoPopup then
    begin
      SetForegroundWindow(Application.Handle);  // Move focus from tray icon to this form
      MessageDlg('The popup menu is disabled.', mtInformation, [mbOk], 0);
    end;
end;

procedure TMainForm.FormCreate(Sender: TObject);
begin
  CanDo := false;
  changeStatus;
  SessionEnding := false;
  TimerForUpdate.Interval := 60 * 1000;
  TimerForUpdate.Enabled := true;

  ByDays := true;
  PreDays := 7;
end;

procedure TMainForm.Exit1Click(Sender: TObject);
begin
  SessionEnding := true;
  close;
end;

procedure TMainForm.CoolIconBalloonHintHide(Sender: TObject);
begin
  SetForegroundWindow(Application.Handle);  // Move focus from tray icon to this form
end;

procedure TMainForm.readParameters;
begin
  with TIniFile.Create(ExtractFilePath(Application.ExeName)+constIniFileName) do
    begin
      accessFileName := ReadString('Access part','Data Source','');
      mysqlDbServer := ReadString('MySql part','Server','localhost');
      mySqlDbName   := ReadString('MySql part','DATABASE','YB');
      mySqlUserName := ReadString('MySql part','UserName','root');
      mySqlPassword := ReadString('MySql part','Password','root');

      msSqlDbServer := ReadString('MsSql part','DBServer','IT-SERVER');
      msSqlDbName   := ReadString('MsSql part','DBName','temp');
      msSqlUserName := ReadString('MsSql part','UserName','sa');
      msSqlPassword := ReadString('MsSql part','Password','123456');

      smtpHost      := ReadString ('Send Email','smtpHost','');
      SmtpPort      := ReadInteger('Send Email','SmtpPort',25);
      SmtpAuthType  := ReadInteger('Send Email','SmtpAuthType',0);
      SmtpUserName  := ReadString('Send Email','SmtpUserName','sendmail_test123');
      SmtpPassWord  := ReadString('Send Email','SmtpPassWord','888888');

      //url
      urlAutoSchedule := ReadString('URL','SystemSchedule','');
      urlStatisticsBigSchedule := ReadString('URL','StatisticsBigSchedule','');
    end;
end;

procedure TMainForm.Exit2Click(Sender: TObject);
begin
  SessionEnding := true;
  close;
end;

procedure TMainForm.ImageCurrentStatusClick(Sender: TObject);
begin
  //tryToConnection;
end;

procedure TMainForm.changeStatus;
begin
  if not CanDo then
    begin
      synWorkingRec.Enabled := false;
      ImageCurrentStatus.Picture.Icon.LoadFromFile('RED.ico');
    end else begin
      synWorkingRec.Enabled := true;
      ImageCurrentStatus.Picture.Icon.LoadFromFile('GREEN.ico');
    end;
end;

procedure TMainForm.displayInfo(s: String);
begin
  SystemStatus.Panels[0].Text := s;
end;

procedure TMainForm.synWorkingRecClick(Sender: TObject);
begin
  sync;
  //SendMail;
  //sendmailWithCSharp;
end;

procedure TMainForm.TimerForUpdateTimer(Sender: TObject);
var
  timeBegin : TTime;
  timeEnd : TTime;
  timeCur : TTime;
  needupdate : boolean;
begin
  needupdate := false;
  timeCur   := time();

  if CanDo = true then
  begin
    //4 time range , timespan = 10 mins
    //6:00, 11:30, 17:30, 00:00
    timeBegin := EnCodeTime(6,0,0,0);
    timeEnd   := EnCodeTime(6,10,0,0);
    if (timeCur >= timeBegin) and (timeCur < timeEnd) then needupdate := true;

    timeBegin := EnCodeTime(11,30,0,0);
    timeEnd   := EnCodeTime(11,40,0,0);
    if (timeCur >= timeBegin) and (timeCur < timeEnd) then needupdate := true;

    timeBegin := EnCodeTime(17,30,0,0);
    timeEnd   := EnCodeTime(17,40,0,0);
    if (timeCur >= timeBegin) and (timeCur < timeEnd) then needupdate := true;

    timeBegin := EnCodeTime(0,0,0,0);
    timeEnd   := EnCodeTime(0,10,0,0);
    if (timeCur >= timeBegin) and (timeCur < timeEnd) then needupdate := true;
    
    if needupdate = true then sync;
  end;
end;

procedure TMainForm.About1Click(Sender: TObject);
begin
  YBAbout.AboutBox.ShowModal;
end;

procedure TMainForm.Setting1Click(Sender: TObject);
begin
  frmOptions := TfrmOptions.Create(self);
  try
    if frmOptions.ShowModal = MrOK then
      with frmOptions do
      begin
        if rbByDays.Checked = true then
        begin
          ByDays := true;
          PreDays := StrToInt(cbDays.Items[cbDays.ItemIndex]);
        end else begin
          ByDays := false;
          StartDate := dtFrom.Date;
          EndDate   := dtTo.Date;
        end;
      end;
  finally
    frmOptions.Free;
  end; 
end;

procedure TMainForm.tryToConnection;
begin
  CanDo := not CanDo;
  if CanDo then
    begin
      readParameters;
      try
        ADOTable1.Active := false;
        //AccessConnectionString := constAccessProvider + 'Data Source=' + accessFileName + ';' + constAccessDBPassword;
        //ADOTable1.ConnectionString := AccessConnectionString;
        //ADOTable1.TableName := '`employee`';
        MsSqlConnectionString := StringReplace(constMsSqlConnectString,'Data Source=IT-SERVER', 'Data Source='+msSqlDbServer, [rfIgnoreCase]);
        MsSqlConnectionString := StringReplace(MsSqlConnectionString,'Initial Catalog=temp', 'Initial Catalog='+msSqlDbName, [rfIgnoreCase]);
        MsSqlConnectionString := StringReplace(MsSqlConnectionString,'User ID=sa', 'User ID='+msSqlUserName, [rfIgnoreCase]);
        MsSqlConnectionString := StringReplace(MsSqlConnectionString,'Password=123456', 'Password='+msSqlPassword, [rfIgnoreCase]);
        ADOTable1.ConnectionString := MsSqlConnectionString;
        ADOTable1.TableName := 'tb_order';

        ADOTable1.Active := true;
      except
        on EDatabaseError do
          begin
            MessageDlg('The MsSql DB connection failed.', mtInformation, [mbOk], 0);
            CanDo := false;
          end;
        on E: Exception do
          begin
            MessageDlg(E.Message, mtInformation, [mbOk], 0);
            CanDo := false;
          end;
      end;

      if CanDo then
        try
          ADOTable1.Active := false;
          MySqlConnectionString := StringReplace(constMySqlConnectString,'Server=localhost', 'Server=' + mysqlDbServer, [rfIgnoreCase]);
          MySqlConnectionString := StringReplace(MySqlConnectionString,'UID=root', 'UID=' + mysqlUserName, [rfIgnoreCase]);
          MySqlConnectionString := StringReplace(MySqlConnectionString,'DATABASE=yb', 'DATABASE=' + mySqlDbName, [rfIgnoreCase]);
          MySqlConnectionString := StringReplace(MySqlConnectionString,'PASSWORD=root', 'PASSWORD=' + mysqlPassword, [rfIgnoreCase]);
          ADOTable1.ConnectionString := MySqlConnectionString;
          ADOTable1.TableName := 'user';
          ADOTable1.Active := true ;
        except
          on EDatabaseError do
            begin
              MessageDlg('The Mysql DB connection failed.', mtInformation, [mbOk], 0);
              CanDo := false;
            end;
          on E: Exception do
            begin
              MessageDlg(E.Message, mtInformation, [mbOk], 0);
              CanDo := false;
            end;
        end;
        changeStatus;
    end else begin
      changeStatus;
    end;

    if not CanDo then Close;
end;

procedure TMainForm.FormShow(Sender: TObject);
begin
  tryToConnection;
end;

procedure TMainForm.sync;
var
  str : string;
  syn : TSynchronize;
  url : string;
begin
  syn := TSynchronize.Create;
  try
    syn.setMySqlConnectionString(MySqlConnectionString);
    syn.setMsSqlConnectionString(MsSqlConnectionString);
    syn.synchronizeOrderTable;
    syn.synchronizeUserTable;
  finally
    syn.Free;
  end;
  url := 'http://localhost/moduleworkflow/sync/ExecEveryDay.aspx?command=';
  str := url+'statisticsbigschedule';
  WebBrowser1.Navigate(str);
  Sleep (600000);
  str := url+'systemschedule';
  WebBrowser1.Navigate(str);
end;

procedure TMainForm.SendMail;
var
  AFromEmail,AToEmail,ACCEmail,ABCCEmail,ASubject: string;
begin
  AFromEmail := 'sendmail_test123@yahoo.com.cn';
  AToEmail := 'jeasonwang@gmail.com';
  ACCEmail := '';
  ABCCEmail := '';
  ASubject := 'Test Sub';
  with EmailContent do
  begin
    Lines.Clear;
    Lines.Add('<html><body><a href="#">test</a></body></html>');
  end;
  send(AFromEmail,AToEmail,ACCEmail,ABCCEmail,ASubject);
end;

procedure TMainForm.sendmailWithCSharp;
var
  str, url : string;
begin
  url := 'http://localhost/moduleworkflow/sync/ExecEveryDay.aspx?command=';
  str := url+'sendmail';
  WebBrowser1.Navigate(str);
end;

end.

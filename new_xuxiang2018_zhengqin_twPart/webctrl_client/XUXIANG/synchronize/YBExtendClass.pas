unit YBExtendClass;

interface

uses
  YBBasicInterface, YBBasicClass, ADODB, SysUtils;

type
  TEmployees = class(TInterfacedObject,IEmployee)
    private
      EmplID   : String;
      Name     : String;
      CardNO   : String;
      DeptID   : Integer;
      ShiftID  : Integer;
      DelEmplIDList : String;
    public
      procedure setEmplID(AEmplID : String);
      procedure setName(AName : String);
      procedure setCardNO(ACardNO : String);
      procedure setDeptID(ADeptID : Integer);
      procedure setShiftID(AShiftID : Integer);
      procedure setDelEmplIDList(ADelEmplIDList : String);
      procedure transferEmplInfor(QueryConn, ExecConn : TADOQuery; IsDelete: Boolean);
  end;

  TShifts = class(TInterfacedObject,IShift)
    private
      ShiftID : Integer;
      Name : String;
      StartTime : TDateTime;
      EndTime : TDateTime;
      WorkHours : Integer;
      BreakHours : Integer;
      DelShiftIDList : String;
    public
      procedure setShiftID(AShiftID : Integer);
      procedure setName(AName : String);
      procedure setStartTime(AStartTime : TDateTime);
      procedure setEndTime(AEndTime : TDateTime);
      procedure setBreakHours(ABreakHours : Integer);
      procedure setWorkHours(AWorkHours : integer); overload;
      procedure setWorkHours; overload;

      procedure setDelShiftIDList(ADelShiftIDList : String);
      procedure transferShiftInfor(QueryConn, ExecConn : TADOQuery; IsDelete: Boolean);
  end;

  TBreakTimes = class(TInterfacedObject,IBreakTime)
    private
      ShiftID : Integer;
      StartTime : TDateTime;
      EndTime : TDateTime;
      BreakHours : Integer;
      DelBreakTimeList : String;
    public
      procedure setShiftID(AShiftID : Integer);
      procedure setStartTime(AStartTime : TDateTime);
      procedure setEndTime(AEndTime : TDateTime);
      procedure setBreakHours(ABreakHours : Integer); overload;
      procedure setBreakHours; overload;
      procedure setDelBreakTimeList(ADelBreakTimeList : String);
      procedure transferBreakTimeInfor(QueryConn, ExecConn : TADOQuery; IsDelete: Boolean);
  end;

  TWorkHours = class(TInterfacedObject,IWorkHour)
    private
      EmplID : String;
      ShiftID : Integer;
      CurrentDate : TDateTime;
      StartTime : TDateTime;
      EndTime : TDateTime;
      NormalWorkHours : Integer;
      LeaveWorkHours : Integer;
      OverWorkHours : Integer;
      UnLegalScan : Shortint;
    public
      procedure setEmplID(AEmplID : String);
      procedure setShiftID(AShiftID : Integer);
      procedure setCurrentDate(ACurrentDate : TDateTime);
      procedure setStartTime(AStartTime : TDateTime);
      procedure setEndTime(AEndTime : TDateTime);
      procedure setNormalWorkHours(ANormalWorkHours : Integer);
      procedure setOverWorkHours(AOverWorkHours : Integer);
      procedure setLeaveWorkHours(ALeaveWorkHours : Integer);
      procedure setUnLegalScan(AUnLegalScan : Shortint);
      procedure transferWorkHourInfor(QueryConn, ExecConn : TADOQuery);
  end;

implementation

{ TShifts }

procedure TShifts.setBreakHours(ABreakHours: Integer);
begin
  BreakHours := ABreakHours;
end;

procedure TShifts.setDelShiftIDList(ADelShiftIDList: String);
begin
  DelShiftIDList := ADelShiftIDList;
end;

procedure TShifts.setEndTime(AEndTime: TDateTime);
begin
  EndTime := AEndTime;
end;

procedure TShifts.setName(AName: String);
begin
  Name := AName;
end;

procedure TShifts.setShiftID(AShiftID: Integer);
begin
  ShiftID := AShiftID;
end;

procedure TShifts.setStartTime(AStartTime: TDateTime);
begin
  StartTime := AStartTime;
end;

procedure TShifts.setWorkHours(AWorkHours: integer);
begin
  WorkHours := AWorkHours;
end;

procedure TShifts.setWorkHours;
var
  sHour,sMin,sSec,sMSec,eHour,eMin,eSec,eMSec : word;
begin
  DecodeTime(StartTime,sHour,sMin,sSec,sMSec);
  DecodeTime(EndTime,eHour,eMin,eSec,eMSec);
  if sHour <= eHour then
    WorkHours := (eHour - sHour) * 60 +(eMin-sMin)
  else
    WorkHours := (eHour + 24 - sHour) * 60 +(eMin-sMin);
    
  WorkHours := WorkHours - BreakHours;
end;

procedure TShifts.transferShiftInfor(QueryConn, ExecConn : TADOQuery; IsDelete: Boolean);
var
  strsql : String;
begin
  if ExecConn.Active = true then ExecConn.Active := false;
  if not IsDelete then
  begin
    //insert or update record
    if QueryConn.Active = true then QueryConn.Active := false;
    QueryConn.SQL.Text := 'select * from shift where shiftid='+IntToStr(ShiftID);
    QueryConn.Open ;

    if QueryConn.Eof then
      strsql := 'insert into `shift` (ShiftID,Name,StartTime,EndTime,WorkHours) values (' +
                ''+IntToStr(ShiftID)+','+
                ''''+Name+''','+
                ''''+FormatDateTime('hh:mm:ss', StartTime)+''','+
                ''''+FormatDateTime('hh:mm:ss', EndTime)+''','+
                ''+IntToStr(WorkHours)+')'
    else
      strsql := 'update `shift` set '+
                'Name='''+Name+''','+
                'StartTime='''+FormatDateTime('hh:mm:ss', StartTime)+''','+
                'EndTime='''+FormatDateTime('hh:mm:ss', EndTime)+''','+
                'WorkHours='+IntToStr(WorkHours)+' '+
                'where ShiftID='+IntToStr(ShiftID)+'';
  end else
    //delete record
    strsql := 'delete from `shift` where ShiftID not in ('+DelShiftIDList+')';

  ExecConn.SQL.Text := strsql;
  ExecConn.ExecSQL ;
  QueryConn.Active := false ;
  ExecConn.Active := false ;
end;

{ TEmployees }

procedure TEmployees.setCardNO(ACardNO: String);
begin
  CardNO := ACardNO;
end;

procedure TEmployees.setDelEmplIDList(ADelEmplIDList: String);
begin
  DelEmplIDList := ADelEmplIDList;
end;

procedure TEmployees.setDeptID(ADeptID: Integer);
begin
  DeptID := ADeptID;
end;

procedure TEmployees.setEmplID(AEmplID: String);
begin
  EmplID := AEmplID;
end;

procedure TEmployees.setName(AName: String);
begin
  Name := AName;
end;

procedure TEmployees.setShiftID(AShiftID: Integer);
begin
  ShiftID := AShiftID;
end;

procedure TEmployees.transferEmplInfor(QueryConn, ExecConn: TADOQuery;
  IsDelete: Boolean);
var
  strsql : String;
begin
  if ExecConn.Active = true then ExecConn.Active := false;
  if not IsDelete then
  begin
    //insert or update record
    if QueryConn.Active = true then QueryConn.Active := false;
    QueryConn.SQL.Text := 'select * from `user` where username='''+EmplID+'''';
    QueryConn.Open ;

    if QueryConn.Eof then
      strsql := 'insert into `user` (username,tchinese_name,card_id,departmentid,shiftid) values (' +
                ''''+EmplID+''','+
                ''''+Name+''','+
                ''''+CardNO+''','+
                ''+IntToStr(DeptID)+','+
                ''+IntToStr(ShiftID)+')'
    else
      strsql := 'update `user` set '+
                //'tchinese_name='''+Name+''','+
                'card_id='''+CardNO+''','+
                'shiftid='+IntToStr(ShiftID)+' '+
                'where username='''+EmplID+'''';
  end else
    //delete record
    strsql := 'delete from `user` where username not in ('+DelEmplIDList+')';

  ExecConn.SQL.Text := strsql;
  ExecConn.ExecSQL ;
  QueryConn.Active := false ;
  ExecConn.Active := false ;
end;

{ TBreakTime }

procedure TBreakTimes.setBreakHours;
var
  sHour,sMin,sSec,sMSec,eHour,eMin,eSec,eMSec : word;
begin
  DecodeTime(StartTime,sHour,sMin,sSec,sMSec);
  DecodeTime(EndTime,eHour,eMin,eSec,eMSec);
  if sHour <= eHour then
    BreakHours := (eHour - sHour) * 60 +(eMin-sMin)
  else
    BreakHours := (eHour + 24 - sHour) * 60 +(eMin-sMin);
end;

procedure TBreakTimes.setBreakHours(ABreakHours: Integer);
begin
  BreakHours := ABreakHours;
end;

procedure TBreakTimes.setDelBreakTimeList(ADelBreakTimeList: String);
begin
  DelBreakTimeList := ADelBreakTimeList;
end;

procedure TBreakTimes.setEndTime(AEndTime: TDateTime);
begin
  EndTime := AEndTime;
end;

procedure TBreakTimes.setShiftID(AShiftID: Integer);
begin
  ShiftID := AShiftID;
end;

procedure TBreakTimes.setStartTime(AStartTime: TDateTime);
begin
  StartTime := AStartTime;
end;

procedure TBreakTimes.transferBreakTimeInfor(QueryConn, ExecConn: TADOQuery;
  IsDelete: Boolean);
var
  strsql : String;
begin
  if ExecConn.Active = true then ExecConn.Active := false;
  if not IsDelete then
  begin
    //insert or update record
    if QueryConn.Active = true then QueryConn.Active := false;
    QueryConn.SQL.Text := 'select * from breaktime where shiftid='+IntToStr(ShiftID)+' and starttime='''+FormatDateTime('hh:mm:ss', StartTime)+'''';
    QueryConn.Open ;

    if QueryConn.Eof then
      strsql := 'insert into breaktime (ShiftID,StartTime,EndTime,BreakHours) values (' +
                ''+IntToStr(ShiftID)+','+
                ''''+FormatDateTime('hh:mm:ss', StartTime)+''','+
                ''''+FormatDateTime('hh:mm:ss', EndTime)+''','+
                ''+IntToStr(BreakHours)+')'
    else
      strsql := 'update breaktime set '+
                'EndTime='''+FormatDateTime('hh:mm:ss', EndTime)+''','+
                'BreakHours='+IntToStr(BreakHours)+' '+
                'where ShiftID='+IntToStr(ShiftID)+' and starttime='''+FormatDateTime('hh:mm:ss', StartTime)+'''';
  end else
    //delete record
    strsql := 'delete from breaktime where not ('+DelBreakTimeList+')';

  ExecConn.SQL.Text := strsql;
  ExecConn.ExecSQL ;
  QueryConn.Active := false ;
  ExecConn.Active := false ;
end;

{ TWorkHours }

procedure TWorkHours.setCurrentDate(ACurrentDate: TDateTime);
begin
  CurrentDate := ACurrentDate;
end;

procedure TWorkHours.setEmplID(AEmplID: String);
begin
  EmplID := AEmplID;
end;

procedure TWorkHours.setEndTime(AEndTime: TDateTime);
begin
  EndTime := AEndTime;
end;

procedure TWorkHours.setLeaveWorkHours(ALeaveWorkHours: Integer);
begin
  LeaveWorkHours := ALeaveWorkHours;
end;

procedure TWorkHours.setNormalWorkHours(ANormalWorkHours: Integer);
begin
  NormalWorkHours := ANormalWorkHours;
end;

procedure TWorkHours.setOverWorkHours(AOverWorkHours: Integer);
begin
  OverWorkHours := AOverWorkHours;
end;

procedure TWorkHours.setShiftID(AShiftID: Integer);
begin
  ShiftID := AShiftID;
end;

procedure TWorkHours.setStartTime(AStartTime: TDateTime);
begin
  StartTime := AStartTime;
end;

procedure TWorkHours.setUnLegalScan(AUnLegalScan: Shortint);
begin
  UnLegalScan := AUnLegalScan;
end;

procedure TWorkHours.transferWorkHourInfor(QueryConn, ExecConn: TADOQuery);
var
  strsql : String;
begin
  if ExecConn.Active = true then ExecConn.Active := false;
  if QueryConn.Active = true then QueryConn.Active := false;
  QueryConn.SQL.Text := 'select * from worktime where username='''+EmplID+''' and currentdate='''+FormatDateTime('yyyy-mm-dd', CurrentDate)+'''';
  QueryConn.Open ;

  if QueryConn.Eof then
    strsql := 'insert into worktime (username,ShiftID,currentdate,StartTime,EndTime,normalworkhours,overworkhours,leaveworkhours,unlegalscan) values (' +
              ''''+EmplID+''','+
              ''+IntToStr(ShiftID)+','+
              ''''+FormatDateTime('yyyy-mm-dd', CurrentDate)+''','+
              ''''+FormatDateTime('yyyy-mm-dd hh:mm:ss', StartTime)+''','+
              ''''+FormatDateTime('yyyy-mm-dd hh:mm:ss', EndTime)+''','+
              ''+IntToStr(NormalWorkHours)+','+
              ''+IntToStr(OverWorkHours)+','+
              ''+IntToStr(LeaveWorkHours)+','+
              ''+IntToStr(UnLegalScan)+')'
  else
    strsql := 'update worktime set '+
              'ShiftID='+IntToStr(ShiftID)+','+
              'StartTime='''+FormatDateTime('yyyy-mm-dd hh:mm:ss', StartTime)+''','+
              'EndTime='''+FormatDateTime('yyyy-mm-dd hh:mm:ss', EndTime)+''','+
              'NormalWorkHours='+IntToStr(NormalWorkHours)+','+
              'OverWorkHours='+IntToStr(OverWorkHours)+','+
              'LeaveWorkHours='+IntToStr(LeaveWorkHours)+','+
              'UnLegalScan='+IntToStr(UnLegalScan)+' '+
              'where username='''+EmplID+''' and currentdate='''+FormatDateTime('yyyy-mm-dd', CurrentDate)+'''';

  ExecConn.SQL.Text := strsql;
  ExecConn.ExecSQL ;
  QueryConn.Active := false ;
  ExecConn.Active := false ;
end;

end.

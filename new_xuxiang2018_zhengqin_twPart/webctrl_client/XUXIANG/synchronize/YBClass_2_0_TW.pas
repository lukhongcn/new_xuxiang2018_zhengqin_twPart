unit YBClass_2_0_TW;

interface

uses
  YBBasicInterface, YBBasicClass, ADODB, SysUtils, forms, dateUtils, classes;

type
  TTransferation_version_2_0_TW = class(TObject)
    private
      MySqlConnectionString : String;
      MsSqlConnectionString : String;
    public
      procedure setMySqlConnectionString(AMySqlConnectionString : String);
      procedure setMsSqlConnectionString(AMsSqlConnectionString : String);
      procedure updateEmployeeList;
      procedure updateShiftList;
      procedure updateBreakTimeList;
      procedure updateWorkTimeList(ACurrentDate : TDateTime);
  end;

implementation

uses YBMain, CVCode, YBExtendClass, unLib, YBClass_2_0_DG_WorkTime;

{ TTransferation_version_2_0_TW }

procedure TTransferation_version_2_0_TW.setMsSqlConnectionString(
  AMsSqlConnectionString : String);
begin
  MsSqlConnectionString := AMsSqlConnectionString;
end;

procedure TTransferation_version_2_0_TW.setMySqlConnectionString(
  AMySqlConnectionString: String);
begin
  MySqlConnectionString := AMySqlConnectionString;
end;

procedure TTransferation_version_2_0_TW.updateBreakTimeList;
var
  min, max, i, j, location : integer;
  CBreakTime : TBreakTimes;
  DelBreakTimeList : String;

  ShiftID : Integer;
  BreakTimeStartTime, BreakTimeEndTime : TDateTime;
  CurStartTime, CurEndTime : TDateTime;
begin
  with YBMain.MainForm do
  begin
    displayInfo('update user shift to Mysql...');
    application.ProcessMessages ;

    if ADOQuerySelect.Active then ADOQuerySelect.Active := false;
    ADOQuerySelect.ConnectionString := MsSqlConnectionString;
    ADOQuerySelect.SQL.Text := 'SELECT * FROM shift where shiftcross = 0';
    ADOQuerySelect.Open ;

    if ADOQueryExec.Active then ADOQueryExec.Active := false;
    ADOQueryExec.ConnectionString := mySqlConnectionString;
    if ADOQueryInner.Active then ADOQueryInner.Active := false;
    ADOQueryInner.ConnectionString := mySqlConnectionString;

    CBreakTime := TBreakTimes.Create ;
    DelBreakTimeList := '';
    try
      with ADOQuerySelect do
      begin
        first;
        min := 0 ;
        max := RecordCount;
        GBreakTime.MinValue := 0;
        GBreakTime.MaxValue := max;
        GBreakTime.Progress := 0;
        if max > 0 then
          for i := min to max-1 do
          begin
            CBreakTime.setShiftID(FieldByName('ShiftID').AsInteger);
            CBreakTime.setStartTime(FieldByName('RestStime').AsDateTime);
            CBreakTime.setEndTime(IncMinute(FieldByName('RestStime').AsDateTime,FieldByName('RestMinute').AsInteger));
            CBreakTime.setBreakHours;
            CBreakTime.transferBreakTimeInfor(ADOQueryInner,ADOQueryExec,false);
            DelBreakTimeList := DelBreakTimeList + '(shiftID='+FieldByName('ShiftID').AsString+' and StartTime='''+FormatDateTime('hh:mm:ss',FieldByName('RestStime').AsDateTime)+''') or';
            GBreakTime.AddProgress(1);
            Application.ProcessMessages ;
            Next;
          end;
      end;
    except
      displayInfo('Import shiftcross=0 data failed.');
    end;

    //deal with shiftcross = 1
    if ADOQuerySelect.Active then ADOQuerySelect.Active := false;
    ADOQuerySelect.SQL.Text := 'SELECT * FROM shift where shiftcross = 1';
    ADOQuerySelect.Open ;

    try
      with ADOQuerySelect do
      begin
        min := 0 ;
        max := RecordCount;
        location := 0;
        if max > 0 then
          for i := min to max-1 do
          begin
            first;
            moveBy(location);
            ShiftID := FieldByName('ShiftID').AsInteger;
            BreakTimeStartTime := FieldByName('RestStime').AsDateTime;
            BreakTimeEndTime := IncMinute(FieldByName('RestStime').AsDateTime,FieldByName('RestMinute').AsInteger);

            CBreakTime.setShiftID(ShiftID);
            CBreakTime.setStartTime(BreakTimeStartTime);
            CBreakTime.setEndTime(BreakTimeEndTime);
            CBreakTime.setBreakHours;
            CBreakTime.transferBreakTimeInfor(ADOQueryInner,ADOQueryExec,false);
            DelBreakTimeList := DelBreakTimeList + '(shiftID='+IntToStr(ShiftID)+' and StartTime='''+FormatDateTime('hh:mm:ss',FieldByName('RestStime').AsDateTime)+''') or';
            Application.ProcessMessages ;

            CurStartTime := FieldByName('StartTime').AsDateTime;
            CurEndTime := FieldByName('EndTime').AsDateTime;

            for j := min to max-1 do
            begin
              first;
              moveBy(j);
              BreakTimeStartTime := FieldByName('RestStime').AsDateTime;
              BreakTimeEndTime := IncMinute(FieldByName('RestStime').AsDateTime,FieldByName('RestMinute').AsInteger);

              if (location <> j) and
                 (((CurStartTime < BreakTimeStartTime) and (CurEndTime > BreakTimeStartTime)) or
                 ((CurStartTime < BreakTimeStartTime) and (CurEndTime < CurStartTime)) or
                 ((CurEndTime > BreakTimeStartTime) and (CurEndTime < CurStartTime))) then
              begin
                CBreakTime.setShiftID(ShiftID);
                CBreakTime.setStartTime(BreakTimeStartTime);
                CBreakTime.setEndTime(BreakTimeEndTime);
                CBreakTime.setBreakHours;
                CBreakTime.transferBreakTimeInfor(ADOQueryInner,ADOQueryExec,false);
                DelBreakTimeList := DelBreakTimeList + '(shiftID='+IntToStr(ShiftID)+' and StartTime='''+FormatDateTime('hh:mm:ss',FieldByName('RestStime').AsDateTime)+''') or';
              end;
            end;
            location := location + 1;
          end;

          //delete extral shift records
          if DelBreakTimeList <> '' then
          begin
            DelBreakTimeList := copy(DelBreakTimeList,1,length(DelBreakTimeList)-3);
            CBreakTime.setDelBreakTimeList(DelBreakTimeList);
            CBreakTime.transferBreakTimeInfor(ADOQueryInner,ADOQueryExec,false);
          end;

        displayInfo('Import Data successfully! Update '+ intToStr(max) +' records!');
        GBreakTime.Progress := 0;
      end;
    except
      displayInfo('Import shiftcross=1 data failed.');
    end;

    ADOQueryExec.Active := false;
    ADOQuerySelect.Active := false;
    CBreakTime.Free;
  end;
end;

procedure TTransferation_version_2_0_TW.updateEmployeeList;
var
  min, max, i : integer;
  CEmployee : TEmployees;
  DelEmployeeList : String;
begin
  with YBMain.MainForm do
  begin
    displayInfo('update user information to Mysql...');
    application.ProcessMessages ;

    if ADOQuerySelect.Active then ADOQuerySelect.Active := false;
    ADOQuerySelect.ConnectionString := MsSqlConnectionString;
    ADOQuerySelect.SQL.Text := 'SELECT MV001,MV002 FROM CMSMV ';
    ADOQuerySelect.Open ;

    if ADOQueryExec.Active then ADOQueryExec.Active := false;
    ADOQueryExec.ConnectionString := mySqlConnectionString;
    if ADOQueryInner.Active then ADOQueryInner.Active := false;
    ADOQueryInner.ConnectionString := mySqlConnectionString;

    CEmployee := TEmployees.Create ;
    DelEmployeeList := '';
    try
      with ADOQuerySelect do
      begin
        first;
        min := 0 ;
        max := RecordCount;
        GUser.MinValue := 0;
        GUser.MaxValue := max;
        GUser.Progress := 0;
        if max > 0 then
          for i := min to max-1 do
          begin
            CEmployee.setEmplID(FixData(FieldByName('MV001').AsString));
            CEmployee.setName(FieldByName('MV002').AsString);
            CEmployee.setCardNO(FieldByName('MV001').AsString);
            //CEmployee.setDeptID(FieldByName('DepartId').AsString);
            CEmployee.setDeptID(19);
            CEmployee.setShiftID(1);
            CEmployee.transferEmplInfor(ADOQueryInner,ADOQueryExec,false);
            DelEmployeeList := DelEmployeeList +''''+ FixData(FieldByName('MV001').AsString) + ''',';
            GUser.AddProgress(1);
            Application.ProcessMessages ;
            Next;
          end;

          //delete extral shift records
          if DelEmployeeList <> '' then
          begin
            DelEmployeeList := DelEmployeeList + '''admin''';
            CEmployee.setDelEmplIDList(DelEmployeeList);
            CEmployee.transferEmplInfor(ADOQueryInner,ADOQueryExec,true);
          end;

        displayInfo('Import Data successfully! Update '+ intToStr(max) +' records!');
        GUser.Progress := 0;
      end;
    except
      displayInfo('Import data failed.');
    end;
    ADOQueryExec.Active := false;
    ADOQuerySelect.Active := false;
    CEmployee.Free;
  end;
end;

procedure TTransferation_version_2_0_TW.updateShiftList;
var
  min, max, i : integer;
  CShift : TShifts;
  DelShiftList : String;
begin
  with YBMain.MainForm do
  begin
    displayInfo('update user shift to Mysql...');
    application.ProcessMessages ;

    if ADOQuerySelect.Active then ADOQuerySelect.Active := false;
    ADOQuerySelect.ConnectionString := MsSqlConnectionString;
    ADOQuerySelect.SQL.Text := 'SELECT MK001,MK002,MK003,MK004 FROM PALMK ';
    ADOQuerySelect.Open ;

    if ADOQueryExec.Active then ADOQueryExec.Active := false;
    ADOQueryExec.ConnectionString := mySqlConnectionString;
    if ADOQueryInner.Active then ADOQueryInner.Active := false;
    ADOQueryInner.ConnectionString := mySqlConnectionString;

    CShift := TShifts.Create ;
    DelShiftList := '';
    try
      with ADOQuerySelect do
      begin
        first;
        min := 0 ;
        max := RecordCount;
        GShift.MinValue := 0;
        GShift.MaxValue := max;
        GShift.Progress := 0;
        if max > 0 then
          for i := min to max-1 do
          begin
            ADOQueryInner.Close ;
            ADOQueryInner.SQL.Text := 'SELECT sum(breakhours) as workhours from breaktime where shiftid='+FieldByName('ShiftID').AsString;
            ADOQueryInner.Open ;
            
            CShift.setShiftID(FieldByName('ShiftID').AsInteger);
            CShift.setName(FieldByName('ShiftName').AsString);
            CShift.setStartTime(FieldByName('StartTime').AsDateTime);
            CShift.setEndTime(FieldByName('EndTime').AsDateTime);

            if not (ADOQueryInner.Eof and ADOQueryInner.Bof) then
              CShift.setBreakHours(ADOQueryInner.FieldByName('workhours').AsInteger)
            else
              CShift.setBreakHours(0);
            CShift.setWorkHours;

            CShift.transferShiftInfor(ADOQueryInner,ADOQueryExec,false);
            DelShiftList := DelShiftList + FieldByName('ShiftID').AsString + ',';
            GShift.AddProgress(1);
            Application.ProcessMessages ;
            Next;
          end;

          //delete extral shift records
          if DelShiftList <> '' then
          begin
            DelShiftList := copy(DelShiftList,1,length(DelShiftList)-1);
            CShift.setDelShiftIDList(DelShiftList);
            CShift.transferShiftInfor(ADOQueryInner,ADOQueryExec,true);
          end;

        displayInfo('Import Data successfully! Update '+ intToStr(max) +' records!');
        GShift.Progress := 0;
      end;
    except
      displayInfo('Import data failed.');
    end;
    ADOQueryExec.Active := false;
    ADOQuerySelect.Active := false;
    CShift.Free;
  end;
end;

procedure TTransferation_version_2_0_TW.updateWorkTimeList(ACurrentDate : TDateTime);
var
  i : integer;
  CWorkHour : TWorkHours;
  vWorkTimeList : TStringList;
  vTimeList : TStringList;

  EmplID : String;
  ShiftID : Integer;
  CurrentDate : TDateTime;
  StartTime : TDateTime;
  EndTime : TDateTime;
  NormalWorkHours : Integer;
  LeaveWorkHours : Integer;
  OverWorkHours : Integer;
  UnLegalScan : Shortint;

  wYear,wMonth,wDay, wHours,wMins,wSecs,wSSecs : Word;
  LeaveStartTime,LeaveEndTime : TDateTime;
  NormalStartTime,NormalEndTime : TDateTime;
  NormalBreakStartTime,NormalBreakEndTime : TDateTime;
  EmpWorkHours : TEmplWorkHours;

  ShiftCode : String;
begin
  with YBMain.MainForm do begin
    CurrentDate := ACurrentDate;
    i := 0;
    displayInfo('update user workhours to Mysql...');
    if ADOQuerySelect.Active then ADOQuerySelect.Active := false;
    ADOQuerySelect.ConnectionString := MsSqlConnectionString;

    if ADOQueryEmpl.Active then ADOQueryEmpl.Active := false;
    ADOQueryEmpl.ConnectionString := MsSqlConnectionString;
    ADOQueryEmpl.SQL.Text := 'SELECT emp_id FROM emp where dept_code=''09'' ';
    ADOQueryEmpl.Open ;

    if ADOQueryExec.Active then ADOQueryExec.Active := false;
    ADOQueryExec.ConnectionString := mySqlConnectionString;
    if ADOQueryInner.Active then ADOQueryInner.Active := false;
    ADOQueryInner.ConnectionString := mySqlConnectionString;

    CWorkHour := TWorkHours.Create ;
    vWorkTimeList := TStringList.Create ;
    vTimeList := TStringList.Create ;
    try
      while not ADOQueryEmpl.Eof do begin
        EmplID := ADOQueryEmpl.fieldByName('emp_id').AsString ;
        ADOQuerySelect.Close ;
        ADOQuerySelect.SQL.Text := 'select emp_id,kq_date,shouldintime,shouldouttime,factintime,factouttime,time_class_code,time_group_code from Kq_detail where kq_date='''+FormatDateTime('yyyy-mm-dd',CurrentDate)+''' and emp_id='''+EmplID+''' order by shouldintime asc';
        ADOQuerySelect.Open ;

        if not(ADOQuerySelect.Eof and ADOQuerySelect.Bof) then begin
          ShiftCode := ADOQuerySelect.FieldByName('time_group_code').AsString;
          // find starttime
          StartTime := 0;

          while not ADOQuerySelect.Eof do begin
            if ADOQuerySelect.FieldByName('factintime').AsDateTime <> 0 then begin
              StartTime := ADOQuerySelect.FieldByName('factintime').AsDateTime;
              break;
            end else begin
              if ADOQuerySelect.FieldByName('factouttime').AsDateTime <> 0 then begin
                StartTime := ADOQuerySelect.FieldByName('factouttime').AsDateTime;
                break;
              end;
            end;
            ADOQuerySelect.Next;
          end;

          // get end time
          EndTime := 0;
          ADOQuerySelect.Last;
          while not ADOQuerySelect.bof do begin
            if ADOQuerySelect.FieldByName('factouttime').AsDateTime <> 0 then begin
              EndTime := ADOQuerySelect.FieldByName('factouttime').AsDateTime;
              break;
            end else begin
              if ADOQuerySelect.FieldByName('factintime').AsDateTime <> 0 then begin
                EndTime := ADOQuerySelect.FieldByName('factintime').AsDateTime;
                break;
              end;
            end;
            ADOQuerySelect.Prior;
          end;

          //judge shift id
          ADOQuerySelect.First;
          decodetime(ADOQuerySelect.fieldbyName('shouldintime').AsDateTime,wHours,wMins,wSecs,wSSecs);
          if (wHours*60 +wMins) > (9*60) then begin // night
            shiftID := 2;
          end else begin // day
            shiftID := 1;
          end;
          if (EndTime = 0) or (StartTime = 0) then begin
            NormalWorkHours := 480;
            LeaveWorkHours  := 480;
            OverWorkHours   := 0;
            UnLegalScan := 1;
          end else begin
            if shiftID = 1 then begin
              DeCodeDate(ACurrentDate,wYear,wMonth,wDay);
              NormalStartTime := EnCodeDateTime(wYear,wMonth,wDay,7,30,0,0);
              NormalEndTime := EnCodeDateTime(wYear,wMonth,wDay,17,30,0,0);
              NormalBreakStartTime := EnCodeDateTime(wYear,wMonth,wDay,11,3,0,0);
              NormalBreakEndTime := EnCodeDateTime(wYear,wMonth,wDay,13,0,0,0);
              if (ShiftCode = '05') OR (ShiftCode = '06') then begin
                DeCodeDate(ACurrentDate,wYear,wMonth,wDay);
                NormalStartTime := EnCodeDateTime(wYear,wMonth,wDay,8,0,0,0);
                NormalEndTime := EnCodeDateTime(wYear,wMonth,wDay,15,30,0,0);
                NormalBreakStartTime := EnCodeDateTime(wYear,wMonth,wDay,12,0,0,0);
                NormalBreakEndTime := EnCodeDateTime(wYear,wMonth,wDay,13,0,0,0);
              end;
            end else begin
              DeCodeDate(ACurrentDate,wYear,wMonth,wDay);
              NormalStartTime := EnCodeDateTime(wYear,wMonth,wDay,17,30,0,0);
              NormalBreakStartTime := EnCodeDateTime(wYear,wMonth,wDay,23,30,0,0);

              DeCodeDate(IncDay(ACurrentDate),wYear,wMonth,wDay);
              NormalEndTime := EnCodeDateTime(wYear,wMonth,wDay,4,0,0,0);
              NormalBreakEndTime := EnCodeDateTime(wYear,wMonth,wDay,0,0,0,0);
            end;

            //judge there has leavetime reocord
            ADOQuerySelect.Close ;
            ADOQuerySelect.SQL.Text := 'select * from absent where emp_id='''+EmplID+''' and '+
            '((start_date_time >= '''+formatDateTime('yyyy-mm-dd',ACurrentDate)+' 07:30:00'' and start_date_time <= '''+formatDateTime('yyyy-mm-dd',ACurrentDate)+' 17:30:00'') or '+
            ' (end_date_time   >= '''+formatDateTime('yyyy-mm-dd',ACurrentDate)+' 07:30:00'' and end_date_time   <= '''+formatDateTime('yyyy-mm-dd',ACurrentDate)+' 17:30:00'') or '+
            ' (start_date_time <= '''+formatDateTime('yyyy-mm-dd',ACurrentDate)+' 07:30:00'' and end_date_time   >= '''+formatDateTime('yyyy-mm-dd',ACurrentDate)+' 17:30:00'')) ';
            ADOQuerySelect.Open ;
            if not(ADOQuerySelect.Eof and ADOQuerySelect.Bof) then begin
              LeaveStartTime := ADOQuerySelect.fieldByName('start_date_time').AsDateTime;
              LeaveEndTime   := ADOQuerySelect.fieldByName('end_date_time').AsDateTime;
              LeaveWorkHours := LeaveTimeLength(LeaveStartTime,LeaveEndTime,NormalStartTime,NormalEndTime);
            end else begin
              LeaveWorkHours := 0;
            end;

            if LeaveWorkHours <> 0 then begin
              NormalWorkHours := 480;
              if shiftID = 1 then begin
                OverWorkHours := DecrementDateTime(EndTime,NormalEndTime) - 45 + 60;
              end else begin
                OverWorkHours := DecrementDateTime(EndTime,NormalEndTime);
              end;
              OverWorkHours   := OverWorkHours - (OverWorkHours mod 30);
              if (OverWorkHours < 0) then OverWorkHours := 0;
            end else begin
              EmpWorkHours := TEmplWorkHours.Create;
              try
                with EmpWorkHours do begin
                  setStartTime(StartTime);
                  setEndTime(EndTime);
                  setNormalStartTime(NormalStartTime);
                  setNormalEndTime(NormalEndTime);
                  setBreakStartTime(NormalBreakStartTime);
                  setBreakEndTime(NormalBreakEndTime);
                  setIsDay(shiftID=1);
                  calculateWorkHours();
                  NormalWorkHours := getNormalWorkHours();
                  OverWorkHours := getOverWorkHours();
                end;
              finally
                EmpWorkHours.Free;
              end;
            end;

            //end;
            UnLegalScan := 0;
          end;

          // judge the current day is the weekend
          if DayOfTheWeek(ACurrentDate) = 7 then
          begin
            shiftID := 0;
          end;
        end; //~ if not(ADOQuerySelect.Eof and ADOQuerySelect.Bof)

        CWorkHour.setEmplID(FixData(EmplID));
        CWorkHour.setShiftID(ShiftID);
        CWorkHour.setCurrentDate(CurrentDate);
        CWorkHour.setStartTime(StartTime);
        CWorkHour.setEndTime(EndTime);
        if ShiftID = 0 then
        begin
          CWorkHour.setNormalWorkHours(0);
          CWorkHour.setLeaveWorkHours(0);
          CWorkHour.setOverWorkHours(OverWorkHours+NormalWorkHours);
        end else begin
          CWorkHour.setNormalWorkHours(NormalWorkHours);
          CWorkHour.setLeaveWorkHours(LeaveWorkHours);
          CWorkHour.setOverWorkHours(OverWorkHours);
        end;
        CWorkHour.setUnLegalScan(UnlegalScan);
        CWorkHour.transferWorkHourInfor(ADOQueryInner,ADOQueryExec);

        ADOQueryEmpl.Next ;
        i := i + 1;
        application.ProcessMessages ;
        displayInfo('Import Data successfully! update '+IntToStr(i)+' data!');
      end;
    except
      displayInfo('Import data failed.');
    end;
    ADOQueryExec.Active := false;
    ADOQuerySelect.Active := false;
    CWorkHour.Free;
    vWorkTimeList.Free ;
    vTimeList.Free ;
  end;
end;

end.

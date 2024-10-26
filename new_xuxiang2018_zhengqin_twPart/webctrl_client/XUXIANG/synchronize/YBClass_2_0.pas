unit YBClass_2_0;

interface

uses
  YBBasicInterface, YBBasicClass, ADODB, SysUtils, forms, dateUtils, classes;

type
  TTransferation_version_2_0 = class(TObject)
    private
      MySqlConnectionString : String;
      AccessConnectionString : String;
    public
      procedure setMySqlConnectionString(AMySqlConnectionString : String);
      procedure setAccessConnectionString(AAccessConnectionString : String);
      procedure updateEmployeeList;
      procedure updateShiftList;
      procedure updateBreakTimeList;
      procedure updateWorkTimeList(ACurrentDate : TDateTime);
  end;

implementation

uses YBMain, CVCode, YBExtendClass, unLib;

{ TTransferation_version_2_0 }

procedure TTransferation_version_2_0.setAccessConnectionString(
  AAccessConnectionString: String);
begin
  AccessConnectionString := AAccessConnectionString;
end;

procedure TTransferation_version_2_0.setMySqlConnectionString(
  AMySqlConnectionString: String);
begin
  MySqlConnectionString := AMySqlConnectionString;
end;

procedure TTransferation_version_2_0.updateBreakTimeList;
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
    ADOQuerySelect.ConnectionString := AccessConnectionString;
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

procedure TTransferation_version_2_0.updateEmployeeList;
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
    ADOQuerySelect.ConnectionString := AccessConnectionString;
    ADOQuerySelect.SQL.Text := 'SELECT * FROM Employee ';
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
            CEmployee.setEmplID(FieldByName('EmployeeID').AsString);
            CEmployee.setName(GBtoBIG5(FieldByName('Name').AsString));
            CEmployee.setCardNO(FieldByName('CardNO').AsString);
            //CEmployee.setDeptID(FieldByName('DepartId').AsString);
            CEmployee.setDeptID(19);
            CEmployee.setShiftID(1);
            CEmployee.transferEmplInfor(ADOQueryInner,ADOQueryExec,false);
            DelEmployeeList := DelEmployeeList +''''+ FieldByName('EmployeeID').AsString + ''',';
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

procedure TTransferation_version_2_0.updateShiftList;
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
    ADOQuerySelect.ConnectionString := AccessConnectionString;
    ADOQuerySelect.SQL.Text := 'SELECT * FROM shift ';
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
            CShift.setName(GBtoBIG5(FieldByName('ShiftName').AsString));
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

procedure TTransferation_version_2_0.updateWorkTimeList(ACurrentDate : TDateTime);
var
  i : integer;
  CWorkHour : TWorkHours;
  MonthID : Integer;
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

begin
  with YBMain.MainForm do
  begin
    CurrentDate := ACurrentDate;
    MonthID := 0;
    i := 0;
    displayInfo('update user workhours to Mysql...');
    if ADOQuerySelect.Active then ADOQuerySelect.Active := false;
    ADOQuerySelect.ConnectionString := AccessConnectionString;
    ADOQuerySelect.SQL.Text := 'Select MonthID from KqMonth where SDate <=#'+FormatDateTime('yyyy-mm-dd',CurrentDate)+'# and EDate>=#'+FormatDateTime('yyyy-mm-dd',CurrentDate)+'#';
    ADOQuerySelect.Open ;
    if not(ADOQuerySelect.Eof and ADOQuerySelect.Bof) then MonthID := ADOQuerySelect.fieldByName('MonthID').AsInteger ;

    if ADOQueryEmpl.Active then ADOQueryEmpl.Active := false;
    ADOQueryEmpl.ConnectionString := AccessConnectionString;
    ADOQueryEmpl.SQL.Text := 'SELECT employeeid FROM employee ';
    ADOQueryEmpl.Open ;

    if ADOQueryExec.Active then ADOQueryExec.Active := false;
    ADOQueryExec.ConnectionString := mySqlConnectionString;
    if ADOQueryInner.Active then ADOQueryInner.Active := false;
    ADOQueryInner.ConnectionString := mySqlConnectionString;

    CWorkHour := TWorkHours.Create ;
    vWorkTimeList := TStringList.Create ;
    vTimeList := TStringList.Create ;
    try
      while (not ADOQueryEmpl.Eof) and (MonthID<>0) do
      begin
        EmplID := ADOQueryEmpl.fieldByName('employeeid').AsString ;
        ADOQuerySelect.Close ;
        ADOQuerySelect.SQL.Text := 'select * from KqResult'+IntTostr(MonthID)+' where ArrDate=#'+FormatDateTime('yyyy-mm-dd',CurrentDate)+'# and EmployeeID='''+EmplID+'''';
        ADOQuerySelect.Open ;

        if not(ADOQuerySelect.Eof and ADOQuerySelect.Bof) then
        begin
          shiftID := ADOQuerySelect.FieldByName('Shift').AsInteger ;
          ADOQueryInner.Close ;
          ADOQueryInner.SQL.Text := 'select * from shift where shiftid='+IntToStr(shiftID);
          ADOQueryInner.Open ;

          NormalWorkHours := ADOQueryInner.FieldByName('WorkHours').AsInteger ;
          OverWorkHours   := Trunc(ADOQuerySelect.FieldByName('OverHour').AsFloat * 60);
          LeaveWorkHours  := NormalWorkHours - Trunc(ADOQuerySelect.FieldByName('WorkHour').AsFloat * 60);

          Split(ADOQuerySelect.FieldByName('CheckDetail').AsString,'\',vWorkTimeList,true);
          if (vWorkTimeList.Count mod 2 = 0) and (vWorkTimeList.Count <> 0) then
          begin
            Split(vWorkTimeList.Strings[0],':',vTimeList,true);
            StartTime := EncodeTime(StrToInt(vTimeList.Strings[0]),StrToInt(vTimeList.Strings[1]),0,0);
            Split(vWorkTimeList.Strings[vWorkTimeList.Count-1],':',vTimeList,true);
            EndTime := EncodeTime(StrToInt(vTimeList.Strings[0]),StrToInt(vTimeList.Strings[1]),0,0);

            UnLegalScan := 0;
          end else begin
            if (vWorkTimeList.Count = 0) then
            begin
              //No card time
              StartTime := EncodeTime(0,0,0,0);
              EndTime := EncodeTime(0,0,0,0);

              UnLegalScan := 1;
            end else begin
              if (vWorkTimeList.Count = 1) then
              begin
                //card time in 1 time
                Split(vWorkTimeList.Strings[0],':',vTimeList,true);
                StartTime := EncodeTime(StrToInt(vTimeList.Strings[0]),StrToInt(vTimeList.Strings[1]),0,0);
                EndTime := EncodeTime(0,0,0,0);

                UnLegalScan := 2;
              end else begin
                //card time in 3 times or 5 eg.
                Split(vWorkTimeList.Strings[vWorkTimeList.Count-2],':',vTimeList,true);
                StartTime := EncodeTime(StrToInt(vTimeList.Strings[0]),StrToInt(vTimeList.Strings[1]),0,0);
                Split(vWorkTimeList.Strings[vWorkTimeList.Count-1],':',vTimeList,true);
                EndTime := EncodeTime(StrToInt(vTimeList.Strings[0]),StrToInt(vTimeList.Strings[1]),0,0);

                UnLegalScan := 3;
              end;
            end; //~ if (vWorkTimeList.Count = 0)

          end; //~ if (vWorkTimeList.Count mod 2 = 0) and (vWorkTimeList.Count <> 0)
        end else begin
          // no record in access db
          ShiftID := 1;
          StartTime := EncodeTime(0,0,0,0);
          EndTime := EncodeTime(0,0,0,0);
          NormalWorkHours := 480;
          LeaveWorkHours := 480;
          OverWorkHours := 0;
          UnLegalScan := 4;
        end; //~ if not(ADOQuerySelect.Eof and ADOQuerySelect.Bof)

        CWorkHour.setEmplID(EmplID);
        CWorkHour.setShiftID(ShiftID);
        CWorkHour.setCurrentDate(CurrentDate);
        CWorkHour.setStartTime(StartTime);
        CWorkHour.setEndTime(EndTime);
        if (ShiftID = 0) or (ShiftID = 7) or (ShiftID = 8) then
        begin
          CWorkHour.setNormalWorkHours(0);
          CWorkHour.setLeaveWorkHours(0);
          CWorkHour.setOverWorkHours(OverWorkHours);
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

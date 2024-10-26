unit YBBasicClass;

interface
type

  TShift = class(TObject)
    private
      ShiftID : Integer;
      Name : String;
      StartTime : TDateTime;
      EndTime : TDateTime;
      WorkHours : single;
      BreakHours : single;
    public
      constructor Create;
      procedure setShiftID(AShiftID : Integer);
      procedure setName(AName : String);
      procedure setStartTime(AStartTime : TDateTime);
      procedure setEndTime(AEndTime : TDateTime);
      procedure setWorkHours(AWorkHours : single);
      procedure setBreakHours(ABreakHours : single);
      function getShiftID : Integer;
      function getName : String;
      function getStartTime : TDateTime;
      function getEndTime : TDateTime;
      function getWorkHours : single;
      function getBreakHours : single;
  end;

  TBreakTime = class(TObject)
    private
      //BreakID : Integer;
      ShiftID : Integer;
      StartTime : TDateTime;
      EndTime : TDateTime;
      BreakHours : single;
    public
      constructor Create;
      //procedure setBreakID(ABreakID : Integer);
      procedure setShiftID(AShiftID : Integer);
      procedure setStartTime(AStartTime : TDateTime);
      procedure setEndTime(AEndTime : TDateTime);
      procedure setBreakHours(ABreakHours : single);
      //function getBreakID : Integer;
      function getShiftID : Integer;
      function getStartTime : TDateTime;
      function getEndTime : TDateTime;
      function getBreakHours : single;
  end;

  TWorkHour = class(TObject)
    private
      EmplID : String;
      ShiftID : Integer;
      CurrentDate : TDateTime;
      StartTime : TDateTime;
      EndTime : TDateTime;
      NormalWorkHours : Integer;
      LeaveWorkHours : Integer;
      OverWorkHours : Integer;
      UnLegalScan : Boolean;
    public
      constructor Create;
      procedure setEmplID(AEmplID : String);
      procedure setShiftID(AShiftID : Integer);
      procedure setCurrentDate(ACurrentDate : TDateTime);
      procedure setStartTime(AStartTime : TDateTime);
      procedure setEndTime(AEndTime : TDateTime);
      procedure setNormalWorkHours(ANormalWorkHours : Integer);
      procedure setOverWorkHours(AOverWorkHours : Integer);
      procedure setLeaveWorkHours(ALeaveWorkHours : Integer);
      procedure setUnLegalScan(AUnLegalScan : Boolean);
      function getEmplID : String;
      function getShiftID : Integer;
      function getCurrentDate : TDateTime;
      function getStartTime : TDateTime;
      function getEndTime : TDateTime;
      function getNormalWorkHours : Single;
      function getOverWorkHours : Single;
      function getLeaveWorkHours : Single;
      function getUnLegalScan : Boolean;
  end;

  TEmployee = class(TObject)
    private
      EmplID : String;
      Name : String;
      CardNO : String;
      DeptID : Integer;
      ShiftID : Integer;
    public
      constructor Create;
      procedure setEmplID(AEmplID : String);
      procedure setName(AName : String);
      procedure setCardNO(ACardNO : String);
      procedure setDeptID(ADeptID : Integer);
      procedure setShiftID(AShiftID : Integer);
      function getEmplID : String;
      function getName : String;
      function getDeptID : Integer;
      function getShiftID : Integer;
  end;

implementation

{ TShift }

constructor TShift.Create;
begin
  ShiftID    := -1;
  Name       := '';
  StartTime  := 0;
  EndTime    := 0;
  WorkHours  := 0;
  BreakHours := 0;
end;

function TShift.getBreakHours: single;
begin
  result := BreakHours;
end;

function TShift.getEndTime: TDateTime;
begin
  result := EndTime;
end;

function TShift.getName: String;
begin
  result := Name;
end;

function TShift.getShiftID: Integer;
begin
  result := ShiftID;
end;

function TShift.getStartTime: TDateTime;
begin
  result := StartTime;
end;

function TShift.getWorkHours: single;
begin
  result := WorkHours;
end;

procedure TShift.setBreakHours(ABreakHours: single);
begin
  BreakHours := ABreakHours;
end;

procedure TShift.setEndTime(AEndTime: TDateTime);
begin
  EndTime :=AEndTime;
end;

procedure TShift.setName(AName: String);
begin
  Name := AName;
end;

procedure TShift.setShiftID(AShiftID: Integer);
begin
  ShiftID := AShiftID;
end;

procedure TShift.setStartTime(AStartTime: TDateTime);
begin
  StartTime := AStartTime;
end;

procedure TShift.setWorkHours(AWorkHours: single);
begin
  WorkHours := AWorkHours;
end;

{ TBreakTime }

constructor TBreakTime.Create;
begin
  ShiftID    := -1;
  StartTime  := 0;
  EndTime    := 0;
  BreakHours := 0;
end;

function TBreakTime.getBreakHours: single;
begin
  result := BreakHours;
end;

function TBreakTime.getEndTime: TDateTime;
begin
  result := EndTime;
end;

function TBreakTime.getShiftID: Integer;
begin
  result := ShiftID;
end;

function TBreakTime.getStartTime: TDateTime;
begin
  result := StartTime;
end;

procedure TBreakTime.setBreakHours(ABreakHours: single);
begin
  BreakHours := ABreakHours;
end;

procedure TBreakTime.setEndTime(AEndTime: TDateTime);
begin
  EndTime := AEndTime;
end;

procedure TBreakTime.setShiftID(AShiftID: Integer);
begin
  ShiftID := AShiftID;
end;

procedure TBreakTime.setStartTime(AStartTime: TDateTime);
begin
  StartTime := AStartTime;
end;

{ TWorkHour }

constructor TWorkHour.Create;
begin
  EmplID          := '';
  ShiftID         := -1;
  CurrentDate     := 0;
  StartTime       := 0;
  EndTime         := 0;
  NormalWorkHours := 0;
  LeaveWorkHours  := 0;
  OverWorkHours   := 0;
  UnLegalScan     := false;
end;

function TWorkHour.getCurrentDate: TDateTime;
begin
  result := CurrentDate;
end;

function TWorkHour.getEmplID: String;
begin
  result := EmplID;
end;

function TWorkHour.getEndTime: TDateTime;
begin
  result := EndTime;
end;

function TWorkHour.getLeaveWorkHours: Single;
begin
  result := LeaveWorkHours;
end;

function TWorkHour.getNormalWorkHours: Single;
begin
  result := NormalWorkHours;
end;

function TWorkHour.getOverWorkHours: Single;
begin
  result := OverWorkHours;
end;

function TWorkHour.getShiftID: Integer;
begin
  result := ShiftID;
end;

function TWorkHour.getStartTime: TDateTime;
begin
  result := StartTime;
end;

function TWorkHour.getUnLegalScan: Boolean;
begin
  result := UnLegalScan;
end;

procedure TWorkHour.setCurrentDate(ACurrentDate: TDateTime);
begin
  CurrentDate := ACurrentDate;
end;

procedure TWorkHour.setEmplID(AEmplID: String);
begin
  EmplID := AEmplID;
end;

procedure TWorkHour.setEndTime(AEndTime: TDateTime);
begin
  EndTime := AEndTime;
end;

procedure TWorkHour.setLeaveWorkHours(ALeaveWorkHours: Integer);
begin
  LeaveWorkHours := ALeaveWorkHours;
end;

procedure TWorkHour.setNormalWorkHours(ANormalWorkHours: Integer);
begin
  NormalWorkHours := ANormalWorkHours;
end;

procedure TWorkHour.setOverWorkHours(AOverWorkHours: Integer);
begin
  OverWorkHours := AOverWorkHours;
end;

procedure TWorkHour.setShiftID(AShiftID: Integer);
begin
  ShiftID := AShiftID;
end;

procedure TWorkHour.setStartTime(AStartTime: TDateTime);
begin
  StartTime := AStartTime;
end;

procedure TWorkHour.setUnLegalScan(AUnLegalScan: Boolean);
begin
  UnLegalScan := AUnLegalScan;
end;

{ TEmployee }

constructor TEmployee.Create;
begin
  EmplID  := '';
  Name    := '';
  DeptID  := -1;
  ShiftID := -1;
end;

function TEmployee.getDeptID: Integer;
begin
  result := DeptID;
end;

function TEmployee.getEmplID: String;
begin
  result := EmplID;
end;

function TEmployee.getName: String;
begin
  result := Name;
end;

function TEmployee.getShiftID: Integer;
begin
  result := ShiftID;
end;

procedure TEmployee.setCardNO(ACardNO: String);
begin
  CardNO := ACardNO;
end;

procedure TEmployee.setDeptID(ADeptID: Integer);
begin
  DeptID := ADeptID;
end;

procedure TEmployee.setEmplID(AEmplID: String);
begin
  EmplID := AEmplID;
end;

procedure TEmployee.setName(AName: String);
begin
  Name := AName;
end;

procedure TEmployee.setShiftID(AShiftID: Integer);
begin
  ShiftID := AShiftID;
end;

end.

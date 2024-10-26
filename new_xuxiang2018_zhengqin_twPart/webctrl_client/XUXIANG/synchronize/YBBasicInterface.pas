unit YBBasicInterface;

interface

uses YBBasicClass, ADODB;

type
  IEmployee = interface(IUnknown)
    procedure setEmplID(AEmplID : String);
    procedure setName(AName : String);
    procedure setCardNO(ACardNO : String);
    procedure setDeptID(ADeptID : Integer);
    procedure setShiftID(AShiftID : Integer);
    procedure transferEmplInfor(QueryConn, ExecConn : TADOQuery; IsDelete: Boolean);
  end;

  IShift = interface(IUnknown)
    procedure setShiftID(AShiftID : Integer);
    procedure setName(AName : String);
    procedure setStartTime(AStartTime : TDateTime);
    procedure setEndTime(AEndTime : TDateTime);
    procedure setWorkHours(AWorkHours : Integer);
    procedure setBreakHours(ABreakHours : Integer);
    procedure transferShiftInfor(QueryConn, ExecConn : TADOQuery; IsDelete: Boolean);
  end;

  IBreakTime = interface(Iunknown)
      //procedure setBreakID(ABreakID : Integer);
      procedure setShiftID(AShiftID : Integer);
      procedure setStartTime(AStartTime : TDateTime);
      procedure setEndTime(AEndTime : TDateTime);
      procedure setBreakHours(ABreakHours : Integer);
    procedure transferBreakTimeInfor(QueryConn, ExecConn : TADOQuery; IsDelete: Boolean);
  end;

  IWorkHour = interface(IUnknown)
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

end.

unit YBClass_2_0_DG_WorkTime;

interface
type
  TEmplWorkHours = class(TObject)
  private
    StartTime : TDateTime;
    EndTime : TDateTime;
    NormalStartTime : TDateTime;
    NormalEndTime : TDateTime;
    BreakStartTime : TDateTime;
    BreakEndTime : TDateTime;
    IsDay : Boolean;
    NormalWorkHours : Integer;
    OverWorkHours : Integer;

    procedure outOfNormalTime();
    procedure innerOfNormalTime();
    procedure leftOfNormalTime();
    procedure rightOfNormalTime();
  public
    procedure setStartTime(AStartTime : TDateTime);
    procedure setEndTime(AEndTime : TDateTime);
    procedure setNormalStartTime(ANormalStartTime : TDateTime);
    procedure setNormalEndTime(ANormalEndTime : TDateTime);
    procedure setBreakStartTime(ABreakStartTime : TDateTime);
    procedure setBreakEndTime(ABreakEndTime : TDateTime);
    procedure SetIsDay(AIsDay: Boolean);

    function getNormalWorkHours() : Integer;
    function getOverWorkHours() : Integer;

    procedure calculateWorkHours();
  end;
implementation

uses unLib;

{ TWorkHours }

procedure TEmplWorkHours.setBreakEndTime(ABreakEndTime: TDateTime);
begin
  BreakEndTime := ABreakEndTime;
end;

procedure TEmplWorkHours.setBreakStartTime(ABreakStartTime: TDateTime);
begin
  BreakStartTime := ABreakStartTime;
end;

procedure TEmplWorkHours.setEndTime(AEndTime: TDateTime);
begin
  EndTime := AEndTime;
end;

procedure TEmplWorkHours.SetIsDay(AIsDay: Boolean);
begin
  IsDay := AIsDay;
end;

procedure TEmplWorkHours.setNormalEndTime(ANormalEndTime: TDateTime);
begin
  NormalEndTime := ANormalEndTime;
end;

procedure TEmplWorkHours.setNormalStartTime(ANormalStartTime: TDateTime);
begin
  NormalStartTime := ANormalStartTime;
end;

function TEmplWorkHours.getNormalWorkHours() : Integer;
begin
  result := NormalWorkHours ;
end;

function TEmplWorkHours.getOverWorkHours() : Integer;
begin
  result := OverWorkHours;
end;

procedure TEmplWorkHours.setStartTime(AStartTime: TDateTime);
begin
  StartTime := AStartTime;
end;


procedure TEmplWorkHours.calculateWorkHours;
begin
  if (StartTime <= NormalStartTime) AND (EndTime >= NormalEndTime) then begin
    // go to 1 out
    outOfNormalTime;
  end else begin
    if (StartTime > NormalStartTime) AND (EndTime < NormalEndTime) then begin
      // go to 2  inner
      innerOfNormalTime;
    end else begin
      if (StartTime > NormalStartTime) then begin
        // go to 3 left in score
        leftOfNormalTime;
      end else begin
        // go to 4 right in score
        rightOfNormalTime;
      end;
    end;
  end; 
end;

procedure TEmplWorkHours.innerOfNormalTime;
begin
  OverWorkHours := 0;

  if StartTime < BreakStartTime then begin
    if EndTime < BreakStartTime then begin
      NormalWorkHOurs := DecrementDateTime(EndTime,StartTime);
    end else begin
      if (EndTime >= BreakStartTime) AND (EndTime <= BreakEndTime) then begin
        NormalWorkHOurs := DecrementDateTime(BreakStartTime,StartTime);
      end else begin
        if IsDay then begin
          NormalWorkHOurs := DecrementDateTime(EndTime,StartTime)-60;
        end else begin
          NormalWorkHOurs := DecrementDateTime(EndTime,StartTime)-30;
        end;
      end;
    end;
  end else begin
    if (StartTime >= BreakStartTime) AND (StartTime <= BreakEndTime) then begin
      NormalWorkHOurs := DecrementDateTime(EndTime,BreakEndTime);
    end else begin
      // StartTime > BreakEndTime and StartTime < NormalEndTime
      NormalWorkHOurs := DecrementDateTime(EndTime,StartTime);
    end;
  end;

  NormalWorkHOurs := NormalWorkHOurs - (NormalWorkHOurs mod 30);

  if NormalWorkHOurs < 0 then NormalWorkHOurs := 0;
end;

procedure TEmplWorkHours.leftOfNormalTime;
begin
  if (StartTime < BreakStartTime) then begin
    if IsDay then begin
      NormalWorkHOurs := DecrementDateTime(NormalEndTime,StartTime) - 60 - 60;
      OverWorkHours   := DecrementDateTime(EndTime,NormalEndTime) - 45 + 60;
    end else begin
      NormalWorkHOurs := DecrementDateTime(NormalEndTime,StartTime) - 30;
      OverWorkHours   := DecrementDateTime(EndTime,NormalEndTime);
    end;
  end else begin
    if (StartTime >= BreakStartTime) AND (StartTime <= BreakEndTime) then begin
      if IsDay then begin
        NormalWorkHOurs := 240;
        OverWorkHours   := DecrementDateTime(EndTime,NormalEndTime) - 45 + 60;
      end else begin
        NormalWorkHOurs := 240;
        OverWorkHours   := DecrementDateTime(EndTime,NormalEndTime);
      end;
    end else begin
      // starttime > breakendtime and starttime < normalendtime
      if IsDay then begin
        NormalWorkHOurs := DecrementDateTime(NormalEndTime,StartTime) - 60;
        OverWorkHours   := DecrementDateTime(EndTime,NormalEndTime) - 45 + 60;
      end else begin
        NormalWorkHOurs := DecrementDateTime(NormalEndTime,StartTime);
        OverWorkHours   := DecrementDateTime(EndTime,NormalEndTime);
      end;
    end; ///~~ if (StartTime >= BreakStartTime) AND (StartTime <= BreakEndTime)
  end; ///~~ if (StartTime < BreakStartTime)

  NormalWorkHOurs := NormalWorkHOurs - (NormalWorkHOurs mod 30);
  OverWorkHours   := OverWorkHours - (OverWorkHours mod 30);

  if NormalWorkHOurs < 0 then NormalWorkHOurs := 0;
  if OverWorkHours < 0 then OverWorkHours := 0;
end;

procedure TEmplWorkHours.outOfNormalTime;
begin
  NormalWorkHours := 480;
  if IsDay then begin
    OverWorkHours := DecrementDateTime(EndTime,NormalEndTime) - 45 + 60;
  end else begin
    OverWorkHours := DecrementDateTime(EndTime,NormalEndTime);
  end;

  if OverWOrkHours < 0 then begin
    OverWorkHours := 0;
  end else begin
    OverWorkHours := OverWorkHours - (OverWorkHours mod 30);
  end;
end;

procedure TEmplWorkHours.rightOfNormalTime;
begin
  OverWorkHours := 0;

  if (EndTime > BreakEndTime) then begin
    if IsDay then begin
      NormalWorkHours := DecrementDateTime(EndTime,NormalStartTime) - 60;
      OverWorkHours := NormalWorkHours - 480;
      OverWorkHours := OverWorkHours - (OverWorkHours mod 30);
    end else begin
      NormalWorkHours := DecrementDateTime(EndTime,NormalStartTime) - 30;
    end;
  end else begin
    if (EndTime <= BreakEndTime) AND (EndTime >= BreakStartTime) then begin
      NormalWorkHours := 240;
    end else begin
      // EndTime < BreakStarTime and EndTime > NormalStartTime
      NormalWorkHours := DecrementDateTime(EndTime,NormalStartTime);
    end;
  end;
  NormalWorkHours := NormalWorkHours - (NormalWorkHours mod 30);
  if NormalWorkHours < 0 then NormalWorkHours := 0;
end;

end.

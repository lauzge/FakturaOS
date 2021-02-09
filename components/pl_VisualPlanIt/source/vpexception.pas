{**********************************************************************
 Package pl_VisualPlanIt
 is a modification of TurboPower Visual PlanIt Components Library
 For CodeTyphon Studio (https://www.pilotlogic.com/)
 This file is part of CodeTyphon Studio
***********************************************************************}

{$I vp.inc}

unit VpException;
  {Vp exceptions}

interface

uses
  LCLProc, LCLType,
  Classes, SysUtils, VpSR;

type
  {*** Base Vp exeption class ***}
  EVpException = class(Exception);

  EVpCodedException = class(Exception)
  public
    ErrorCode : LongInt;
  end;

  {*** Data Classes ***}
  EExclusiveEventConflict = class(EVpException)
  public
    constructor Create;
  end;

  EBackwardTimesError = class(EVpException)
  public
    constructor Create;
  end;

  EFailToCreateTask = class(EVpException)
  public
    constructor Create;
  end;

  EFailToCreateContact = class(EVpException)
  public
    constructor Create;
  end;

  EFailToCreateEvent = class(EVpException)
  public
    constructor Create;
  end;

  EFailToCreateResource = class(EVpException)
  public
    constructor Create;
  end;

  EDuplicateResource = class (EVpException)
    public
      constructor Create;
  end;

  EInvalidTable = class (EVpException)
    public
      constructor Create;
  end;

  {*** Timer Pool ***}
  ENoTimersAvailable = class(EVpException)
  public
    constructor Create;
  end;

  {*** DB Errors ***}
  EDBPostError = class(EVpException)
  public
    constructor Create;
  end;

  ETimerPoolError = class(EVpException);

  EInvalidTriggerHandle = class(ETimerPoolError)
  public
    constructor Create;
  end;

  EVpCanvasError = class (EVpException);

  EVpPrintFormatError = class (EVpException);

  EVpPrintPreviewError = class (EVpException);

  EVpDateException = class (EVpException);

  EVpContactEditError = class (EVpException);

  EVpDateEditError = class (EVpException);

  EVpCalendarError = class (EVpException);

  EVpPrintFormatEditorError = class (EVpException);

  EVpNoLocalizationFile = class (EVpException);                          

implementation

constructor ENoTimersAvailable.Create;
begin
  inherited Create(RSNoTimersAvail);
end;

constructor EDBPostError.Create;
begin
  inherited Create(RSDBPostError);
end;

constructor EInvalidTriggerHandle.Create;
begin
  inherited Create(RSBadTriggerHandle);
end;

constructor EExclusiveEventConflict.Create;
begin
  inherited Create(RSExclusiveEventConflict);
end;

constructor EBackwardTimesError.Create;
begin
  inherited Create(RSBackwardTimesError);
end;

constructor EFailToCreateTask.Create;
begin
  inherited Create(RSFailToCreateTask);
end;

constructor EFailToCreateContact.Create;
begin
  inherited Create(RSFailToCreateContact);
end;

constructor EFailToCreateEvent.Create;
begin
  inherited Create(RSFailToCreateEvent);
end;

constructor EFailToCreateResource.Create;
begin
  inherited Create(RSFailToCreateResource);
end;

constructor EDuplicateResource.Create;
begin
  inherited Create (RSDuplicateResource);
end;

constructor EInvalidTable.Create;
begin
  inherited Create (RSInvalidTableSpecified);
end;

end.

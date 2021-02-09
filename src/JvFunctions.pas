unit JvFunctions;

{$IFDEF FPC} {$MODE DELPHI} {$ENDIF}

interface

uses
  Windows, Classes, SysUtils, ShellApi;

//Open an object with the shell (url or something like that)
function OpenObject(Value: PChar): Boolean; overload;
function OpenObject(Value: string): Boolean; overload;
function OSCheck(RetVal: Boolean): Boolean;

implementation

function OpenObject(Value: string): Boolean;
begin
  Result := OpenObject(PChar(Value));
end;

function OpenObject(Value: PChar): Boolean;
begin
  Result := ShellExecute(0, 'open', Value, nil, nil, SW_SHOWNORMAL) > HINSTANCE_ERROR;
end;

function OSCheck(RetVal: Boolean): Boolean;
begin
  if not RetVal then
    RaiseLastOSError;
  Result := RetVal;
end;

end.


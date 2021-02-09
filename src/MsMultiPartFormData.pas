unit MsMultiPartFormData;

{$IFDEF FPC} {$MODE DELPHI} {$ENDIF}

interface

uses
  SysUtils, Classes;

const
  CONTENT_TYPE = 'multipart/form-data; boundary=';
  CRLF = #13#10;
  CONTENT_DISPOSITION = 'Content-Disposition: form-data; name="%s"';
  FILE_NAME_PLACE_HOLDER = '; filename="%s"';
  CONTENT_TYPE_PLACE_HOLDER = 'Content-Type: %s' + crlf + crlf;
  CONTENT_LENGTH = 'Content-Length: %d' + crlf;

type
  TMsMultiPartFormDataStream = class(TMemoryStream)
  private
    FBoundary: string;
    FRequestContentType: string;
    function GenerateUniqueBoundary: string;
  public
    procedure AddFormField(const FieldName, FieldValue: string);
    procedure AddFile(const FieldName, FileName, ContentType: string; FileData: TStream); overload;
    procedure AddFile(const FieldName, FileName, ContentType: string); overload;
    procedure PrepareStreamForDispatch;
    constructor Create;
    property Boundary: string read FBoundary;
    property RequestContentType: string read FRequestContentType;
  end;

implementation

{ TMsMultiPartFormDataStream }

constructor TMsMultiPartFormDataStream.Create;
begin
  inherited;
  FBoundary := GenerateUniqueBoundary;
  FRequestContentType := CONTENT_TYPE + FBoundary;
end;

procedure TMsMultiPartFormDataStream.AddFile(const FieldName, FileName,
  ContentType: string; FileData: TStream);
var
  sFormFieldInfo: string;
  Buffer: PChar;
  iSize: Int64;
begin
  iSize := FileData.Size;
  sFormFieldInfo := Format(CRLF + '--' + Boundary + CRLF + CONTENT_DISPOSITION +
    FILE_NAME_PLACE_HOLDER + CRLF + CONTENT_LENGTH +
      CONTENT_TYPE_PLACE_HOLDER, [FieldName, FileName, iSize, ContentType]);

  Write(Pointer(sFormFieldInfo)^, Length(sFormFieldInfo));
  FileData.Position := 0;
  GetMem(Buffer, iSize);
  try
    FileData.Read(Buffer^, iSize);
    Write(Buffer^, iSize);
  finally
    FreeMem(Buffer, iSize);
  end;
end;

procedure TMsMultiPartFormDataStream.AddFile(const FieldName, FileName,
  ContentType: string);
var
  FileStream: TFileStream;
begin
  FileStream := TFileStream.Create(FileName, fmOpenRead or fmShareDenyWrite);
  try
    AddFile(FieldName, FileName, ContentType, FileStream);
  finally
    FileStream.Free;
  end;
end;

procedure TMsMultiPartFormDataStream.AddFormField(const FieldName,
  FieldValue: string);
var
  sFormFieldInfo: string;
begin
  sFormFieldInfo := Format(CRLF + '--' + Boundary + CRLF + CONTENT_DISPOSITION + CRLF + CRLF +
    FieldValue, [FieldName]);
  Write(Pointer(sFormFieldInfo)^, Length(sFormFieldInfo));
end;

function TMsMultiPartFormDataStream.GenerateUniqueBoundary: string;
begin
  Result := '---------------------------' + FormatDateTime('mmddyyhhnnsszzz', Now);
end;

procedure TMsMultiPartFormDataStream.PrepareStreamForDispatch;
var
  sFormFieldInfo: string;
begin
  sFormFieldInfo := CRLF + '--' + Boundary + '--' + CRLF;
  Write(Pointer(sFormFieldInfo)^, Length(sFormFieldInfo));
  Position := 0;
end;

end.

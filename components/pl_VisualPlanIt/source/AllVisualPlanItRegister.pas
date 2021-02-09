{**********************************************************************
                PilotLogic Software House.
  
 Package pl_VisualPlanIt
 is a modification of TurboPower Visual PlanIt from PilotLogic 
 This file is part of CodeTyphon Studio (https://www.pilotlogic.com/)
***********************************************************************}

{$I Vp.INC}

unit AllVisualPlanItRegister;

interface

uses
  LCLProc, LCLType, LCLIntf, LazFileUtils,
  Dialogs,
  PropEdits, TyphonPackageIntf, FieldsEditor, ComponentEditors,
  Classes, Controls, TypInfo, Forms, SysUtils,
  VpDatePropEdit;

type

  TDBStringProperty = class(TStringProperty)
  public
    function GetAttributes: TPropertyAttributes; override;
    procedure GetValueList(List: TStrings); virtual;
    procedure GetValues(Proc: TGetStrProc); override;
  end;

  TVpDateProperty = class(TFloatProperty)
  public
    procedure Edit; override;
    function GetAttributes: TPropertyAttributes; override;
    function GetValue: string; override;
    procedure SetValue(const Value: string); override;
  end;

  TVpGeneralFileNameProperty = class(TStringProperty)
  protected
    function GetDefaultExt: string; virtual;
    function GetFilter: string; virtual;
    function GetInitialDir: string; virtual;
  public
    function GetAttributes: TPropertyAttributes; override;
    function GetValue: string; override;
    procedure Edit; override;
    procedure SetValue(const NewValue: string); override;
  end;

  TVpLocalizeFileNameProperty = class(TVpGeneralFileNameProperty)
  protected
    function GetDefaultExt: string; override;
    function GetFilter: string; override;
  end;

  TVpWavFilenameProperty = class(TVpGeneralFilenameProperty)
  protected
    function GetDefaultExt: string; override;
    function GetFilter: string; override;
    function GetInitialDir: string; override;
  end;


  TVpMediaFolderProperty = class(TStringProperty)
  public
    function GetAttributes: TPropertyAttributes; override;
    function GetValue: string; override;
    procedure Edit; override;
    procedure SetValue(const Value: string); override;
  end;

procedure Register;

implementation

{$R AllVisualPlanItRegister.res}

uses
  VpMisc,
  { Component Units                                                          }
  VpBase,                     { Base classes for Vp                          }
  VpClock,                    { Clock Component                              }
  VpDlg,                      { Dialog components ancestor                   }
  VpLEDLabel,                 { LEDLabel Component                           }
  VpCalendar,                 { Calendar Component                           }
  VpNavBar,                   { Navigation Bar Component                     }
  VpBaseDS,                   { Base DataStore Classes                       }
  VpDayView,                  { Day View Component                           }
  VpWeekView,                 { Week View Component                          }
  VpMonthView,                { Month View Component                         }
  VpContactGrid,              { ContactGrid Component                        }
  VpTaskList,                 { Task List Component                          }
  vpeventrpt,
  vpsqlds,
  VpIniDS,                    { IniFile datastore                            }
  VpXmlDS,                    { XML file datastore                           }
  VpBufDS,                    { Datastore for TBufDataset                    }
  VpFBDS,                     { Datastore for Firebird database              }
  VpSqlite3DS,                { Datastore for sqlite3                        }
  VpZeosDS,                   { Datastore for ZEOS                           }
  VpCaoDS,                    { Datastore for ZEOS                           }
  // VpSdfDS                     { Datastore for TSdfDataset                    }
  // VpDbfDS,                    { Datastore for dbase files                    }
  VpDateEdit,
  VpFlxDS,                    { Flexible DataStore                           }
  VpContactEditDlg,           { Contact Edit Dialog Component                }
  VpTaskEditDlg,              { Task Edit Dialog Component                   }
  VpEvntEditDlg,              { Event Edit Dialog Component                  }
  VpCaoTaskEditDlg,           { Task Edit Dialog Component                   }
  VpCaoEvntEditDlg,           { Event Edit Dialog Component                  }
  VpAlarmDlg,                 { Alarm Notification Dialog                    }
  VpResEditDlg,               { Resource Edit Dialog                         }
  VpPrtPrv,                   { Print Preview Component                      }
  VpPrtFmtCBox,               { Print Format Combo Box Component             }
  VpPrtPrvDlg,                { Print Preview Dialog                         }
  VpPrtFmtDlg,                { Print Format Dialog                          }
  VpPrtFmtEd,                 { Print Format Property editor                 }
  VpContactButtons,           { - New contact grid button bar component }
  { Designtime Interfaces (Property and Component Editors)                   }
  VpFlxDSEd1;                 { Field mapper component editor for the FlexDS }


(*****************************************************************************)
{ TDBStringProperty }

function TDBStringProperty.GetAttributes: TPropertyAttributes;
begin
  Result := [paValueList, paSortList, paMultiSelect];
end;


procedure TDBStringProperty.GetValueList(List: TStrings);
begin
  Unused(List);
end;


procedure TDBStringProperty.GetValues(Proc: TGetStrProc);
var
  I: integer;
  Values: TStringList;
begin
  Values := TStringList.Create;
  try
    GetValueList(Values);
    for I := 0 to Values.Count - 1 do
      Proc(Values[I]);
  finally
    Values.Free;
  end;
end;

(*****************************************************************************)
{ TVpDateProperty }
procedure TVpDateProperty.Edit;
var
  frmDatePropertyEditor: TfrmDatePropertyEditor;
begin
  frmDatePropertyEditor := TfrmDatePropertyEditor.Create(Application);
  try
    frmDatePropertyEditor.VpCalendar1.Date := GetFloatValue;
    if frmDatePropertyEditor.Execute then
      SetFloatValue(Trunc(frmDatePropertyEditor.VpCalendar1.Date));
  finally
    frmDatePropertyEditor.Free;
  end;
end;


function TVpDateProperty.GetAttributes: TPropertyAttributes;
begin
  Result := [paDialog, paMultiSelect];
end;


function TVpDateProperty.GetValue: string;
begin
  Result := FormatDateTime('ddddd', GetFloatValue);
end;


procedure TVpDateProperty.SetValue(const Value: string);
begin
  SetFloatValue(StrToDate(Value));
end;


(*****************************************************************************)
{ TVpGeneralFileNameProperty }

function TVpGeneralFileNameProperty.GetAttributes: TPropertyAttributes;
begin
  Result := [paDialog];
end;

procedure TVpGeneralFileNameProperty.Edit;
var
  dlg: TOpenDialog;
begin
  dlg := TOpenDialog.Create(Application);
  try
    dlg.DefaultExt := GetDefaultExt;
    dlg.Filter := GetFilter;
    dlg.FilterIndex := 1;
    dlg.InitialDir := GetForcedPathDelims(GetInitialDir);
    dlg.Options := [ofHideReadOnly];
    dlg.Filename := GetValue;
    if dlg.Execute then
      SetValue(dlg.Filename);
  finally
    dlg.Free;
  end;
end;

function TVpGeneralFilenameProperty.GetDefaultExt: string;
begin
  Result := '*.*';
end;

function TVpGeneralFilenameProperty.GetFilter: string;
begin
  Result := 'All files (*.*)|*.*';
end;

function TVpGeneralFilenameProperty.GetInitialDir: string;
var
  filename: string;
begin
  filename := GetValue;
  if filename <> '' then
    Result := ExtractFileDir(filename)
  else
    Result := '';
end;

function TVpGeneralFileNameProperty.GetValue: string;
begin
  Result := GetStrValue;
end;

procedure TVpGeneralFilenameProperty.SetValue(const NewValue: string);
begin
  SetStrValue(NewValue);
end;


{ TVpLocalizeFilenameProperty }

function TVpLocalizeFilenameProperty.GetDefaultExt: string;
begin
  Result := '*.xml';
end;

function TVpLocalizeFilenameProperty.GetFilter: string;
begin
  Result := 'Localization files (*.xml)|*.xml|' + inherited;
end;

{ TVpWavFilenameProperty }

function TVpWavFilenameProperty.GetDefaultExt: string;
begin
  Result := '*.wav';
end;

function TVpWavFilenameProperty.GetFilter: string;
begin
  Result := 'Wav files (*.wav)|*.wav|All files (*.*)|*.*';
end;

function TVpWavFilenameProperty.GetInitialDir: string;
var
  ds: TVpCustomDatastore;
begin
  ds := GetComponent(0) as TVpCustomDatastore;
  if Assigned(ds) then
  begin
    if ds.DefaultEventSound = '' then
      Result := ds.MediaFolder
    else
      Result := ExtractFilePath(ds.DefaultEventSound);
    Result := GetForcedPathDelims(Result);
  end
  else
    Result := '';
end;


{ TVpMediaFolderProperty }

function TVpMediaFolderProperty.GetAttributes: TPropertyAttributes;
begin
  Result := [paDialog];
end;

function TVpMediaFolderProperty.GetValue: string;
begin
  Result := GetStrValue;
end;

procedure TVpMediaFolderProperty.SetValue(const Value: string);
begin
  SetStrValue(Value);
end;

procedure TVpMediaFolderProperty.Edit;
var
  dlg: TSelectDirectoryDialog;
  ds: TVpCustomDatastore;
begin
  ds := GetComponent(0) as TVpCustomDatastore;
  if Assigned(ds) then
  begin
    dlg := TSelectDirectoryDialog.Create(nil);
    try
      dlg.Filter := 'Wav files (*.wav)|*.wav|All files (*.*)|*.*';
      dlg.FilterIndex := 1;
      dlg.DefaultExt := '*.wav';
      if ds.MediaFolder <> '' then
        dlg.InitialDir := ds.MediaFolder
      else
        dlg.InitialDir := ExtractFilePath(ds.DefaultEventSound);
      if dlg.Execute then
        ds.DefaultEventSound := dlg.FileName;
    finally
      dlg.Free;
    end;
  end
  else
    inherited;
end;

procedure Register;
begin

  {register Visual PlanIt components with the IDE}
  RegisterComponents('Visual PlanIt', [TVpLEDLabel,
                                       TVpClock,
                                       TVpCalendar,
                                       TVpNavBar,
                                       TVpControlLink,
                                       TVpPrintPreview,
                                       TVpPrintFormatComboBox,
                                       TVpDateEdit,
                                       TVpResourceCombo,
                                       TVpDayView,
                                       TVpWeekView,
                                       TVpMonthView,
                                       TVpContactGrid,    
                                       TVpTaskList,    
                                       TVpEventReport,
                                       TVpContactButtonBar,

                                       TVpNotificationDialog,
                                       TVpResourceEditDialog,
                                       TVpEventEditDialog,
                                       TVpContactEditDialog,
                                       TVpTaskEditDialog,
                                       TVpPrintFormatEditDialog,
                                       TVpPrintPreviewDialog,

                                       TVpBufDSDatastore,  
                                       TVpIniDatastore,
                                       TVpXmlDatastore,
                                       TVpFlexDataStore,
                                       TVPSQLDataStore,
                                       TVpSqlite3Datastore,
                                       TVpFirebirdDatastore,
                                       TVpZeosDatastore]);




  RegisterComponentEditor(TVpControlLink, TVpPrtFmtPropertyEditor);
  RegisterComponentEditor(TVpFlexDataStore, TVpFlexDSEditor);


  RegisterPropertyEditor(TypeInfo(string), TVpCustomDatastore,
    'DefaultEventSound', TVpWavFilenameProperty);

  RegisterPropertyEditor(TypeInfo(string), TVpCustomDatastore,
    'MediaFolder', TVpMediaFolderProperty);

  RegisterPropertyEditor(TypeInfo(TDateTime), TVpPrintPreview,
    'StartDate', TVpDateProperty);

  RegisterPropertyEditor(TypeInfo(TDateTime), TVpPrintPreview,
    'EndDate', TVpDateProperty);

  RegisterPropertyEditor(TypeInfo(TDateTime), TVpPrintPreviewDialog,
    'StartDate', TVpDateProperty);

  RegisterPropertyEditor(TypeInfo(TDateTime), TVpPrintPreviewDialog,
    'EndDate', TVpDateProperty);

  RegisterPropertyEditor(TypeInfo(string), TVpControlLink,
    'LocalizationFile', TVpLocalizeFileNameProperty);
end;

end.

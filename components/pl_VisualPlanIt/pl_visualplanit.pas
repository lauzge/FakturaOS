{ This file was automatically created by Typhon IDE. Do not edit!
  This source is only used to compile and install the package.
 }

unit pl_VisualPlanIt;

{$warn 5023 off : no warning about unused units}
interface

uses
  AllVisualPlanItRegister, VpAlarmDlg, VpBase, VpBaseDS, VpBufDS, VpCalendar, 
  VpCanvasUtils, VpConst, VpContactButtons, VpContactEditDlg, VpContactGrid, 
  VpData, VpDateEdit, VpDatePropEdit, VpDayView, VpDBDS, VpDlg, VpEdElem, 
  VpEdFmt, VpEdPop, VpEdShape, VpEventRpt, VpEvntEditDlg, VpException, VpFBDS, 
  VpFlxDS, VpFlxDsEd1, VpIniDs, VpLEDLabel, VpLocalize, VpMisc, VpMonthView, 
  VpCaoDS, VpCaoEvntEditDlg, VpCaoTaskEditDlg, VpNabEd, VpNavBar, VpPrtFmt, 
  VpPrtFmtCBox, VpPrtFmtDlg, VpPrtFmtEd, VpPrtPrv, VpPrtPrvDlg, VpResEditDlg, 
  VpSelResDlg, VpSQLite3DS, VpSR, VpTaskEditDlg, VpTaskList, VpTimerPool, 
  VpWavDlg, VpWavPE, VpWeekView, VpXBase, VpXChrFlt, VpXmlDs, VpXParsr, 
  VpZeosDs, TyphonPackageIntf;

implementation

procedure Register;
begin
  RegisterUnit('AllVisualPlanItRegister', @AllVisualPlanItRegister.Register);
  RegisterUnit('VpCaoDS', @VpCaoDS.Register);
  RegisterUnit('VpCaoEvntEditDlg', @VpCaoEvntEditDlg.Register);
  RegisterUnit('VpCaoTaskEditDlg', @VpCaoTaskEditDlg.Register);
end;

initialization
  RegisterPackage('pl_VisualPlanIt', @Register);
end.

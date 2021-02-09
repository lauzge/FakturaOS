{ This file was automatically created by Typhon IDE. Do not edit!
  This source is only used to compile and install the package.
 }

unit VolgaPak;

{$warn 5023 off : no warning about unused units}
interface

uses
  VolPeriod, VolDBConst, VolCalend, VolDBEdit, VolCalc, TyphonPackageIntf;

implementation

procedure Register;
begin
  RegisterUnit('VolPeriod', @VolPeriod.Register);
  RegisterUnit('VolCalend', @VolCalend.Register);
  RegisterUnit('VolDBEdit', @VolDBEdit.Register);
end;

initialization
  RegisterPackage('VolgaPak', @Register);
end.

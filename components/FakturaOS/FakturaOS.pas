{ This file was automatically created by Typhon IDE. Do not edit!
  This source is only used to compile and install the package.
 }

unit FakturaOS;

{$warn 5023 off : no warning about unused units}
interface

uses
  CaoSecurity, EuroDMEdit, TyphonPackageIntf;

implementation

procedure Register;
begin
  RegisterUnit('CaoSecurity', @CaoSecurity.Register);
  RegisterUnit('EuroDMEdit', @EuroDMEdit.Register);
end;

initialization
  RegisterPackage('FakturaOS', @Register);
end.

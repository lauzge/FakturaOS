{ This file was automatically created by Typhon IDE. Do not edit!
  This source is only used to compile and install the package.
 }

unit lz_SynEditDsgn;

{$warn 5023 off : no warning about unused units}
interface

uses
  SynDesignStringConstants, SynEditLazDsgn, SynPropertyEditObjectList, 
  SynDBEdit, TyphonPackageIntf;

implementation

procedure Register;
begin
  RegisterUnit('SynEditLazDsgn', @SynEditLazDsgn.Register);
  RegisterUnit('SynDBEdit', @SynDBEdit.Register);
end;

initialization
  RegisterPackage('lz_SynEditDsgn', @Register);
end.

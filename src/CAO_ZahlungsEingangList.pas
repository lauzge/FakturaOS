{

CAO-Faktura für Windows Version 1.0
Copyright (C) 2003 Jan Pokrandt / Jan@JP-SOFT.de

This program is free software; you can redistribute it and/or
modify it under the terms of the GNU General Public License
as published by the Free Software Foundation; either version 2
of the License, or any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with this program; if not, write to the Free Software
Foundation, Inc., 59 Temple Place - Suite 330, Boston, MA  02111-1307, USA.


******* CAO-Faktura comes with ABSOLUTELY NO WARRANTY ***************
}

{

Programm     : CAO-Faktura
Modul        : CAO_ZAHLUNGSEINGANGLIST
Stand        : 02.11.2003
Version      : 1.1.3.24
Beschreibung : Zahlungseingang / OPOS-Debitoren

History :

- 22.01.2003 Version 1.0.0.49 released Jan Pokrandt
- 06.05.2003 Version zum GNU-Source hinzugefügt

20.02.2021 für FreePascal und CodeTyphon von Volker Stark lauzge@gmail.com portiert
}

unit CAO_ZahlungsEingangList;

{$IFDEF FPC}{$MODE DELPHI}{$ENDIF}

{$I CAO32.INC}

interface

uses
  Windows, Classes, SysUtils, DB, Forms, Controls, Graphics, Dialogs, ExtCtrls,
  StdCtrls, ComCtrls, DBGrids, Menus, DBCtrls, ZDataset, VolPeriod;

type

  { TZahlForm }

  TZahlForm = class(TForm)
    DBNavigator1: TDBNavigator;
    Label1: TLabel;
    Label2: TLabel;
    OPosDS: TDataSource;
    OPosDetailDS: TDataSource;
    MainMenu1: TMainMenu;
    OposKunGrid: TDBGrid;
    OPosRechGrid: TDBGrid;
    Label35: TLabel;
    Panel1: TPanel;
    SumCntLab: TLabel;
    SummeLab: TLabel;
    SummePan: TPanel;
    SumUeberfaelligLab: TLabel;
    SumUeberfaelligPan: TPanel;
    SumUECntLab: TLabel;
    ToolBar2: TToolBar;
    ToolButton1: TToolButton;
    ZahleingangBtn: TToolButton;
    TopPan: TPanel;
    DatumAW: TVolgaPeriod;
    ZahlungPanel: TPanel;
    OPosQuery: TZQuery;
    OPosDetailQuery: TZQuery;
    SumQuery: TZQuery;
  private

  public

  end;

var
  ZahlForm: TZahlForm;

implementation

{$R *.frm}

end.


{******************************************************************************}
{ PROJEKT      : CAO-FAKTURA                                                   }
{ DATEI        : CAO_TEILLIEFERUNG.PAS / DFM                                   }
{ BESCHREIBUNG : Ermöglicht die Erstellung von Teillieferungen aus Rechnungen  }
{ STAND        : 09.05.2004                                                    }
{ VERSION      : 1.2.5.3                                                       }
{ © 2004 Jan Pokrandt / Jan@JP-Soft.de                                         }
{                                                                              }
{ Diese Unit gehört zum Projekt CAO-Faktura und wird unter der                 }
{ GNU General Public License Version 2.0 freigegeben                           }
{                                                                              }
{******************************************************************************}
{                                                                              }
{ This program is free software; you can redistribute it and/or                }
{ modify it under the terms of the GNU General Public License                  }
{ as published by the Free Software Foundation; either version 2               }
{ of the License, or any later version.                                        }
{                                                                              }
{ This program is distributed in the hope that it will be useful,              }
{ but WITHOUT ANY WARRANTY; without even the implied warranty of               }
{ MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the                }
{ GNU General Public License for more details.                                 }
{                                                                              }
{ You should have received a copy of the GNU General Public License            }
{ along with this program; if not, write to the Free Software                  }
{ Foundation, Inc., 59 Temple Place - Suite 330, Boston, MA  02111-1307, USA.  }
{                                                                              }
{    ******* CAO-Faktura comes with ABSOLUTELY NO WARRANTY ***************     }
{                                                                              }
{******************************************************************************}
{                                                                              }
{ Historie :                                                                   }
{ 09.11.2003 - Bug bei Lagermengen < 0 beseitigt                               }
{ 09.05.2004 - Unit ins CVS gestellt                                           }
{                                                                              }
{ Todo :                                                                       }
{                                                                              }
{******************************************************************************}
{
-------------------------------------------------------------------------------------
01.01.2021 - für FreePascal und CodeTyphon von Volker Stark lauzge@gmail.com portiert
}

unit cao_teillieferdlg;

{$IFDEF FPC} {$MODE DELPHI} {$ENDIF}

{$I CAO32.INC}

interface

uses
  Classes, SysUtils, DB, Forms, Controls, Graphics, Dialogs, ExtCtrls, DBCtrls,
  Buttons, DBGrids, RxDBGrid, ZDataset, ZSqlUpdate;

type

  { TTeilLieferForm }

  TTeilLieferForm = class(TForm)
    AbbruchBtn: TBitBtn;
    LiefDS: TDataSource;
    MakeLiefBtn: TBitBtn;
    DBNavigator1: TDBNavigator;
    Panel1: TPanel;
    LiefTab: TZQuery;
    ExRxDBGrid1: TRxDBGrid;
    ZUpdateSql1: TZUpdateSQL;
    LiefTabREC_ID: TIntegerField;
    LiefTabARTIKEL_ID: TIntegerField;
    LiefTabPOSITION: TIntegerField;
    LiefTabARTNUM: TStringField;
    LiefTabMATCHCODE: TStringField;
    LiefTabBEZEICHNUNG: TMemoField;
    LiefTabME_RE: TFloatField;
    LiefTabLIEFERMENGE: TFloatField;
    LiefTabMENGE_GELIEFERT: TFloatField;
    LiefTabLAGERMENGE: TFloatField;
    procedure AbbruchBtnClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure LiefTabBeforeDelete(DataSet: TDataSet);
    procedure LiefTabBeforePost(DataSet: TDataSet);
    procedure MakeLiefBtnClick(Sender: TObject);
  private
    { Private-Deklarationen }
    LiefID : Integer;

    Fertig  : Boolean;
    Abbruch : Boolean;
  public
    { Public-Deklarationen }
    function ShowDlg (Journal_ID : Integer) : Boolean;
  end;

var
  TeilLieferForm: TTeilLieferForm;

implementation

{$R *.frm}

uses {$IFDEF PRO}cao_liefexport_dlg,{$ENDIF}
     CAO_DM, CAO_VAR_CONST, cao_progress, CAO_MakeVKRech{, CAO_PrintRech};

{ TTeilLieferForm }

//------------------------------------------------------------------------------
procedure TTeilLieferForm.FormCreate(Sender: TObject);
begin
     if Screen.PixelsPerInch <> 96 then
     begin
       Self.ScaleBy (96, Screen.PixelsPerInch);
       Refresh;
     end;
end;
//------------------------------------------------------------------------------
procedure TTeilLieferForm.LiefTabBeforeDelete(DataSet: TDataSet);
begin
     Abort;
end;
//------------------------------------------------------------------------------
procedure TTeilLieferForm.LiefTabBeforePost(DataSet: TDataSet);
var M : Double;
begin
     if LiefTab.State = dsInsert then begin Abort; LiefTab.Cancel; end;

     M :=LiefTabME_RE.AsFloat - LiefTabMENGE_GELIEFERT.AsFloat;
     if LiefTabLIEFERMENGE.AsFloat>M then
     begin
        MessageDlg ('Die Liefermenge + bereits gelieferte Mengen dürfen'+#13#10+
                    'nicht größer als die Rechnungsmenge sein !', mtError,[mbok],0);
        Abort;
        //Break;
     end;
end;
//------------------------------------------------------------------------------
procedure TTeilLieferForm.MakeLiefBtnClick(Sender: TObject);
var ls_num  : integer;
    CurrPos : Integer;
    LieferscheinID : Integer;
    {$IFDEF PRO}LiefExportDlg: TLiefExportDlg;{$ENDIF}

begin
     Fertig :=True;
     // jetzt Lieferschein erstellen
     ls_num :=dm1.buche_lieferschein (LiefID, True, LieferscheinID);


     // 2. In allen Positionen der EDI-Rechnung die Lieferscheinnummer eintragen
     if ls_num>-1 then
     begin

      //LS-Nummer in die Positionen eintragen
      MakeVKReForm.PosTab.DisableControls;
      try
       CurrPos :=MakeVKReForm.PosTab.RecNo;


       MakeVKReForm.PosTab.First;
       while not MakeVKReForm.PosTab.Eof do
       begin
            MakeVKReForm.PosTab.Edit;
            MakeVKReForm.PosTabVLSNum.Value :=ls_num;
            MakeVKReForm.PosTab.Post;
            MakeVKReForm.PosTab.Next;
       end;
       MakeVKReForm.PosTab.Locate ('POSITION',variant (CurrPos),[]);
      finally
       MakeVKReForm.PosTab.EnableControls;
       MakeVKReForm.UpBtn1.Enabled :=True;
       MakeVKReForm.UpBtn2.Enabled :=True;
      end;

      if not (MakeVKReForm.ReEdiTab.State in [dsEdit, dsInsert])
       then MakeVKReForm.ReEdiTab.Edit;
      try
         MakeVKReForm.ReEdiTabVLSNum.Value :=ls_num;
         MakeVKReForm.ReEdiTabLDatum.AsDateTime :=Now;
         MakeVKReForm.ReEdiTab.Post;
      except
         MakeVKReForm.ReEdiTab.Cancel;
      end;
     end;

     MakeVKReForm.LieferscheinBuchenBtn.Enabled :=False;
     MakeVKReForm.TeillieferungBtn.Enabled :=False;

     Fertig :=True;
     Close;

     {$IFDEF PRO}
     try
        LiefExportDlg:=TLiefExportDlg.Create(Self);
        try
           LiefExportDlg.MakeExport (MakeVKReForm.ReEdiTabLiefArt.AsInteger, LieferscheinID);
        finally
           LiefExportDlg.Free;
        end;
     except end;
     {$ENDIF}

     {$IFDEF REPORTBUILDER}
     PrintRechForm.ShowBelegDlg (VK_LIEF,LieferscheinID,False);
     {$ELSE}
     MessageDlg ('Der Code zum drucken des Lieferscheines'+#13#10+
                 'ist in die GNU-Version noch nicht implementiert !',
                 mterror,[mbok],0);

     {$ENDIF}
end;
//------------------------------------------------------------------------------
procedure TTeilLieferForm.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
     if not Fertig then Abbruch :=True;
end;
//------------------------------------------------------------------------------
procedure TTeilLieferForm.AbbruchBtnClick(Sender: TObject);
begin
     if not Fertig then Abbruch :=True;
     Close;
end;
//------------------------------------------------------------------------------
function TTeilLieferForm.ShowDlg (Journal_ID : Integer) : Boolean;
var M : Double;
begin
//     ExRxDBGrid1.RowColor1 :=DM1.C2Color;
//     ExRxDBGrid1.EditColor :=DM1.EditColor;

     LiefID :=DM1.CopyRechnung (Journal_ID, VK_LIEF_EDI);
     LiefTab.ParamByName ('JID').AsInteger :=LiefID;
     LiefTab.Open;
     LiefTab.DisableControls;
     while not LiefTab.Eof do
     begin
        LiefTab.Edit;
        M :=LiefTabME_RE.AsFloat - LiefTabMENGE_GELIEFERT.AsFloat;
        if M > LiefTabLAGERMENGE.AsFloat then M :=LiefTabLAGERMENGE.AsFloat;
        if M<0 then M :=0;
        LiefTabLIEFERMENGE.AsFloat :=M;
        LiefTab.Post;
        LiefTab.Next;
     end;
     LiefTab.First;
     LiefTab.EnableControls;
     ProgressForm.Stop;
     Abbruch :=False;
     Fertig  :=False;


     ShowModal;

     LiefTab.Close;
     if Abbruch then DM1.Storno_Lieferschein (LiefID);
     ProgressForm.Stop;
end;
//------------------------------------------------------------------------------

end.


{
This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with this program; if not, write to the Free Software
Foundation, Inc., 59 Temple Place - Suite 330, Boston, MA  02111-1307, USA.


******* CAO-Faktura comes with ABSOLUTELY NO WARRANTY ***************


Programm     : CAO-Faktura
Modul        : CAO_EXPORT
Stand        : 17.01.2004
Version      : 1.2 RC3
Beschreibung : Universalexport

History :

16.08.2003 - JP Unit erstellt
17.01.2004 - diverse Verbesserungen

TODO:

- Formulareditor integrieren

01.01.2021 für FreePascal und CodeTyphon von Volker Stark lauzge@gmail.com portiert
}

unit CAO_Export;

{$IFDEF FPC} {$MODE DELPHI} {$ENDIF}

{$I CAO32.INC}

interface

uses
  Classes, SysUtils, DB, Forms, Controls, Graphics, Dialogs, ExtCtrls, StdCtrls,
  Buttons, ComCtrls, DBGrids, DBCtrls, Menus, SynHighlighterSQL, SynEdit,
  ZDataset, ZAbstractRODataset, cao_var_const;

type

  { TExportForm }

  TExportForm = class(TForm)
    ExportDS: TDataSource;
    EDS: TDataSource;
    ExportListGrid: TDBGrid;
    SaveDialog1: TSaveDialog;
    SqlGrid: TDBGrid;
    DBNavigator1: TDBNavigator;
    DBNavigator2: TDBNavigator;
    ExportTabCHANGE_NAME: TZRawStringField;
    ExportTabFELDER: TZRawCLobField;
    ExportTabFILENAME: TZRawStringField;
    ExportTabFORMAT: TZRawStringField;
    ExportTabFORMULAR: TZBlobField;
    ExportTabID: TZIntegerField;
    ExportTabINFO: TZRawCLobField;
    ExportTabKURZBEZ: TZRawStringField;
    ExportTabLAST_CHANGE: TZDateTimeField;
    ExportTabQUERY: TZRawCLobField;
    MainMenu1: TMainMenu;
    Bearbeiten1: TMenuItem;
    Ausfhren1: TMenuItem;
    Sortierung1: TMenuItem;
    Ansicht1: TMenuItem;
    PC1: TPageControl;
    ReEdiTopLab: TLabel;
    MainPanel: TPanel;
    FelderBtn: TSpeedButton;
    Splitter1: TSplitter;
    SQLBtn: TSpeedButton;
    AllgemeinBtn: TSpeedButton;
    AuswahlBtn: TSpeedButton;
    AuswahlTS: TTabSheet;
    AllgTS: TTabSheet;
    SQLEditor: TSynEdit;
    SQLExecTS: TTabSheet;
    FelderTS: TTabSheet;
    SynSQLSyn1: TSynSQLSyn;
    ToolBar1: TToolBar;
    ToolBar2: TToolBar;
    Auswahl2Btn: TToolButton;
    EdiBtn: TToolButton;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    SQLExecBtn: TToolButton;
    ToolButton5: TToolButton;
    ExportBtn: TToolButton;
    ToolButton7: TToolButton;
    AuswExportBtn: TToolButton;
    ToolButton9: TToolButton;
    TopPan: TPanel;
    ExportTab: TZQuery;
    EQuery: TZQuery;
    procedure Ausfhren1Click(Sender: TObject);
    procedure AuswahlBtnClick(Sender: TObject);
    procedure AuswahlBtnMouseEnter(Sender: TObject);
    procedure AuswahlBtnMouseLeave(Sender: TObject);
    procedure AuswExportBtnClick(Sender: TObject);
    procedure EdiBtnClick(Sender: TObject);
    procedure EQueryAfterOpen(DataSet: TDataSet);
    procedure ExportBtnClick(Sender: TObject);
    procedure ExportTabAfterPost(DataSet: TDataSet);
    procedure ExportTabBeforePost(DataSet: TDataSet);
    procedure FormActivate(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDeactivate(Sender: TObject);
    procedure PC1Change(Sender: TObject);
    procedure SQLEditorChange(Sender: TObject);
    procedure SQLExecBtnClick(Sender: TObject);
  private
    { Private-Deklarationen }
    First : Boolean;
  public
    { Public-Deklarationen }
    OnUpdateStatusBar : TOnUpdateStatusBar;
  end;

var
  ExportForm: TExportForm;

implementation

{$R *.frm}

uses
  CAO_DM;

{ TExportForm }

procedure TExportForm.FormCreate(Sender: TObject);
begin
  OnUpdateStatusBar  :=nil;
  First              :=True;

  FelderBtn.Align    :=alRight;
  SQLBtn.Align       :=alRight;
  AllgemeinBtn.Align :=alRight;
  AuswahlBtn.Align   :=alRight;
end;

procedure TExportForm.FormDeactivate(Sender: TObject);
begin
  ExportTab.Close;
  EQuery.Close;
end;

procedure TExportForm.PC1Change(Sender: TObject);
begin
  AuswahlBtn.Font.Style   :=[];
  AllgemeinBtn.Font.Style :=[];
  SQLBtn.Font.Style       :=[];
  FelderBtn.Font.Style    :=[];

  case PC1.ActivePageIndex of
    0: begin AuswahlBtn.Font.Style   :=[fsBold]; {Allgemein1.Checked :=True;} end;
    1: begin AllgemeinBtn.Font.Style :=[fsBold]; {Allgemein1.Checked :=True;} end;
    2: begin SQLBtn.Font.Style       :=[fsBold]; {Allgemein1.Checked :=True;} end;
    3: begin FelderBtn.Font.Style    :=[fsBold]; {Liste1.Checked :=True;    } end;
  end;

  if PC1.ActivePage=SQLExecTS then
  begin
     SQLEditor.Lines.Text :=ExportTabQUERY.AsString;
     SQLEditor.Modified :=False;
  end;

  if EQuery.Active then EQuery.Close;
end;

procedure TExportForm.SQLEditorChange(Sender: TObject);
begin
  EQuery.Close;
  ExportBtn.Enabled :=False;
end;

procedure TExportForm.SQLExecBtnClick(Sender: TObject);
var S : String;
begin
  ExportBtn.Enabled :=False;
  if (not ExportTab.Active){or(ExportTab.RecordCount=0)} then exit;

  if SQLEditor.Modified then
  begin
     ExportTab.Edit;
     ExportTabQuery.AsString :=SQLEditor.Lines.Text;
     SQLEditor.Modified :=False;
     ExportTab.Post;
  end;

  if ExportTabQuery.AsString='' then
  begin
     MessageDlg ('Die SQL-Abfrage ist leer.',mterror,[mbok],0);
     exit;
  end;

  if pos('SELECT',uppercase(ExportTabQUERY.AsString))=0
   then EQuery.Sql.Text :='select * '+ExportTabQUERY.AsString
   else EQuery.Sql.Text :=ExportTabQUERY.AsString;

  S :=Uppercase(EQuery.Sql.Text);
  if (Pos(';',S)>0) or
     (Pos('INSERT',S)>0) or
     (Pos('UPDATE',S)>0) or
     (Pos('DELETE',S)>0) or
     (Pos('DROP',S)>0) or
     (Pos('ALTER',S)>0) or
     (Pos('CREATE',S)>0) then
  begin
     MessageDlg ('Verbotene(n) SQL-Befehl(e) gefunden !',mterror,[mbok],0);


  end else EQuery.Open;
end;

procedure TExportForm.FormActivate(Sender: TObject);
begin
  if First = True then
  begin
     First :=False;
//     ExportListGrid.RowColor1 :=DM1.C2Color;
//     SqlGrid.RowColor1        :=DM1.C2Color;
//     ExportListGrid.EditColor :=DM1.EditColor;
//     SqlGrid.EditColor        :=DM1.EditColor;
  end;
  SynSQLSyn1.Enabled:=true;
  ExportTab.Open;
  PC1.ActivePage :=PC1.Pages[0];
  PC1Change(Self);
  ExportListGrid.SetFocus;
end;

procedure TExportForm.EQueryAfterOpen(DataSet: TDataSet);
begin
  ExportBtn.Enabled :=(equery.active)and(equery.recordcount>0);
end;

procedure TExportForm.ExportBtnClick(Sender: TObject);
begin
  if (not (equery.active))or(equery.recordcount=0) then
  begin
    if (equery.active)and(equery.recordcount=0)
     then MessageDlg ('Die SQL-Abfrage lieferte keine Daten zurück.'+#13#10+
                      'Ein Export ist nicht möglich',mtinformation,[mbok],0);

    exit;
  end;

  SaveDialog1.InitialDir :=DM1.ExportDir;
  SaveDialog1.DefaultExt :='csv';
  SaveDialog1.Title      :='Daten exportieren';
  SaveDialog1.Filter     :='CSV-Dateien|*.csv';
  if SaveDialog1.Execute
   then DM1.ExportDatasetToFile(SaveDialog1.FileName,EQuery,ListSeparator,False);
end;

procedure TExportForm.Ausfhren1Click(Sender: TObject);
begin
  if PC1.ActivePage <> SQLExecTS then EdiBtnClick(Self);
  SQLExecBtnClick(Sender);
end;

procedure TExportForm.AuswahlBtnClick(Sender: TObject);
begin
  if (Sender is tMenuItem)
   then PC1.ActivePage :=PC1.Pages[tMenuitem(sender).Tag-1]
   else PC1.ActivePage :=PC1.Pages[tSpeedButton(sender).Tag-1];
  PC1Change (Sender);
end;

procedure TExportForm.AuswahlBtnMouseEnter(Sender: TObject);
begin
  if (sender is tSpeedButton)and
     (tSpeedButton(Sender).Enabled) then
  begin
    tSpeedButton(Sender).Transparent :=False;
    tSpeedButton(Sender).Font.Color :=clBlack;
  end;
end;

procedure TExportForm.AuswahlBtnMouseLeave(Sender: TObject);
begin
  if (sender is tSpeedButton) then
  begin
    tSpeedButton(Sender).Transparent :=True;
    tSpeedButton(Sender).Font.Color :=clWhite;
  end;
end;

procedure TExportForm.AuswExportBtnClick(Sender: TObject);
begin
  if ExportTabQuery.AsString='' then
  begin
     MessageDlg ('Die SQL-Abfrage ist leer.',mterror,[mbok],0);
     exit;
  end;
  SQLExecBtnClick(Self);
  ExportBtnClick (Self);
end;

procedure TExportForm.EdiBtnClick(Sender: TObject);
begin
  PC1.ActivePage :=SQLExecTS;
  PC1Change(Self);
end;

procedure TExportForm.ExportTabAfterPost(DataSet: TDataSet);
begin
  AuswExportBtn.Enabled :=(ExportTab.Active)and(ExportTab.RecordCount>0);
  EdiBtn.Enabled :=(ExportTab.Active)and(ExportTab.RecordCount>0);
end;

procedure TExportForm.ExportTabBeforePost(DataSet: TDataSet);
begin
  ExportTabLAST_CHANGE.AsDateTime :=Now;
  ExportTabCHANGE_NAME.AsString   :=DM1.View_User;
end;

end.


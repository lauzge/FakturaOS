{
-------------------------------------------------------------------------------------
01.01.2021 - für FreePascal und CodeTyphon von Volker Stark lauzge@gmail.com portiert
}

unit cao_progress;

{$IFDEF FPC} {$MODE DELPHI} {$ENDIF}

{$I CAO32.INC}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ComCtrls,
  StdCtrls;

type

  { TProgressForm }

  TProgressForm = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    PB1: TProgressBar;
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormCreate(Sender: TObject);
  private
    { Private-Deklarationen }
    Step  : Integer;
    Step2 : Integer;
    LStep : Integer;
    Run   : Boolean;
  public
    { Public-Deklarationen }
    procedure Init (Caption : String);
    procedure Start;
    procedure Stop;
    procedure UpdateScreen;
  end;

var
  ProgressForm: TProgressForm;

implementation

{$R *.frm}

{ TProgressForm }

procedure TProgressForm.FormCreate(Sender: TObject);
begin
  Run   :=False;
  Step  :=0;
  Step2 :=0;

end;

procedure TProgressForm.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  CanClose :=not Run;
end;

procedure TProgressForm.Init (Caption : String);
begin
     Run   :=False;
     Step  :=0;
     Step  :=0;;
     PB1.Position :=0;
     Self.Caption :=Caption;
end;

procedure TProgressForm.Start;
begin
     Step  :=0;
     Step2 :=0;
     LStep :=0;
     Run   :=True;
     PB1.Position :=0;
     //Show;
end;

procedure TProgressForm.Stop;
begin
     Run   :=False;
     Step  :=0;
     Step2 :=0;
     Hide;
end;

procedure TProgressForm.UpdateScreen;
begin
     inc(Step);
     inc(Step2);
     if Step>PB1.Max then Step :=PB1.Min;
     PB1.Position :=Step;

     if (Step2 > 10) and (not Visible) then Show;

     if Step2 > LStep+100 then
     begin
        LStep :=LStep+100;
        Label1.Caption :=IntToStr(Step2);
     end;

     Application.ProcessMessages;
end;

end.


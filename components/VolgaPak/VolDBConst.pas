//---------------------------------------------------------------------------
//  Resource strings for TVolgaCalendar, TVolgaDBGrid, TVolgaDBEdit
//---------------------------------------------------------------------------
//  Copyright © 2000, Olga Vlasova, Russia
//  http://volgatable.chat.ru
//  E-mail: volgatable@chat.ru
//---------------------------------------------------------------------------
unit VolDBConst;
//{$DEFINE LAN_ENGLISH}
{$DEFINE LAN_GERMAN}
//{$DEFINE LAN_RUSSIAN}

interface

{$IFDEF LAN_ENGLISH}
resourcestring
   V_PREVYEAR = 'Previous year';
   V_PREVMON = 'Previous month';
   V_NEXTYEAR = 'Next year';
   V_NEXTMON = 'Next month';
   V_PUSHMON = 'Click to change month';
   V_TODAY = 'Today is ';
   V_PUSHTODAY = 'Click to select today';
   V_DELETEROWS = 'Delete selected records ?';
   V_DELETEONEROW = 'Delete record ?';
   V_LOOKUPSOURCEERROR = 'Lookup Dataset cannot be equal to Source DataSet';
   V_SHORTYEAR = ' y.';
   V_LONGYEAR = ' year';
   V_KINDMON = 'Month';
   V_KINDQUART = 'Quarter';
   V_KINDHALF = 'Half Year';
   V_KINDYEAR = 'Whole year';
   V_FRMTQUART = '%d Quarter %d year';
   V_FRMTHALFYEAR = '%d Half Year %d year';
   V_OKBTNHINT = 'Save result';
   V_CANCELBTNHINT = 'Close without saving';
   V_PANELFRACT = 'Decimal digits';
   V_BTNUPHINT = 'Increase number of decimal digits';
   V_BTNDOWNHINT = 'Decrease number of decimal digits';
{$ENDIF}

{$IFDEF LAN_GERMAN}
resourcestring
   V_PREVYEAR = 'vorheriges Jahr';
   V_PREVMON = 'vorheriger Monat';
   V_NEXTYEAR = 'nächstes Jahr';
   V_NEXTMON = 'nächster Monat';
   V_PUSHMON = 'Klicken, um den Monat zu ändern';
   V_TODAY = 'Heute ist ';
   V_PUSHTODAY = 'Klicken Sie hier, um den heutigen Tag auszuwählen';
   V_DELETEROWS = 'Wollen Sie die ausgewählten Datensätze wirklichlöschen?';
   V_DELETEONEROW = 'Datensatz löschen?';
   V_LOOKUPSOURCEERROR = 'Lookup Dataset kann nichtmit dem Source DataSet identisch sein';
   V_SHORTYEAR = '';
   V_LONGYEAR = ' (ges.Jahr)';
   V_KINDMON = 'Monat';
   V_KINDQUART = 'Quartal ';
   V_FRMTQUART = '%d. Quartal %d';
   V_KINDHALF = 'Halbjahr ';
   V_FRMTHALFYEAR = '%d. Halbjahr %d';
   V_KINDYEAR = 'gesamtes Jahr';
   V_OKBTNHINT = 'Speichern';
   V_CANCELBTNHINT = 'Ohne speichern schliessen';
   V_PANELFRACT = 'Dezimalstellen';
   V_BTNUPHINT = 'Dezimalstelle erhöhen';
   V_BTNDOWNHINT = 'Dezimalstelle verringern';
{$ENDIF}

{$IFDEF LAN_RUSSIAN}
resourcestring
   V_PREVYEAR = 'Ïðåäûäóùèé ãîä';
   V_PREVMON = 'Ïðåäûäóùèé ìåñÿö';
   V_NEXTYEAR = 'Ñëåäóþùèé ãîä';
   V_NEXTMON = 'Ñëåäóþùèé ìåñÿö';
   V_PUSHMON = 'Íàæìèòå äëÿ èçìåíåíèÿ ìåñÿöà';
   V_TODAY = 'Ñåãîäíÿ ';
   V_PUSHTODAY = 'Íàæìèòå äëÿ âûáîðà òåêóùåé äàòû';
   V_DELETEROWS = 'Óäàëèòü âûáðàííûå çàïèñè ?';
   V_DELETEONEROW = 'Óäàëèòü çàïèñü ?';
   V_LOOKUPSOURCEERROR = 'Lookup Dataset cannot be equal to Source DataSet';
   V_SHORTYEAR = ' ã.';
   V_LONGYEAR = ' ãîä';
   V_KINDMON = 'Ìåñÿö';
   V_KINDQUART = 'Êâàðòàë';
   V_KINDHALF = 'Ïîëóãîäèå';
   V_KINDYEAR = 'Ãîä';
   V_FRMTQUART = '%d êâàðòàë %d ãîäà';
   V_FRMTHALFYEAR = '%d ïîëóãîäèå %d ãîäà';
   V_OKBTNHINT = 'Ñîõðàíèòü';
   V_CANCELBTNHINT = 'Çàêðûòü áåç ñîõðàíåíèÿ';
   V_PANELFRACT = 'Äåñÿòè÷íûå çíàêè';
   V_BTNUPHINT = 'Óâåëè÷èòü êîëè÷åñòâî äåñÿòè÷íûõ çíàêîâ';
   V_BTNDOWNHINT = 'Óìåíüøèòü êîëè÷åñòâî äåñÿòè÷íûõ çíàêîâ';
{$ENDIF}

implementation

end.

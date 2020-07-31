unit DETAIL02U;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, QRCtrls, QuickRpt, Vcl.ExtCtrls,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, Vcl.StdCtrls;

type
  TDETAIL02 = class(TForm)
    Query1: TFDQuery;
    QuickRep1: TQuickRep;
    QRLoopBand1: TQRLoopBand;
    qrlblTITLE: TQRLabel;
    qrtxtSUBTITLE: TQRRichText;
    qrlblCONTENT1: TQRLabel;
    qrlblCONTENT2: TQRLabel;
    qrlblCONTENT3: TQRLabel;
    QRShape5: TQRShape;
    QRLabel9: TQRLabel;
    QRLabel11: TQRLabel;
    QRShape9: TQRShape;
    qrlDEPTYEAR: TQRLabel;
    qrlDEPTMNTH: TQRLabel;
    QRShape1: TQRShape;
    QRShape4: TQRShape;
    QRShape6: TQRShape;
    QRShape7: TQRShape;
    qrlblSuject: TQRLabel;
    procedure QuickRep1BeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
  private
    { Private declarations }
    uiCompCnt: Integer;
  public
    { Public declarations }
    function GET_YOIL(PGUBUN:Integer;PDATE:TDate):String;
    function CHG_DATE_DASH(PDATE : String):String;
  end;

var
  DETAIL02: TDETAIL02;

implementation

{$R *.dfm}

procedure TDETAIL02.QuickRep1BeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
var sQ1STRDAT, sQ1ENDDAT : String;
    iCompNum, iCompRow, i : Integer;
    //������Ʈ ������������ ����
    iLeft, iLeftIncF, iDAYTopF, iDANTopF, IPSSTopF, iSPSTopF, iLongWidth : Integer;
    qrLBL : TQRLabel;
    qrSHP : TQRShape;
begin
  sQ1STRDAT := '20200225';
  sQ1ENDDAT := '20200310';
  With Query1 Do
  Begin
    Close;
    SQL.Clear;
    SQL.Add('  SELECT A.DEPTDATE                                                                                                                                     ');
    SQL.Add('       , CASE WHEN SUBSTR('''+sQ1STRDAT+''',5,2) <> SUBSTR(A.DEPTDATE,5,2)                                                                              ');
    SQL.Add('                   AND SUBSTR(A.DEPTDATE,7,2)=''01'' THEN TO_CHAR(TO_DATE(A.DEPTDATE,''YYYYMMDD''), ''fmMM/DD'')                                        ');
    SQL.Add('                                                     ELSE TO_CHAR(TO_DATE(A.DEPTDATE,''YYYYMMDD''), ''fmDD'') END DEPT_DAY                              ');
    SQL.Add('       , CASE WHEN Z1.CODEVAL3 = ''1'' AND A.CANCGBUN  = ''2'' THEN ''-''                                                                               ');
    SQL.Add('              WHEN Z1.CODEVAL3 = ''1'' AND A.CANCGBUN <> ''2'' THEN ''''                                                                                ');
    SQL.Add('                                                           ELSE A.DEPTSHIP END PSSHIPNM                                                                 ');
    SQL.Add('       , CASE WHEN Z2.CODEVAL3 = ''1'' AND B.CANCGBUN  = ''2'' THEN ''-''                                                                               ');
    SQL.Add('              WHEN Z2.CODEVAL3 = ''1'' AND B.CANCGBUN <> ''2'' THEN ''''                                                                                ');
    SQL.Add('                                                           ELSE B.DEPTSHIP END SPSHIPNM                                                                 ');
    SQL.Add('       , A.STOPGBUN AS DEPTSTOP                                                                                                                         ');
    SQL.Add('       , B.STOPGBUN AS RETNSTOP                                                                                                                         ');
    SQL.Add('       , A.CANCGBUN AS DEPTCANC                                                                                                                         ');
    SQL.Add('       , B.CANCGBUN AS RETNCANC                                                                                                                         ');
    SQL.Add('    FROM (SELECT DEPTDATE, MIN(DEPTHCHA) DEPTHCHA                                                                                                       ');
    SQL.Add('            FROM PSSTSCHE                                                                                                                               ');
    SQL.Add('           WHERE DEPTDATE >= ''' + sQ1STRDAT + '''                                                                                                      ');
    SQL.Add('             AND DEPTDATE <= ''' + sQ1ENDDAT + '''                                                                                                      ');
    SQL.Add('             AND DEPTLINE = ''PS''                                                                                                                      ');
    SQL.Add('           GROUP BY DEPTDATE                                                                                                                            ');
    SQL.Add('         ) M                                                                                                                                            ');
    SQL.Add('    LEFT OUTER JOIN PSSTSCHE A ON M.DEPTDATE = A.DEPTDATE                                                                                               ');
    SQL.Add('                              AND M.DEPTHCHA = A.DEPTHCHA                                                                                               ');
    SQL.Add('                              AND A.DEPTLINE = ''PS''                                                                                                   ');
    SQL.Add('    LEFT OUTER JOIN PSSTSCHE B ON M.DEPTDATE = B.DEPTDATE                                                                                               ');
    SQL.Add('                              AND M.DEPTHCHA = B.DEPTHCHA                                                                                               ');
    SQL.Add('                              AND B.DEPTLINE = ''SP''                                                                                                   ');
    SQL.Add('    LEFT OUTER JOIN PSSTCDDT Z1 ON A.CANCGBUN = Z1.CODE_CD1                                                                                             ');
    SQL.Add('                               AND Z1.CODE_CD0 = ''CC''                                                                                                 ');
    SQL.Add('    LEFT OUTER JOIN PSSTCDDT Z2 ON B.CANCGBUN = Z2.CODE_CD1                                                                                             ');
    SQL.Add('                               AND Z2.CODE_CD0 = ''CC''                                                                                                 ');
    SQL.Add('   ORDER BY M.DEPTDATE                                                                                                                                  ');
    Open;

    if Query1.IsEmpty then Exit;

    uiCompCnt  := 24; //�ִ� ���� ������Ʈ ��

    iCompNum := 1;
    iCompRow := 1;

    // ������Ʈ ��������
    iLeft := 44;
    iDAYTopF := 82;
    iDANTopF := 107;
    IPSSTopF := 132;
    iSPSTopF := 157;

    iLeftIncF := 30; // ���� ����ġ

      While Not Query1.Eof Do
      Begin
        if iCompRow > uiCompCnt then //Next;
        begin
          break;
        end;

        //���� �� ������
        qrSHP := TQRShape.Create(QRLoopBand1);
        qrSHP.Shape := qrsVertLine;
        qrSHP.Parent := QRLoopBand1;
        qrSHP.Brush.Color := clBlack;
        qrSHP.Pen.Width := 1;
        qrSHP.Pen.Mode := pmCopy;
        qrSHP.Pen.Color := clBlack;
        qrSHP.Pen.Style := psSolid;
        qrSHP.Enabled := True;
        qrSHP.Top  := iDAYTopF - 1;
        qrSHP.Left := iLeft + 27;
        qrSHP.Height := 99;
        qrSHP.Width := 1;

        For i := 1 to 4 Do
        Begin
          qrLBL := TQRLabel.Create(QRLoopBand1);
          qrLBL.Parent  := QRLoopBand1;
          qrLBL.ParentFont := True;
          qrLBL.Alignment := taCenter;
          qrLBL.VerticalAlignment := tlCenter;
          qrLBL.Enabled := True;
          qrLBL.Width   := 25;
          qrLBL.Height  := 22;
          qrLBL.Left    := iLeft;

          //���� �� ������
          qrSHP := TQRShape.Create(QRLoopBand1);
          qrSHP.Shape := qrsHorLine;
          qrSHP.Parent := QRLoopBand1;
          qrSHP.Brush.Color := clBlack;
          qrSHP.Pen.Width := 1;
          qrSHP.Pen.Mode := pmCopy;
          qrSHP.Pen.Color := clBlack;
          qrSHP.Pen.Style := psSolid;
          qrSHP.Enabled := True;
          qrSHP.Width := 29;
          qrSHP.Height := 1;
          qrSHP.Left := iLeft - 2;


          if i = 1 then
          begin
            qrLBL.Top     := iDAYTopF;
            qrLBL.Caption := FieldByName('DEPT_DAY').AsString;

            qrSHP.Top  := (iDAYTopF - 2);
          end
          else
          if i = 2 then
          begin
            qrLBL.Top     := iDANTopF;
            qrLBL.Caption := GET_YOIL(5, StrToDate(CHG_DATE_DASH(FieldByName('DEPTDATE').AsString)));

            qrSHP.Top  := (iDANTopF - 2);
          end
          else
          if i = 3 then
          begin
            qrLBL.Top     := iPSSTopF;
            qrLBL.Caption := FieldByName('PSSHIPNM').AsString;

            qrSHP.Top  := (iPSSTopF - 2);
          end
          else
          if i = 4 then
          begin
            qrLBL.Top     := iSPSTopF;
            qrLBL.Caption := FieldByName('SPSHIPNM').AsString;

            qrSHP.Top  := (iSPSTopF - 2);
          end;
        End;

        iLeft := iLeft + iLeftIncF;

        Inc(iCompRow);
        Next;
      End;

      iLongWidth := ((iCompRow-1) * 29)+ iCompRow-2;
      //�ֻ�� -
      qrSHP := TQRShape.Create(QRLoopBand1);
      qrSHP.Shape := qrsHorLine;
      qrSHP.Parent := QRLoopBand1;
      qrSHP.Brush.Color := clBlack;
      qrSHP.Pen.Width := 1;
      qrSHP.Pen.Mode := pmCopy;
      qrSHP.Pen.Color := clBlack;
      qrSHP.Pen.Style := psSolid;
      qrSHP.Enabled := True;
      qrSHP.Top  := 55;
      qrSHP.Left := 42;
      qrSHP.Height := 1;
      qrSHP.Width := iLongWidth;
      //���ϴ� - ������
      qrSHP := TQRShape.Create(QRLoopBand1);
      qrSHP.Shape := qrsHorLine;
      qrSHP.Parent := QRLoopBand1;
      qrSHP.Brush.Color := clBlack;
      qrSHP.Pen.Width := 1;
      qrSHP.Pen.Mode := pmCopy;
      qrSHP.Pen.Color := clBlack;
      qrSHP.Pen.Style := psSolid;
      qrSHP.Enabled := True;
      qrSHP.Top  := 180;
      qrSHP.Left := 42;
      qrSHP.Height := 1;
      qrSHP.Width := iLongWidth;

      //�׸������� ����
      qrlblSuject.Width := iLongWidth;

      //�׸������� �������� �� ������
      qrSHP := TQRShape.Create(QRLoopBand1);
      qrSHP.Shape := qrsVertLine;
      qrSHP.Parent := QRLoopBand1;
      qrSHP.Top  := 56;
      qrSHP.Left := 42 + iLongWidth;
      qrSHP.Height := 25;
      qrSHP.Width := 1;
      qrSHP.Brush.Color := clBlack;
      qrSHP.Pen.Width := 1;
      qrSHP.Pen.Mode := pmCopy;
      qrSHP.Pen.Color := clBlack;
      qrSHP.Pen.Style := psSolid;
      qrSHP.Enabled := True;
  End;
end;

function TDETAIL02.GET_YOIL(PGUBUN:Integer;PDATE:TDate):String;
begin
  if  PGUBUN = 1 then //���ϰ�
      Result := IntToStr(DayOfWeek(PDATE))
  else
  if  PGUBUN = 2 then //���ϰ�
      begin
        Case DayOfWeek(PDATE) of
             1 : Result := '�Ͽ���';
             2 : Result := '������';
             3 : Result := 'ȭ����';
             4 : Result := '������';
             5 : Result := '�����';
             6 : Result := '�ݿ���';
             7 : Result := '�����';
        end;
      end
  else
  if  PGUBUN = 3 then //���ϰ�
      begin
        Case DayOfWeek(PDATE) of
             1 : Result := '��';
             2 : Result := '��';
             3 : Result := 'ȭ';
             4 : Result := '��';
             5 : Result := '��';
             6 : Result := '��';
             7 : Result := '��';
        end;
      end
  else
  if  PGUBUN = 4 then //���ϰ� ����
      begin
        Case DayOfWeek(PDATE) of
             1 : Result := 'Sunday';
             2 : Result := 'Monday';
             3 : Result := 'Tuesday';
             4 : Result := 'Wednesday';
             5 : Result := 'Thursday';
             6 : Result := 'Friday';
             7 : Result := 'Saturday';
        end;
      end
  else
  if  PGUBUN = 5 then //���ϰ� �ѹ�
      begin
        Case DayOfWeek(PDATE) of
             1 : Result := '��';
             2 : Result := '��';
             3 : Result := '��';
             4 : Result := '�';
             5 : Result := '��';
             6 : Result := '��';
             7 : Result := '��';
        end;
      end;
end;

function TDETAIL02.CHG_DATE_DASH(PDATE : String):String;
begin
  Result := '';

  if  PDATE = '0' then
      begin
        Result := '';
        Exit;
      end;

  if  Length(PDATE) < 8 then
      begin
        Result := PDATE;
        Exit;
      end;

  if  copy(PDATE,5,1) = '-' then
      Result := copy(PDATE,1,4) + copy(PDATE,6,2) + copy(PDATE,9,2)
  else
      Result := copy(PDATE,1,4) + '-' + copy(PDATE,5,2) + '-' + copy(PDATE,7,2);
end;

end.

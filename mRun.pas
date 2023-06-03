unit mRun;

interface

uses
  Windows, System.Classes, System.SysUtils, System.SyncObjs,
  Vcl.Dialogs, ActiveX;

type
  TRun = class(TThread)
  private
  protected
    procedure Execute; override;
  public
    Event: TEvent;
  end;

var
  run: TRun;

implementation

uses
  IBusinessAPI1,
  mmain, dmUnit;

{ TRun }

procedure TRun.Execute;

  procedure CheckResponse(Rsp: String; var AI: ArrayOfInt);
  const
    Entity_Add_Response_OK = ',"EntityId":';

  var
    p1, p2, value: Integer;
    s: String;

  begin
    p1 := Pos(Entity_Add_Response_OK, Rsp);
    if p1 = 0 then
      exit;
    p1 := p1 + length(Entity_Add_Response_OK);

    p2 := Pos(',', Rsp, p1);
    if p2 = 0 then
      exit;
    if (p2 - p1) < 2 then
      exit;

    s := Copy(Rsp, p1, p2 - p1);
    s := Trim(s);
    if not TryStrToInt(s, value) then
      exit;

    SetLength(AI, length(AI) + 1);
    AI[length(AI) - 1] := value;
  end;

var
  bApi: IBusinessAPI;
  slParams, slValues: TStringList;
  i: Word;
  s, ResultStr: String;
  aoi: ArrayOfInt;

begin
  slParams := TStringList.create;
  slValues := TStringList.create;

  while not Terminated do
  begin
    WaitForSingleObject(Event.Handle, INFINITE);

    try

      bApi := GetIBusinessAPI(false, fmMain.eWebSevice.Text, fmMain.HTTPRIO1);
      CoInitialize(nil);
      SetLength(aoi, 0);

      { SQL connection }

      slParams.Clear;
      slValues.Clear;
      with slParams do
      begin
        Add('DriverID');
        Add('server');
        Add('port');
        Add('user_name');
        Add('password');
      end;
      for i := 0 to 4 do
        slValues.Add('');
      GetParams(fmMain.eMySQL.Text, slParams, slValues);
      slValues[0] := 'MySQL';

      with DataModule1 do
      begin
        FDConnection1.Close;
        with FDConnection1.Params do
        begin
          Clear;
          for i := 0 to 4 do
            Add(slParams[i] + '=' + slValues[i]);
        end;
        FDConnection1.Open;

        { create database }

        FDCommand1.Execute(0, 0, True);
        ResultStr := 'Database <' + fmMain.eMySQL.Text + '>' + #13 +
          'and table <Callback> was created.';
        { insert users to callback }

        FDCommand2.CommandText := fmMain.mmSQLstatement.Lines;
        FDCommand2.Execute(0, 0, True);
        ResultStr := ResultStr + #13#13 + 'Users was added to callback.';

        { read users }

        FDQuery1.Open();
        while not FDQuery1.Eof do
        begin

          { Entity_Add call }

          slParams.Clear;
          slValues.Clear;
          with slParams do
          begin
            Add('ol_EntityId');         { 0 }
            Add('ol_UserName');         { 1 }
            Add('ol_Password');         { 2 }
            Add('BusinessId');          { 3 }
            Add('Employee_EntityId');   { 4 }
            Add('CategoryID');          { 5 }
            Add('Email');               { 6 }  { - }
            Add('Password');            { 7 }
            Add('FirstName');           { 8 }  { - }
            Add('LastName');            { 9 }  { - }
            Add('Mobile');              { 10 } { - }
            Add('CountryISO');          { 11 }
            Add('affiliate_entityID');  { 12 }
          end;

          for i := 0 to 12 do
            slValues.Add('');
          GetParams(fmMain.mmWebServiceParams.Text, slParams, slValues);

          with FDQuery1 do
          begin
            slValues[6] := FindField('Email').AsString;
            slValues[8] := FindField('FirstName').AsString;
            slValues[9] := FindField('LastName').AsString;
            slValues[10] := FindField('CID').AsString;
            slValues[12] := '1';
          end;

          s := bApi.Entity_Add(slValues[0].ToInteger, slValues[1], slValues[2],
            slValues[3].ToInteger, slValues[4].ToInteger, slValues[5].ToInteger,
            slValues[6], slValues[7], slValues[8], slValues[9], slValues[10],
            slValues[11], slValues[12].ToInteger);
          CheckResponse(s, aoi);
          ResultStr := ResultStr + #13#13 + 'Entity_Add call returned <'
            + s + '>';
          FDQuery1.Next;
        end;

        FDConnection1.Close;
      end;

      { Telemarketing_add call }

      slParams.Clear;
      slValues.Clear;
      with slParams do
      begin
        Add('ol_EntityId');
        Add('ol_UserName');
        Add('ol_Password');
        Add('campaignID');
        Add('EntityIds');
      end;

      for i := 0 to 4 do
        slValues.Add('');
      GetParams(fmMain.mmWebServiceParams.Text, slParams, slValues);
      if length(aoi) > 0 then
      begin
        s := bApi.Telemarketing_add(slValues[0].ToInteger, slValues[1],
          slValues[2], slValues[3].ToInteger, aoi);
        ResultStr := ResultStr + #13#13 + 'Telemarketing_add call returned <'
          + s + '>';
      end;

      bApi := nil;
      CoUninitialize();

      Synchronize(
        procedure
        begin
          ShowMessage(ResultStr);
        end);

    except
      bApi := nil;
      CoUninitialize();
      DataModule1.FDConnection1.Close;
    end;

  end;

  slParams.Free;
  slValues.Free;
  Event.Free;
end;

end.

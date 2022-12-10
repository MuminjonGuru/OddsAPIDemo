program TheOddsAPI;

uses
  System.StartUpCopy,
  FMX.Forms,
  TheOddsAPI.MainUnit in 'TheOddsAPI.MainUnit.pas' {FormOddsAPIDemo};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TFormOddsAPIDemo, FormOddsAPIDemo);
  Application.Run;
end.

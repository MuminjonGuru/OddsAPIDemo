unit TheOddsAPI.MainUnit;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.Controls.Presentation, FMX.Edit, FMX.StdCtrls, FMX.Memo.Types,
  FMX.ScrollBox, FMX.Memo, REST.Types, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, System.Rtti, FMX.Grid.Style, Fmx.Bind.Grid,
  System.Bindings.Outputs, Fmx.Bind.Editors, Data.Bind.Controls,
  Data.Bind.EngExt, Fmx.Bind.DBEngExt, Data.Bind.Components, FMX.Layouts,
  Fmx.Bind.Navigator, Data.Bind.Grid, FMX.Grid, Data.Bind.DBScope, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, REST.Response.Adapter, REST.Client,
  Data.Bind.ObjectScope;

type
  TFormOddsAPIDemo = class(TForm)
    EditSport: TEdit;
    EditTime: TEdit;
    EditMarkets: TEdit;
    EditFormat: TEdit;
    EditRegion: TEdit;
    BtnGetOdds: TButton;
    Memo1: TMemo;
    RESTClient1: TRESTClient;
    RESTRequest1: TRESTRequest;
    RESTResponse1: TRESTResponse;
    RESTResponseDataSetAdapter1: TRESTResponseDataSetAdapter;
    FDMemTable1: TFDMemTable;
    BindSourceDB1: TBindSourceDB;
    GridBindSourceDB1: TGrid;
    LinkGridToDataSourceBindSourceDB1: TLinkGridToDataSource;
    NavigatorBindSourceDB1: TBindNavigator;
    BindingsList1: TBindingsList;
    RESTClient2: TRESTClient;
    RESTResponse2: TRESTResponse;
    RESTRequest2: TRESTRequest;
    StyleBook1: TStyleBook;
    procedure BtnGetOddsClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormOddsAPIDemo: TFormOddsAPIDemo;

implementation

{$R *.fmx}

uses
  System.Threading;

procedure TFormOddsAPIDemo.BtnGetOddsClick(Sender: TObject);
begin
  TTask.Run(
    procedure
    begin
      var Sport      := EditSport.Text;
      var DateFormat := EditTime.Text;
      var Markets    := EditMarkets.Text;
      var OddsFormat := EditFormat.Text;
      var Region     := EditRegion.Text;

      RESTClient2.ResetToDefaults;
      RESTClient2.Accept := 'application/json, text/plain; q=0.9, text/html;q=0.8,';
      RESTClient2.AcceptCharset := 'utf-8, *;q=0.8';
      RESTClient2.BaseURL := 'https://api.apilayer.com/odds/sports/' 
        + Sport + '/odds'
        + '?regions='    + Region
        + '&oddsFormat=' + OddsFormat 
        + '&markets='    + Markets 
        + '&dateFormat=' + DateFormat
        + '&apikey=pgSU7ZuWkurGFaht6eAwF4Zg9VGWSZoy';
      RESTClient2.ContentType := 'application/json';

      // send request
      RESTRequest2.Execute;
    end);

  Memo1.Lines.Clear;
  Memo1.Lines.Add(RESTResponse2.Content);
end;

procedure TFormOddsAPIDemo.FormCreate(Sender: TObject);
begin
  RESTRequest1.Execute;  
end;

end.

unit PesaMais.View.Pages.Main;

interface

uses
  System.SysUtils,
  System.Types,
  System.UITypes,
  System.Classes,
  System.Variants,
  FMX.Types,
  FMX.Controls,
  FMX.Forms,
  FMX.Graphics,
  FMX.Dialogs,
  FMX.Controls.Presentation,
  FMX.StdCtrls,
  FMX.Objects,
  FMX.Layouts,
  Router4D.Interfaces;

type
  TFormMain = class(TForm, iRouter4DComponent)
    Layout1: TLayout;
    Rectangle1: TRectangle;
    Label1: TLabel;

  private
    { Private declarations }
  public
    { Public declarations }
    function Render : TFMXObject;
    procedure UnRender;
  end;

var
  FormMain: TFormMain;

implementation

{$R *.fmx}

{ TFormMain }

function TFormMain.Render: TFMXObject;
begin
  Result := Layout1;
end;

procedure TFormMain.UnRender;
begin

end;

end.

unit PesaMais.View.Pages.Main;

interface

uses
  { System }
  System.SysUtils,
  System.Types,
  System.UITypes,
  System.Classes,
  System.Variants,

  { FMX }
  FMX.Types,
  FMX.Controls,
  FMX.Forms,
  FMX.Graphics,
  FMX.Dialogs,
  FMX.Controls.Presentation,
  FMX.StdCtrls,
  FMX.Objects,
  FMX.Layouts;

type
  TFormMain = class(TForm)
    Layout1: TLayout;
    Rectangle1: TRectangle;
    Label1: TLabel;

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormMain: TFormMain;

implementation

{$R *.fmx}

{ TFormMain }

end.

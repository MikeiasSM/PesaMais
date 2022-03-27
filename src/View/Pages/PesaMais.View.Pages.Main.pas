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
  FMX.Layouts, Skia.FMX;

type
  TFormMain = class(TForm)
    Layout1: TLayout;
    Rectangle1: TRectangle;
    Label1: TLabel;
    LayoutPrincipal: TRectangle;
    procedure FormCreate(Sender: TObject);

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

procedure TFormMain.FormCreate(Sender: TObject);
  var
  animation: TSkAnimatedImage;
begin
  animation := TSkAnimatedImage.Create(Self);
  animation.LoadFromFile('C:\Users\mikei\Documents\Projetos\PesaMais\assets\dash_animated.json');
  animation.Parent := Self.LayoutPrincipal;
  animation.Align := TAlignLayout.Center;
  animation.Size.Width := 800;
  animation.Size.Height := 800;
  //animation.Size.Width := LayoutPrincipal.Size.Width;
  //animation.Size.Height := LayoutPrincipal.Size.Height;
end;

end.

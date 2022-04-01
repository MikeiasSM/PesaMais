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
  FMX.Layouts, Skia.FMX, FMX.Ani;

type
  TFormMain = class(TForm)
    Layout1: TLayout;
    Rectangle1: TRectangle;
    Label1: TLabel;
    Rectangle14: TRectangle;
    RectAnimation1: TRectAnimation;
    Rectangle2: TRectangle;
    Rectangle3: TRectangle;
    Rectangle4: TRectangle;
    Rectangle5: TRectangle;
    Rectangle6: TRectangle;
    Rectangle7: TRectangle;
    Rectangle8: TRectangle;
    LayoutPrincipal: TRectangle;
    Rectangle9: TRectangle;
    Rectangle11: TRectangle;
    Rectangle12: TRectangle;
    Rectangle13: TRectangle;
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
  //animation.LoadFromFile('C:\PesaMais\Source\assets\dash_animated.json');
  //animation.Parent := Self.LayoutPrincipal;
  //animation.Align := TAlignLayout.Center;
  //animation.Size.Width := 200;
  //animation.Size.Height := 200;
  //animation.Size.Width := LayoutPrincipal.Size.Width;
  //animation.Size.Height := LayoutPrincipal.Size.Height;
end;

end.

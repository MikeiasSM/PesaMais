unit PesaMais.View.Pages.Template;

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
  FMX.Objects,
  FMX.Layouts,
  FMX.Edit,
  FMX.StdCtrls,
  FMX.Controls.Presentation,
  FMX.ListBox,
  System.ImageList,
  FMX.ImgList,
  Bind4D, Router4D.Interfaces, PesaMais.View.Pages.CadUsuario;

type
  TFormTemplate = class(TForm, iRouter4DComponent)
    Layout1: TLayout;
    Rectangle1: TRectangle;
    Rectangle2: TRectangle;
    Rectangle3: TRectangle;
    Rectangle4: TRectangle;
    Rectangle5: TRectangle;
    ListBox1: TListBox;
    btnImprimir: TSpeedButton;
    lblNomeTela: TLabel;
    Rectangle6: TRectangle;
    ImageList1: TImageList;
    StyleBook1: TStyleBook;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
  private
    { Private declarations }
    FEndPoint : String;
    FPK : String;
    FTitle : String;
    FSort : String;
    FOrder : String;
    FormUsuario : TFormUsuario;
  public
    { Public declarations }
    function Render : TFMXObject;
    procedure UnRender;
  end;

var
  FormTemplate: TFormTemplate;

implementation

{$R *.fmx}

function TFormTemplate.Render: TFMXObject;
begin
  Result := Layout1;
end;

procedure TFormTemplate.SpeedButton1Click(Sender: TObject);
begin
  FormUsuario := TFormUsuario.Create(nil);

  FormUsuario.ShowModal();

end;

procedure TFormTemplate.SpeedButton2Click(Sender: TObject);
begin
  Self.Close;
end;

procedure TFormTemplate.UnRender;
begin

end;

end.

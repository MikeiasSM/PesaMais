unit PesaMais.View.Dialog.Messages;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Objects,
  FMX.Layouts, FMX.Controls.Presentation, FMX.StdCtrls, Skia.FMX, FMX.Effects;

type

  TMessages = (tpInformation, tpWarning, tpError);

  TFormMessage = class(TForm)
    Layout1: TLayout;
    Rectangle1: TRectangle;
    Rectangle2: TRectangle;
    Rectangle3: TRectangle;
    Rectangle4: TRectangle;
    Rectangle5: TRectangle;
    lblTitulo: TLabel;
    Line1: TLine;
    lblSubTitulo: TLabel;
    btnSalvar: TSpeedButton;
    Image1: TImage;
    LayoutAnimacao: TLayout;
    ShadowEffect1: TShadowEffect;
    ShadowEffect2: TShadowEffect;
    procedure btnSalvarClick(Sender: TObject);
  private
    { Private declarations }
    FTitulo : String;
    FSubTitulo : String;
    FType : TMessages;
  public
    { Public declarations }
    procedure ShowDialog(Titulo, SubTitulo : String; TypeMessage : TMessages);
  end;

var
  FormMessage: TFormMessage;

implementation

{$R *.fmx}

procedure TFormMessage.btnSalvarClick(Sender: TObject);
begin
  close;
end;

procedure TFormMessage.ShowDialog(Titulo, SubTitulo: String; TypeMessage: TMessages);
var
  animation: TSkAnimatedImage;
begin
  try
    FTitulo := Titulo;
    FSubTitulo := SubTitulo;
    FType := TypeMessage;

    lblTitulo.Text := FTitulo;
    lblSubTitulo.Text := FSubTitulo;
    animation := TSkAnimatedImage.Create(Self);

    if FType = tpInformation then begin
      animation.LoadFromFile('C:\PesaMais\Source\assets\success.json')
    end;
    if FType = tpWarning then begin
      animation.LoadFromFile('C:\PesaMais\Source\assets\warning.json')
    end;
    if FType = tpError then begin
      animation.LoadFromFile('C:\PesaMais\Source\assets\failed.json')
    end;

    animation.Parent := Self.LayoutAnimacao;
    animation.Align := TAlignLayout.Client;
    animation.Loop := false;
    Self.ShowModal;
  finally
    animation.Free;
  end;

end;

end.

unit PesaMais.View.Pages.Pessoa;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants, 
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  PesaMais.View.Pages.Template, System.Rtti, FMX.Grid.Style, System.Actions,
  FMX.ActnList, FMX.TabControl, System.ImageList, FMX.ImgList, FMX.Edit,
  FMX.Objects, FMX.Effects, FMX.Grid, FMX.ScrollBox, FMX.Controls.Presentation,
  FMX.Layouts, FMX.DateTimeCtrls, FMX.Memo.Types, FMX.Memo;

type
  TFormPessoa = class(TFormTemplate)
    txtCodigo: TEdit;
    Código: TLabel;
    txtNome: TEdit;
    Label7: TLabel;
    Edit2: TEdit;
    Label1: TLabel;
    Edit3: TEdit;
    Label2: TLabel;
    RecCodigo: TRectangle;
    CheckBox1: TCheckBox;
    CheckBox3: TCheckBox;
    CheckBox4: TCheckBox;
    DateEdit1: TDateEdit;
    DateEdit2: TDateEdit;
    Label3: TLabel;
    Label4: TLabel;
    RecCadastro: TRectangle;
    CheckBox2: TCheckBox;
    Edit4: TEdit;
    Label5: TLabel;
    Edit6: TEdit;
    Label8: TLabel;
    Edit5: TEdit;
    Label6: TLabel;
    Edit7: TEdit;
    Label9: TLabel;
    Edit8: TEdit;
    Label10: TLabel;
    Edit9: TEdit;
    Label11: TLabel;
    RecEnderecos: TRectangle;
    Memo1: TMemo;
    Label12: TLabel;
    btnInserir: TSpeedButton;
    Image5: TImage;
    SpeedButton1: TSpeedButton;
    Image6: TImage;
    StringGrid1: TStringGrid;
    Rectangle15: TRectangle;
    Label13: TLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormPessoa: TFormPessoa;

implementation

{$R *.fmx}

end.

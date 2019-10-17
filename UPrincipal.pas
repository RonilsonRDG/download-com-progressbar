unit UPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, IdBaseComponent, IdComponent,
  IdTCPConnection, IdTCPClient, IdHTTP, Vcl.StdCtrls, Vcl.ComCtrls, Vcl.ExtCtrls;

type
  TForm2 = class(TForm)
    edtlinkarquivo: TLabeledEdit;
    btndownload: TButton;
    ProgressBar1: TProgressBar;
    label1: TLabel;
    IdHTTP1: TIdHTTP;
    edtnomearquivo: TLabeledEdit;
    procedure btndownloadClick(Sender: TObject);
    procedure IdHTTP1Work(ASender: TObject; AWorkMode: TWorkMode;
      AWorkCount: Int64);
    procedure IdHTTP1WorkBegin(ASender: TObject; AWorkMode: TWorkMode;
      AWorkCountMax: Int64);
    procedure IdHTTP1WorkEnd(ASender: TObject; AWorkMode: TWorkMode);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form2: TForm2;

implementation

{$R *.dfm}

procedure TForm2.btndownloadClick(Sender: TObject);
var
 arquivo,caminho : string;
 MyFile: TFileStream;
begin
// definir o link
 caminho:=edtlinkarquivo.Text;  // Link para download do arquivo
 arquivo:= edtnomearquivo.text; // nome do arquivo a ser salvo
 MyFile := TFileStream.Create('C:\pasta\'+arquivo, fmCreate); // local no hd e nome do arquivo com a extensão, onde vai ser salvo.
  try
    IdHTTP1.Get(caminho, MyFile); // fazendo o download do arquivo
  finally
    MyFile.Free;
  end;

end;
procedure TForm2.IdHTTP1Work(ASender: TObject; AWorkMode: TWorkMode;
  AWorkCount: Int64);
begin
  ProgressBar1.Position := AWorkCount;
end;

procedure TForm2.IdHTTP1WorkBegin(ASender: TObject; AWorkMode: TWorkMode;
  AWorkCountMax: Int64);
begin
  ProgressBar1.Position := 0;
  ProgressBar1.Max := AWorkCountMax;
  Label1.caption :=  'Download em andamente, espere!';
end;

procedure TForm2.IdHTTP1WorkEnd(ASender: TObject; AWorkMode: TWorkMode);
begin
  ProgressBar1.Position := ProgressBar1.Max;
  Label1.caption := 'Download Concluído!';
end;

end.

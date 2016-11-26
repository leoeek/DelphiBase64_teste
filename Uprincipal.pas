unit Uprincipal;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, jpeg, ExtCtrls, StdCtrls, Buttons, Soap.EncdDecd, Vcl.ExtDlgs;

type
  TForm1 = class(TForm)
    img: TImage;
    memo: TMemo;
    btEncode: TButton;
    btDecode: TButton;
    opImage: TOpenPictureDialog;
    img2: TImage;
    OpenDialog1: TOpenDialog;
    Button1: TButton;
    Button2: TButton;
    procedure btEncodeClick(Sender: TObject);
    procedure btDecodeClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    arquivoAqui: sTring;
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}


procedure TForm1.btEncodeClick(Sender: TObject);
var
  stream: TMemoryStream;
  lConteudo: String;
  f: TextFile;
begin
  if (opImage.Execute) then
  begin
    stream := TMemoryStream.Create;
    try
      stream.LoadFromFile(opImage.FileName);
      img.Picture.LoadFromFile(opImage.FileName);
      lConteudo := EncodeBase64(stream.Memory, stream.Size);
      AssignFile(f,'C:\temp\arquivo_qualquer.txt');
      Rewrite(f);
      Writeln(f,lConteudo);
      Closefile(f);
      memo.Lines.Clear;
      memo.Lines.Add(lConteudo);
    finally
      stream.Free;
    end;
  end;
end;

procedure TForm1.Button1Click(Sender: TObject);
var
  stream: TMemoryStream;
  lConteudo: String;
  f: TextFile;
begin
  if (OpenDialog1.Execute) then
  begin
    stream := TMemoryStream.Create;
    try
      stream.LoadFromFile(OpenDialog1.FileName);
      lConteudo := EncodeBase64(stream.Memory, stream.Size);
      AssignFile(f,'C:\temp\arquivo_qualquer.txt');
      Rewrite(f);
      Writeln(f,lConteudo);
      Closefile(f);
      memo.Lines.Clear;
      memo.Lines.Add(lConteudo);
    finally
      stream.Free;
    end;
  end;
end;

procedure TForm1.Button2Click(Sender: TObject);
var
  Stream: TMemoryStream;
  lConteudo: String;
  arquivo: TStringList;
  Data: TBytes;
begin
  Stream := TMemoryStream.Create;
  try
    arquivo := TStringList.Create;
    arquivo.Text := memo.Text;
    SetLength(Data, Arquivo.Text.Length);
    Data := DecodeBase64(arquivo.Text);
    stream.WriteBuffer(data[0], length(data));
    stream.SaveToFile('c:\temp\arquivogerado.pdf');
  finally
    Stream.Free;
    arquivo.Free;
  end;
end;

procedure TForm1.btDecodeClick(Sender: TObject);
var
  Stream: TMemoryStream;
  lConteudo: String;
  arquivo: TStringList;
  Data: TBytes;
begin
  Stream := TMemoryStream.Create;
  try
    arquivo := TStringList.Create;
    arquivo.Text := memo.Text;
    SetLength(Data, Arquivo.Text.Length);
    Data := DecodeBase64(arquivo.Text);
    stream.WriteBuffer(data[0], length(data));
    stream.SaveToFile('c:\temp\arquivogerado.jpg');
    img2.Picture.LoadFromFile('c:\temp\arquivogerado.jpg');
  finally
    Stream.Free;
    arquivo.Free;
  end;
end;

end.

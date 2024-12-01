unit Unit1;

//{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls;

type

  { TForm1 }

  TForm1 = class(TForm)
    BtnPesanlagi: TButton;
    BtnHapus: TButton;
    ComboBoxDestinasi: TComboBox;
    ComboBoxKelas: TComboBox;
    EditJumlah: TEdit;
    BtnCetak: TButton;
    BtnKeluar: TButton;
    lblprogram: TLabel;
    lblsapa5: TLabel;
    MemoHasil: TMemo;
    LabelDestinasi: TLabel;
    LabelKelas: TLabel;
    LabelJumlah: TLabel;
    procedure BtnBayarClick(Sender: TObject);
    procedure BtnCetakClick(Sender: TObject);
    procedure BtnKeluarClick(Sender: TObject);
    procedure BtnHapusClick(Sender: TObject);
    procedure ComboBoxDestinasiChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure MemoHasilChange(Sender: TObject);
  private
    procedure TampilkanHasil(Destinasi, Kelas: string; Jumlah, Total: Integer);
    function HitungHarga(Destinasi, Kelas: string): Integer;
  public
  end;

var
  Form1: TForm1;
  TotalKeseluruhan, TotalHarga : integer;

implementation

{$R *.lfm}


procedure TForm1.FormCreate(Sender: TObject);
begin

  ComboBoxDestinasi.Items.Add('Siantar');
  ComboBoxDestinasi.Items.Add('Tebing Tinggi');
  ComboBoxDestinasi.Items.Add('Kisaran');


  ComboBoxKelas.Items.Add('VIP');
  ComboBoxKelas.Items.Add('Bisnis');
  ComboBoxKelas.Items.Add('Ekonomi');
end;

procedure TForm1.MemoHasilChange(Sender: TObject);
begin

end;

function TForm1.HitungHarga(Destinasi, Kelas: string): Integer;
begin
  if (Destinasi = 'Siantar') and (Kelas = 'VIP') then
    Result := 500000
  else if (Destinasi = 'Siantar') and (Kelas = 'Bisnis') then
    Result := 350000
  else if (Destinasi = 'Siantar') and (Kelas = 'Ekonomi') then
    Result := 200000
  else if (Destinasi = 'Tebing Tinggi') and (Kelas = 'VIP') then
    Result := 400000
  else if (Destinasi = 'Tebing Tinggi') and (Kelas = 'Bisnis') then
    Result := 250000
  else if (Destinasi = 'Tebing Tinggi') and (Kelas = 'Ekonomi') then
    Result := 150000
  else if (Destinasi = 'Kisaran') and (Kelas = 'VIP') then
    Result := 600000
  else if (Destinasi = 'Kisaran') and (Kelas = 'Bisnis') then
    Result := 450000
  else if (Destinasi = 'Kisaran') and (Kelas = 'Ekonomi') then
    Result := 300000
  else
    Result := 0;
end;

procedure TForm1.TampilkanHasil(Destinasi, Kelas: string; Jumlah, Total: Integer);
begin
  MemoHasil.Lines.Add('-------- Tiket Kereta Api --------');
  MemoHasil.Lines.Add('');
  MemoHasil.Lines.Add('Destinasi   : Medan -> ' + Destinasi);
  MemoHasil.Lines.Add('Kelas       : ' + Kelas);
  MemoHasil.Lines.Add('Jumlah Tiket: ' + IntToStr(Jumlah));
  MemoHasil.Lines.Add('Total Harga : Rp.' + IntToStr(Total));
  MemoHasil.Lines.Add('');
  MemoHasil.Lines.Add('Total Keseluruhan: Rp.' + IntToStr(TotalKeseluruhan));
  MemoHasil.Lines.Add('');
end;

procedure TForm1.BtnCetakClick(Sender: TObject);
var
  Destinasi, Kelas: string;
  JumlahTiket, HargaTiket: Integer;
begin
  if (ComboBoxDestinasi.ItemIndex = -1) or (ComboBoxKelas.ItemIndex = -1) then
  begin
    ShowMessage('Silakan pilih destinasi dan kelas terlebih dahulu!');
    Exit;
  end;

  if EditJumlah.Text = '' then
  begin
    ShowMessage('Silakan masukkan jumlah tiket!');
    Exit;
  end;

  Destinasi := ComboBoxDestinasi.Text;
  Kelas := ComboBoxKelas.Text;
  JumlahTiket := StrToIntDef(EditJumlah.Text, 0);

  if JumlahTiket <= 0 then
  begin
    ShowMessage('Jumlah tiket harus lebih dari 0!');
    Exit;
  end;

  HargaTiket := HitungHarga(Destinasi, Kelas);
  TotalHarga := HargaTiket * JumlahTiket;
  TotalKeseluruhan := TotalKeseluruhan + TotalHarga;


  TampilkanHasil(Destinasi, Kelas, JumlahTiket, TotalHarga);

  EditJumlah.Text := '';
  BtnCetak.Caption := 'Pesan Lagi';

end;

procedure TForm1.BtnBayarClick(Sender: TObject);
begin
  showmessage('Pemb');
end;


procedure TForm1.BtnKeluarClick(Sender: TObject);
begin
  showmessage('Terima Kasih Telah menggunakan layanan kami!');
  Close;
end;

procedure TForm1.BtnHapusClick(Sender: TObject);
begin
  MemoHasil.Clear;
  TotalKeseluruhan := 0;
  BtnCetak.Caption :='Cetak';

end;


procedure TForm1.ComboBoxDestinasiChange(Sender: TObject);
begin

end;

end.


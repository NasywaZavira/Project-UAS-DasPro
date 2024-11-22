program PemesananTiketKereta;

uses crt;

const
    // Harga tiket untuk setiap destinasi dan kelas (row: destinasi, col: kelas)
    HargaTiket: array[1..3, 1..3] of LongInt = (
        (500000, 350000, 200000),  // Medan -> Siantar (VIP, Bisnis, Ekonomi)
        (400000, 250000, 150000),  // Medan -> Tebing Tinggi
        (600000, 450000, 300000)   // Medan -> Kisaran
    );
    Destinasi: array[1..3] of string = ('Siantar', 'Tebing Tinggi', 'Kisaran');
    Kelas: array[1..3] of string = ('VIP', 'Bisnis', 'Ekonomi');

var
    PilihanDestinasi, PilihanKelas, JumlahTiket: integer;
    TotalHarga: LongInt;
    Lanjut: char;

procedure TampilkanDestinasi;
var
    i: integer;
begin
    writeln('Pilihan Destinasi:');
    for i := 1 to 3 do
        writeln(i, '. Medan -> ', Destinasi[i]);
end;

procedure TampilkanKelas;
var
    i: integer;
begin
    writeln('Pilihan Kelas:');
    for i := 1 to 3 do
        writeln(i, '. ', Kelas[i]);
end;

function HitungTotalHarga(Destinasi, Kelas, Jumlah: integer): LongInt;
begin
    HitungTotalHarga := HargaTiket[Destinasi, Kelas] * Jumlah;
end;

procedure CetakTiket(DestinasiIndex, KelasIndex, Jumlah: integer; Total: LongInt);
begin
    writeln('=====================================');
    writeln('          Tiket Kereta Api           ');
    writeln('=====================================');
    writeln('Destinasi   : Medan -> ', Destinasi[DestinasiIndex]);
    writeln('Kelas       : ', Kelas[KelasIndex]);
    writeln('Jumlah Tiket: ', Jumlah);
    writeln('Total Harga : Rp', Total);
    writeln('=====================================');
end;

begin
    clrscr;
    repeat
        writeln('=== Program Pemesanan Tiket Kereta Api ===');

        TampilkanDestinasi;
        write('Pilih Destinasi (1-3): ');
        readln(PilihanDestinasi);
        while (PilihanDestinasi < 1) or (PilihanDestinasi > 3) do
        begin
            writeln('Pilihan tidak valid, coba lagi.');
            write('Pilih Destinasi (1-3): ');
            readln(PilihanDestinasi);
        end;

        TampilkanKelas;
        write('Pilih Kelas (1-3): ');
        readln(PilihanKelas);
        while (PilihanKelas < 1) or (PilihanKelas > 3) do
        begin
            writeln('Pilihan tidak valid, coba lagi.');
            write('Pilih Kelas (1-3): ');
            readln(PilihanKelas);
        end;

        write('Masukkan Jumlah Tiket: ');
        readln(JumlahTiket);
        while JumlahTiket < 1 do
        begin
            writeln('Jumlah tiket harus lebih dari 0.');
            write('Masukkan Jumlah Tiket: ');
            readln(JumlahTiket);
        end;

        TotalHarga := HitungTotalHarga(PilihanDestinasi, PilihanKelas, JumlahTiket);

        CetakTiket(PilihanDestinasi, PilihanKelas, JumlahTiket, TotalHarga);

        writeln('Apakah Anda ingin memesan lagi? (Y/N)');
        readln(Lanjut);
    until (Lanjut = 'N') or (Lanjut = 'n');

    writeln('Terima kasih telah menggunakan layanan kami!');
end.
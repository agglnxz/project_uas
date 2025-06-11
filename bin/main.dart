// main.dart
import 'dart:io';

import 'data_tim.dart';
import 'jadwal_latihan.dart';
import 'antrian_posisi.dart';
import 'riwayat_latihan.dart';

void main() {
  List<Tim> daftarTim = inisialisasiTim();
  JadwalLatihan jadwalLatihan = JadwalLatihan();
  AntrianPosisi antrian = AntrianPosisi();
  RiwayatLatihan riwayat = RiwayatLatihan();

  while (true) {
    print('\n=== MENU UTAMA ===');
    print('1. Lihat Daftar Tim & Pemain');
    print('2. Lihat Jadwal Latihan');
    print('3. Tambah Jadwal Latihan');
    print('4. Tambah Antrian Ganti Posisi');
    print('5. Proses Antrian Ganti Posisi');
    print('6. Tandai Latihan Selesai');
    print('7. Lihat Riwayat Latihan');
    print('0. Keluar');
    stdout.write('Pilih menu: ');
    String? pilihan = stdin.readLineSync();

    switch (pilihan) {
      case '1':
        tampilkanTim(daftarTim);
        break;
      case '2':
        jadwalLatihan.tampilkan();
        break;
      case '3':
        tambahJadwalInteraktif(jadwalLatihan);
        break;
      case '4':
        tambahAntrianInteraktif(antrian);
        break;
      case '5':
        antrian.prosesGantiPosisi(daftarTim);
        break;
      case '6':
        tandaiLatihanSelesai(jadwalLatihan, riwayat);
        break;
      case '7':
        riwayat.tampilkan();
        break;
      case '0':
        print('Terima kasih!');
        return;
      default:
        print('Pilihan tidak valid.');
    }
  }
}

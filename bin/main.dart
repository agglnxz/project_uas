import 'dart:io';

import 'package:project_uas/data_tim.dart';
import 'package:project_uas/class_tim.dart';

import 'tambah_tim.dart';
import 'tambah_pemain.dart';
import 'jadwal_latihan.dart';
import 'fitur_jadwal.dart'; // ← Tambahkan ini
import 'riwayat_latihan.dart'; // Pastikan file ini mendefinisikan class RiwayatLatihan

void tandaiLatihanSelesai(JadwalLatihan jadwal, RiwayatLatihan riwayat) {
  // Contoh implementasi sederhana
  print('Latihan pada hari ${jadwal.hari} jam ${jadwal.jam} telah selesai.');
  riwayat.tambahRiwayat(jadwal);
}

void main() {
  DataTim data = DataTim();
  JadwalLatihan jadwalLatihan = JadwalLatihan(hari: 'Senin', jam: '08:00');
  ManajemenJadwal manajemenJadwal = ManajemenJadwal(); // ← Tambahkan ini
  RiwayatLatihan riwayat = RiwayatLatihan();

  while (true) {
    print('\n=== MENU UTAMA ===');
    print('1. Tambah Tim');
    print('2. Tambah Pemain ke Tim');
    print('3. Lihat Daftar Tim');
    print('4. Tambah Jadwal Latihan'); // ← Update menu
    print('5. Lihat Jadwal Latihan');  // ← Update menu
    print('6. Tandai Latihan Selesai');
    print('7. Lihat Riwayat Latihan');
    print('0. Keluar');
    stdout.write('Pilih menu: ');
    String? pilihan = stdin.readLineSync();

    switch (pilihan) {
      case '1':
        tambahTim(data);
        break;
      case '2':
        tambahPemainKeTim(data);
        break;
      case '3':
        tampilkanDaftarTim(data);
        break;
      case '4':
        manajemenJadwal.tambahJadwal(); // ← Tambah jadwal latihan
        break;
      case '5':
        manajemenJadwal.tampilkanJadwal(); // ← Tampilkan jadwal latihan
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

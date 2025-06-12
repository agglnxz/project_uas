// main.dart
import 'dart:io';

import 'package:project_uas/data_tim.dart';
import 'package:project_uas/class_tim.dart';

import 'tambah_tim.dart';
import 'tambah_pemain.dart';
import 'jadwal_latihan.dart';
//import 'antrian_posisi.dart';
import 'riwayat_latihan.dart';


void main() {
  DataTim data = DataTim();
  JadwalLatihan jadwalLatihan = JadwalLatihan();
  //AntrianPosisi antrian = AntrianPosisi();
  RiwayatLatihan riwayat = RiwayatLatihan();

  while (true) {
    print('\n=== MENU UTAMA ===');
    print('1. Tambah Tim');
    print('2. Tambah Pemain ke Tim');
    print('3. Lihat Daftar Tim');
    print('4. ');
    print('5. ');
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
       
        break;
      case '5':
    
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

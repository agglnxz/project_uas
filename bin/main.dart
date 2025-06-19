import 'dart:io';

import 'package:project_uas/data_tim.dart';
import 'package:project_uas/class_tim.dart';

import 'tambah_tim.dart';
import 'tambah_pemain.dart';
import 'jadwal_latihan.dart';
import 'fitur_jadwal.dart'; // ← Tambahkan ini
import 'riwayat_latihan.dart'; // Pastikan file ini mendefinisikan class RiwayatLatihan

void main() {
  DataTim data = DataTim();
  RiwayatLatihan riwayat = RiwayatLatihan();
  ManajemenJadwal manajemenJadwal = ManajemenJadwal(data); // ← Tambahkan argumen kedua

  while (true) {
    print('\n=== MENU UTAMA ===');
    print('1. Tambah Tim');
    print('2. Tambah Pemain ke Tim');
    print('3. Lihat Daftar Tim & Pemain');
    print('4. Tambah Jadwal Latihan'); // ← Update menu
    print('5. Lihat Jadwal Latihan'); // ← Update menu
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
        // tampilkan daftar tim dan jadwalnya
        if (data.isEmpty()) {
          print('Belum ada tim terdaftar.');
          break;
        }

        Node? current = data.head;
        int index = 1;
        List<String> daftarNamaTim = [];

        print('\nPilih Tim yang akan menyelesaikan latihan:');
        while (current != null) {
          print('$index. ${current.data.namaTim}');
          daftarNamaTim.add(current.data.namaTim);
          current = current.next;
          index++;
        }

        stdout.write('Nomor tim: ');
        int? noTim = int.tryParse(stdin.readLineSync() ?? '');
        if (noTim == null || noTim < 1 || noTim > daftarNamaTim.length) {
          print('Pilihan tidak valid.');
          break;
        }

        String namaTim = daftarNamaTim[noTim - 1];
        List<JadwalLatihan>? daftarJadwal = manajemenJadwal.jadwalMap[namaTim];

        if (daftarJadwal == null || daftarJadwal.isEmpty) {
          print('Tim ini belum memiliki jadwal.');
          break;
        }

        print('\nPilih Jadwal yang telah selesai:');
        for (int i = 0; i < daftarJadwal.length; i++) {
          print('${i + 1}. ${daftarJadwal[i].hari}, ${daftarJadwal[i].jam}');
        }

        stdout.write('Nomor jadwal: ');
        int? noJadwal = int.tryParse(stdin.readLineSync() ?? '');
        if (noJadwal == null ||
            noJadwal < 1 ||
            noJadwal > daftarJadwal.length) {
          print('Pilihan tidak valid.');
          break;
        }

        JadwalLatihan dipilih = daftarJadwal[noJadwal - 1];
        manajemenJadwal.tandaiLatihanSelesai(namaTim, dipilih, riwayat);
        daftarJadwal.removeAt(
          noJadwal - 1,
        ); // hapus dari jadwal setelah ditandai selesai
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

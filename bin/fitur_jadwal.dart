// File: fitur_jadwal.dart
import 'dart:io';
import 'jadwal_latihan.dart';
import 'riwayat_latihan.dart';
import 'package:project_uas/data_tim.dart';
import 'package:project_uas/class_tim.dart';

class ManajemenJadwal {
  Map<String, List<JadwalLatihan>> jadwalMap = {};
  DataTim dataTim;

  ManajemenJadwal( this.dataTim);

  void tambahJadwal() {

    if (dataTim.isEmpty()) {
      print('Tidak ada tim yang tersedia.');
      return;
    }
    // Tampilkan daftar tim
    print('\nDaftar Tim yang Tersedia:');
    Node? current = dataTim.head;
    int index = 1;
    List<Tim> daftarTim = []; 

    while (current != null) {
      print('$index. ${current.data.namaTim}');
      daftarTim.add(current.data);
      current = current.next;
      index++;
    }
    stdout.write('Pilih nomor tim: ');
    String? input = stdin.readLineSync();
    int? pilihan = int.tryParse(input ?? '');

    if (pilihan == null || pilihan < 1 || pilihan > daftarTim.length) {
      print('Pilihan tidak valid.');
      return;
    }

    Tim timDipilih = daftarTim[pilihan - 1];


    stdout.write('Masukkan hari latihan (cth: Senin): ');
    String? hari = stdin.readLineSync();

    stdout.write('Masukkan jam latihan (cth: 16.00-18.00): ');
    String? jam = stdin.readLineSync();

    if (hari == null || jam == null || hari.isEmpty || jam.isEmpty) {
      print('Hari dan jam tidak boleh kosong.');
      return;
    }

    JadwalLatihan jadwal = JadwalLatihan(hari: hari, jam: jam, tim: timDipilih);

    jadwalMap.putIfAbsent(timDipilih.namaTim, () => []);
    jadwalMap[timDipilih.namaTim]!.add(jadwal);


    print('Jadwal berhasil ditambahkan untuk tim "$timDipilih".');
  }

void tampilkanJadwal() {
  if (dataTim.isEmpty()) {
    print('Belum ada tim yang terdaftar.');
    return;
  }

  print('\nJadwal Latihan Semua Tim:');
  Node? current = dataTim.head;

  while (current != null) {
    Tim tim = current.data;
    print('\nTim: ${tim.namaTim}');

    if (jadwalMap.containsKey(tim.namaTim) && jadwalMap[tim.namaTim]!.isNotEmpty) {
      for (var j in jadwalMap[tim.namaTim]!) {
        print('- ${j.hari}, ${j.jam}');
      }
    } else {
      print('- Belum ada jadwal.');
    }

    current = current.next;
  }
}

void tandaiLatihanSelesai(String namaTim, JadwalLatihan jadwal, RiwayatLatihan riwayat) {
  print('Latihan tim "$namaTim" pada hari ${jadwal.hari} jam ${jadwal.jam} telah selesai.');
  riwayat.tambahRiwayat(jadwal);
}

  Map<String, List<JadwalLatihan>> get jadwal => jadwalMap;
}

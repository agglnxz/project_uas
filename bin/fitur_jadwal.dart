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

    String namaTim = daftarTim[pilihan - 1].namaTim;

    stdout.write('Masukkan hari latihan (cth: Senin): ');
    String? hari = stdin.readLineSync();

    stdout.write('Masukkan jam latihan (cth: 16.00-18.00): ');
    String? jam = stdin.readLineSync();

    if (hari == null || jam == null || hari.isEmpty || jam.isEmpty) {
      print('Hari dan jam tidak boleh kosong.');
      return;
    }

    JadwalLatihan jadwal = JadwalLatihan(hari: hari, jam: jam);
    jadwalMap.putIfAbsent(namaTim, () => []);
    jadwalMap[namaTim]!.add(jadwal);

    print('Jadwal berhasil ditambahkan untuk tim "$namaTim".');
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



  // void hapusJadwal() {
  //   stdout.write('Masukkan nama tim yang ingin dihapus jadwalnya: ');
  //   String? namaTim = stdin.readLineSync();

  //   if (namaTim == null || !jadwalMap.containsKey(namaTim)) {
  //     print('Tim tidak ditemukan.');
  //     return;
  //   }

  //   List<JadwalLatihan> jadwalList = jadwalMap[namaTim]!;

  //   for (int i = 0; i < jadwalList.length; i++) {
  //     print('${i + 1}. ${jadwalList[i]}');
  //   }

  //   stdout.write('Pilih nomor jadwal yang ingin dihapus: ');
  //   String? input = stdin.readLineSync();
  //   int? index = int.tryParse(input ?? '');

  //   if (index == null || index < 1 || index > jadwalList.length) {
  //     print('Nomor tidak valid.');
  //     return;
  //   }

  //   jadwalList.removeAt(index - 1);
  //   print('Jadwal berhasil dihapus.');
  // }

  Map<String, List<JadwalLatihan>> get jadwal => jadwalMap;
}

// File: fitur_jadwal.dart
import 'dart:io';
import 'jadwal_latihan.dart';

class ManajemenJadwal {
  final Map<String, List<JadwalLatihan>> _jadwalMap = {};

  void tambahJadwal() {
    stdout.write('Masukkan nama tim: ');
    String? namaTim = stdin.readLineSync();

    if (namaTim == null || namaTim.trim().isEmpty) {
      print('Nama tim tidak boleh kosong.');
      return;
    }

    stdout.write('Masukkan hari latihan (cth: Senin): ');
    String? hari = stdin.readLineSync();

    stdout.write('Masukkan jam latihan (cth: 16.00-18.00): ');
    String? jam = stdin.readLineSync();

    if (hari == null || jam == null || hari.isEmpty || jam.isEmpty) {
      print('Hari dan jam tidak boleh kosong.');
      return;
    }

    JadwalLatihan jadwal = JadwalLatihan(hari: hari, jam: jam);
    _jadwalMap.putIfAbsent(namaTim, () => []);
    _jadwalMap[namaTim]!.add(jadwal);

    print('Jadwal berhasil ditambahkan untuk tim "$namaTim".');
  }

  void tampilkanJadwal() {
    if (_jadwalMap.isEmpty) {
      print('Belum ada jadwal latihan.');
      return;
    }

    print('\n Jadwal Latihan Semua Tim:');
    _jadwalMap.forEach((tim, daftarJadwal) {
      print('\nTim: $tim');
      for (var j in daftarJadwal) {
        print('- ${j.hari}, ${j.jam}');
      }
    });
  }

  void hapusJadwal() {
    stdout.write('Masukkan nama tim yang ingin dihapus jadwalnya: ');
    String? namaTim = stdin.readLineSync();

    if (namaTim == null || !_jadwalMap.containsKey(namaTim)) {
      print('Tim tidak ditemukan.');
      return;
    }

    List<JadwalLatihan> jadwalList = _jadwalMap[namaTim]!;

    for (int i = 0; i < jadwalList.length; i++) {
      print('${i + 1}. ${jadwalList[i]}');
    }

    stdout.write('Pilih nomor jadwal yang ingin dihapus: ');
    String? input = stdin.readLineSync();
    int? index = int.tryParse(input ?? '');

    if (index == null || index < 1 || index > jadwalList.length) {
      print('Nomor tidak valid.');
      return;
    }

    jadwalList.removeAt(index - 1);
    print('Jadwal berhasil dihapus.');
  }

  Map<String, List<JadwalLatihan>> get jadwalMap => _jadwalMap;
}
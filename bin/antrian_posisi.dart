
import 'dart:collection';
import 'dart:io';
import 'data_tim.dart';

class AntrianPosisi {
  Queue<Map<String, String>> _antrian = Queue();

  void tambah(String nama, String posisiBaru) {
    _antrian.add({"nama": nama, "posisi": posisiBaru});
    print("Pemain $nama telah masuk antrian untuk pindah ke posisi $posisiBaru.");
  }

  void tampilkan() {
    if (_antrian.isEmpty) {
      print("Tidak ada antrian pindah posisi.");
    } else {
      print("\n=== Antrian Pindah Posisi ===");
      for (var item in _antrian) {
        print("- ${item['nama']} ingin pindah ke posisi ${item['posisi']}");
      }
    }
  }

  void prosesGantiPosisi(List<Tim> timList) {
    if (_antrian.isEmpty) {
      print("Tidak ada antrian untuk diproses.");
      return;
    }
    var item = _antrian.removeFirst();
    String nama = item["nama"]!;
    String posisiBaru = item["posisi"]!;

    for (var tim in timList) {
      for (var pemain in tim.daftarPemain) {
        if (pemain.nama == nama) {
          pemain.posisi = posisiBaru;
          print("Pemain $nama sekarang menjadi $posisiBaru di ${tim.namaTim}.");
          return;
        }
      }
    }
    print("Pemain $nama tidak ditemukan.");
  }
}

void tambahAntrianInteraktif(AntrianPosisi antrian) {
  print("\nTambah Antrian Ganti Posisi:");
  stdout.write("Nama Pemain: ");
  String? nama = stdin.readLineSync();
  stdout.write("Posisi Baru: ");
  String? posisi = stdin.readLineSync();

  if (nama != null && posisi != null) {
    antrian.tambah(nama, posisi);
  } else {
    print("Data tidak lengkap.");
  }
}

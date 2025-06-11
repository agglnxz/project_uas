import 'dart:io';
import 'riwayat_latihan.dart';
class JadwalNode {
  String tanggal;
  String jam;
  String tempat;
  String tim;
  JadwalNode? next;

  JadwalNode(this.tanggal, this.jam, this.tempat, this.tim);
}

class JadwalLatihan {
  JadwalNode? head;

  void tambah(String tanggal, String jam, String tempat, String tim) {
    JadwalNode newNode = JadwalNode(tanggal, jam, tempat, tim);
    if (head == null) {
      head = newNode;
    } else {
      JadwalNode current = head!;
      while (current.next != null) {
        current = current.next!;
      }
      current.next = newNode;
    }
    print("Jadwal latihan untuk $tim berhasil ditambahkan.");
  }

  void tampilkan() {
    if (head == null) {
      print("Belum ada jadwal latihan.");
      return;
    }
    JadwalNode? current = head;
    print("\n=== Jadwal Latihan ===");
    while (current != null) {
      print("- Tanggal: ${current.tanggal}, Jam: ${current.jam}, Tempat: ${current.tempat}, Tim: ${current.tim}");
      current = current.next;
    }
  }

  String? selesaikanLatihan() {
    if (head == null) return null;
    String info = "Latihan ${head!.tim} pada tanggal ${head!.tanggal} telah selesai.";
    head = head!.next;
    return info;
  }
}

void tambahJadwalInteraktif(JadwalLatihan jadwal) {
  print("\nTambah Jadwal Latihan:");
  stdout.write("Tanggal (YYYY-MM-DD): ");
  String? tanggal = stdin.readLineSync();
  stdout.write("Jam (HH:MM): ");
  String? jam = stdin.readLineSync();
  stdout.write("Tempat: ");
  String? tempat = stdin.readLineSync();
  stdout.write("Tim yang latihan: ");
  String? tim = stdin.readLineSync();

  if (tanggal != null && jam != null && tempat != null && tim != null) {
    jadwal.tambah(tanggal, jam, tempat, tim);
  } else {
    print("Data tidak lengkap.");
  }
}

void tandaiLatihanSelesai(JadwalLatihan jadwal, RiwayatLatihan riwayat) {
  String? info = jadwal.selesaikanLatihan();
  if (info != null) {
    print("\n$info");
    riwayat.tambah(info);
  } else {
    print("\nTidak ada latihan yang sedang berjalan.");
  }
}

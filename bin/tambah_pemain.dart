import 'dart:io';
import 'package:project_uas/class_pemain.dart';
import 'package:project_uas/class_tim.dart';
import 'package:project_uas/data_tim.dart';

void tambahPemainKeTim(DataTim dataTim) {
  stdout.write('Masukkan nama tim yang ingin ditambah pemain: ');
  String? namaTim = stdin.readLineSync();

  if (namaTim == null || namaTim.isEmpty) {
    print('Nama tim tidak boleh kosong.');
    return;
  }

  Tim? tim = cariTim(dataTim, namaTim);
  if (tim == null) {
    print('Tim "$namaTim" tidak ditemukan.');
    return;
  }

  stdout.write('Nama pemain: ');
  String? nama = stdin.readLineSync();
  stdout.write('Posisi pemain: ');
  String? posisi = stdin.readLineSync();
  stdout.write('Nomor punggung: ');
  String? nomorStr = stdin.readLineSync();
  int nomor = int.tryParse(nomorStr ?? '') ?? 0;

  if (nama == null || posisi == null || nama.isEmpty || posisi.isEmpty) {
    print('Data pemain tidak lengkap.');
    return;
  }

  Pemain pemain = Pemain(nama, posisi, nomor);
  tim.daftarPemain.add(pemain);

  print('Pemain "$nama" berhasil ditambahkan ke tim "$namaTim".');
}

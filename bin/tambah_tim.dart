import 'dart:io';
import 'package:project_uas/data_tim.dart';
import 'package:project_uas/class_tim.dart';

void tambahTim(DataTim dataTim) {
  // inputan nama tim
  print("Masukkan nama tim baru:");
  String? namaTim = stdin.readLineSync();

  if (namaTim == null || namaTim.isEmpty) {
    print("Nama tim tidak boleh kosong.");
    return;
  }

  // buat variabel data yang isinya objek Tim dari inputan nama tim
  Tim data = Tim(namaTim);
  // masukkan data tim ke dalam linked list
  dataTim.insertFront(data);
  
  print("Tim $namaTim berhasil ditambahkan.");
  
}

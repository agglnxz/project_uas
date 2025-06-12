import 'class_pemain.dart';
import 'data_tim.dart';
class Tim {
  String namaTim;
  List<Pemain> daftarPemain;

  Tim(this.namaTim, [List<Pemain>? daftarPemain]) : daftarPemain = daftarPemain ?? [];
}

void tampilkanDaftarTim(DataTim dataTim) {
  if (dataTim.isEmpty()) {
    print('Belum ada tim yang terdaftar.');
    return;
  }

  Node? current = dataTim.head;
  int nomorUrut = 1;

  while (current != null) {
    Tim tim = current.data;
    print('\n$nomorUrut. Tim: ${tim.namaTim}');
    if (tim.daftarPemain.isEmpty) {
      print('   Belum ada pemain.');
    } else {
      print('   Daftar Pemain:');
      for (int i = 0; i < tim.daftarPemain.length; i++) {
        Pemain p = tim.daftarPemain[i];
        print('   ${i + 1}. ${p.nama} | Posisi: ${p.posisi} | No: ${p.nomor}');
      }
    }
    current = current.next;
    nomorUrut++;
  }
}
// antrian_giliran.dart
import 'dart:collection';

class AntrianGiliran {
  Queue<String> _antrian = Queue<String>();

  // Tambahkan pemain ke antrian latihan individu
  void tambahPemain(String nama) {
    _antrian.addLast(nama);
    print("Pemain $nama telah masuk antrian giliran latihan individu.");
  }

  // Panggil pemain pertama di antrian untuk latihan
  void panggilPemain() {
    if (_antrian.isNotEmpty) {
      String nama = _antrian.removeFirst();
      print(">> Saatnya $nama melakukan latihan individu.");
    } else {
      print("Tidak ada pemain dalam antrian giliran individu.");
    }
  }

  // Tampilkan seluruh isi antrian
  void tampilkanAntrian() {
    if (_antrian.isEmpty) {
      print("Antrian giliran latihan individu kosong.");
    } else {
      print("Daftar antrian giliran latihan individu:");
      for (var nama in _antrian) {
        print("- $nama");
      }
    }
  }

  // Cek apakah antrian kosong
  bool get isEmpty => _antrian.isEmpty;

}

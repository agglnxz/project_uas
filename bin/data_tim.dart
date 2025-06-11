// data_tim.dart
class Pemain {
  String nama;
  String posisi;
  int nomor;

  Pemain(this.nama, this.posisi, this.nomor);
}

class Tim {
  String namaTim;
  List<Pemain> daftarPemain;

  Tim(this.namaTim, this.daftarPemain);
}

List<Tim> inisialisasiTim() {
  return [
    Tim("Tim A", [
      Pemain("Budi", "Libero", 1),
      Pemain("Tono", "Spiker", 2),
      Pemain("Rian", "Setter", 3),
    ]),
    Tim("Tim B", [
      Pemain("Asep", "Libero", 4),
      Pemain("Doni", "Spiker", 5),
      Pemain("Eka", "Middle Blocker", 6),
    ])
  ];
}

void tampilkanTim(List<Tim> timList) {
  for (var tim in timList) {
    print("\n${tim.namaTim}:");
    for (var pemain in tim.daftarPemain) {
      print("- Nama: ${pemain.nama}, Posisi: ${pemain.posisi}, Nomor: ${pemain.nomor}");
    }
  }
}

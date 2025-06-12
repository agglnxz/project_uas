class RiwayatLatihan {
  final List<dynamic> _riwayat = [];

  void tambahRiwayat(dynamic jadwal) {
    _riwayat.add(jadwal);
  }

  void tampilkan() {
    if (_riwayat.isEmpty) {
      print('Belum ada riwayat latihan.');
    } else {
      print('=== Riwayat Latihan ===');
      for (var i = 0; i < _riwayat.length; i++) {
        var jadwal = _riwayat[i];
        print('${i + 1}. Hari: ${jadwal.hari}, Jam: ${jadwal.jam}');
      }
    }
  }
}
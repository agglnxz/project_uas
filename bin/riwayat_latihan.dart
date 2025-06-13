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
      for (var i = _riwayat.length - 1; i >= 0; i--) {
        var jadwal = _riwayat[i];
        print(
          '${_riwayat.length - i}. Hari: ${jadwal.hari}, Jam: ${jadwal.jam}',
        );
      }
    }
  }
}

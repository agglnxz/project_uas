import 'jadwal_latihan.dart';
class RiwayatLatihan {
  final List<JadwalLatihan> _riwayat = [];

  void tambahRiwayat(JadwalLatihan jadwal) {
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
          '${_riwayat.length - i}.Tim:${jadwal.tim.namaTim} Hari: ${jadwal.hari}, Jam: ${jadwal.jam}',
        );
      }
    }
  }
 
}


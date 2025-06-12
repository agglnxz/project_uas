// File: jadwal_latihan.dart
class JadwalLatihan {
  String hari;
  String jam;

  JadwalLatihan({required this.hari, required this.jam});

  @override
  String toString() {
    return '$hari, $jam';
  }
}
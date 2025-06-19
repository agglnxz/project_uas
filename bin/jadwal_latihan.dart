// File: jadwal_latihan.dart
import 'package:project_uas/class_tim.dart';
class JadwalLatihan {
  String hari;
  String jam;
  Tim tim;


  JadwalLatihan({required this.hari, required this.jam, required this.tim});

  @override
  String toString() {
    return '$hari, $jam';
  }
}
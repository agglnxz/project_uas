class RiwayatLatihan {
  List<String> _stack = [];

  void tambah(String keterangan) {
    _stack.add(keterangan);
  }

  void tampilkan() {
    if (_stack.isEmpty) {
      print("Belum ada riwayat latihan.");
    } else {
      print("\n=== Riwayat Latihan ===");
      for (var i = _stack.length - 1; i >= 0; i--) {
        print("- ${_stack[i]}");
      }
    }
  }
}

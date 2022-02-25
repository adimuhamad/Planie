class Plantbook {
  String id_tanaman;
  String nama_tanaman;
  String keterangan;
  String gambar;

  Plantbook({
    required this.id_tanaman,
    required this.nama_tanaman,
    required this.keterangan,
    required this.gambar,
  });
  factory Plantbook.plantbook(Map<String, dynamic> object) {
    return Plantbook(
      id_tanaman: object['id_tanaman'],
      nama_tanaman: object['nama_tanaman'],
      keterangan: object['keterangan'],
      gambar: object['gambar'],
    );
  }
}

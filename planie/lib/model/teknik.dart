class teknik_tanaman_plant_book {
  String id_tanaman;
  String teknik_penanaman;
  String cara_teknik;

  teknik_tanaman_plant_book({
    required this.id_tanaman,
    required this.teknik_penanaman,
    required this.cara_teknik,
  });
  factory teknik_tanaman_plant_book.tekniktanamanplantbook(
      Map<String, dynamic> object) {
    return teknik_tanaman_plant_book(
      id_tanaman: object['id_tanaman'],
      teknik_penanaman: object['teknik_penanaman'],
      cara_teknik: object['cara_teknik'],
    );
  }
}

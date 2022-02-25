class Tanaman {
  String id_tanaman = "";
  String id_user = "";
  String nama_jadwal = "";
  String jadwal = "";
  String nama_kegiatan = "";
  String jam_kegiatan = "";

  Tanaman(this.id_tanaman, this.id_user, this.nama_jadwal, this.jadwal,
      this.nama_kegiatan, this.jam_kegiatan);

  Tanaman.fromJson(Map<String, dynamic> json) {
    id_tanaman = json['id_tanaman'];
    id_user = json['id_user'];
    nama_jadwal = json['nama_jadwal'];
    jadwal = json['jadwal'];
    nama_kegiatan = json['nama_kegiatan'];
    jam_kegiatan = json['jam_kegiatan'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id_tanaman'] = this.id_tanaman;
    data['id_user'] = this.id_user;
    data['nama_jadwal'] = this.nama_jadwal;
    data['jadwal'] = this.jadwal;
    data['nama_kegiatan'] = this.nama_kegiatan;
    data['jam_kegiatan'] = this.jam_kegiatan;
    return data;
  }
}

class Detail_Tanaman {
  String id_tanaman = "";
  String nama_kegiatan = "";
  String jam_kegiatan = "";

  Detail_Tanaman(this.id_tanaman, this.nama_kegiatan, this.jam_kegiatan);

  Detail_Tanaman.fromJson(Map<String, dynamic> json) {
    id_tanaman = json['id_tanaman'];
    nama_kegiatan = json['nama_kegiatan'];
    jam_kegiatan = json['jam_kegiatan'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id_tanaman'] = this.id_tanaman;
    data['nama_kegiatan'] = this.nama_kegiatan;
    data['jam_kegiatan'] = this.jam_kegiatan;
    return data;
  }
}

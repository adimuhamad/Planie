import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:planie/model/tanaman.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PlantBook {
  static Future<Plantbook> cari(String nama_tanaman) async {
    try {
      String apiURL = "https://planie.xyz/planie/plantbook.php";
      var tanaman = await http.post(Uri.parse(apiURL), body: {
        "nama_tanaman": nama_tanaman,
      });
      var datatanaman = json.decode(tanaman.body);
      print(datatanaman[0]);
      Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
      final SharedPreferences local = await _prefs;
      local.setString('tanaman', tanaman.body);
      return Plantbook.plantbook(datatanaman[0]);
    } catch (e) {
      return Plantbook(
        id_tanaman: "",
        nama_tanaman: "",
        keterangan: "",
        gambar: "",
      );
    }
  }

  Future<Plantbook?> loadtanaman() async {
    Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
    final SharedPreferences local = await _prefs;
    final String tanman = local.getString("tanaman") ?? "tanaman error";
    print("load tanaman");
    print(tanman);
    if (tanman != "tanaman error") {
      var json = jsonDecode(tanman);
      var tnm = Plantbook.plantbook(json[0]);
      return tnm;
    }
    return null;
  }
}

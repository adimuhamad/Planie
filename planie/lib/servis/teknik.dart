import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:planie/model/teknik.dart';

import 'package:shared_preferences/shared_preferences.dart';

class TeknikPlantBook {
  static Future<teknik_tanaman_plant_book> teknik(
      String id_tanaman, String teknik_penanaman) async {
    try {
      print(id_tanaman);
      print(teknik_penanaman);
      String apiURL = "https://planie.xyz/planie/tanaman.php";
      var tanaman = await http.post(Uri.parse(apiURL), body: {
        "id_tanaman": id_tanaman,
        "teknik_penanaman": teknik_penanaman,
      });
      var datatanaman = json.decode(tanaman.body);
      print(datatanaman[0]);
      Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
      final SharedPreferences local = await _prefs;
      local.setString('tanaman', tanaman.body);
      return teknik_tanaman_plant_book.tekniktanamanplantbook(datatanaman[0]);
    } catch (e) {
      return teknik_tanaman_plant_book(
        id_tanaman: "",
        teknik_penanaman: "",
        cara_teknik: "",
      );
    }
  }

  Future<teknik_tanaman_plant_book?> loadteknik() async {
    Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
    final SharedPreferences local = await _prefs;
    final String tanman = local.getString("tanaman") ?? "tanaman error";
    print("load tanaman");
    print(tanman);
    if (tanman != "tanaman error") {
      var json = jsonDecode(tanman);
      var tnm = teknik_tanaman_plant_book.tekniktanamanplantbook(json[0]);
      return tnm;
    }
    return null;
  }
}

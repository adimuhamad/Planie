import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:planie/model/user.dart';

import 'package:shared_preferences/shared_preferences.dart';

class AuthService {
  static Future<User> login(String username, String password_user) async {
    try {
      if (username == "" || password_user == "") {
        Fluttertoast.showToast(
            msg: "Silahkan lengkapi data login",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0);
      }
      String apiURL = "https://planie.xyz/planie/login.php";
      var response = await http.post(Uri.parse(apiURL), body: {
        "username": username,
        "password_user": password_user,
      });
      var datauser = json.decode(response.body);
      print(datauser[0]);
      Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
      final SharedPreferences local = await _prefs;
      local.setString('user', response.body);
      return User.createUser(datauser[0]);
    } catch (e) {
      return User(
          id_user: "",
          nama_lengkap_user: "",
          username: "",
          gmail_user: "",
          password_user: "",
          jenis_kelamin: "",
          tanggal_lahir: "",
          no_handphone: "",
          jenis_user: "",
          bio_user: "");
    }
  }

  Future<User?> loadUser() async {
    Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
    final SharedPreferences local = await _prefs;
    final String user = local.getString("user") ?? "user error";
    print("load user");
    print(user);
    if (user != "user error") {
      var json = jsonDecode(user);
      var usr = User.createUser(json[0]);
      return usr;
    }
    return null;
  }
}

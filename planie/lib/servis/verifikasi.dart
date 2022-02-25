import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

var dataverifikasiuser;

class verifikasi_controller {
  String statusverifikasi = "";
  verifikasi_controller({
    required this.statusverifikasi,
  });
  factory verifikasi_controller.verifikasistatus(object) {
    return verifikasi_controller(
      statusverifikasi: object,
    );
  }
  static Future<verifikasi_controller> verications(
    String gmail_user,
    String username,
    String password_user,
  ) async {
    try {
      if (username == "" || gmail_user == "" || password_user == "") {
        Fluttertoast.showToast(
            msg: "Silahkan lengkapi data",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0);
      } else {
        String apiURL = "https://planie.xyz/planie/verifikasi.php";
        var response = await http.post(Uri.parse(apiURL), body: {
          "gmail_user": gmail_user,
          "username": username,
          "password_user": password_user,
        });
        dataverifikasiuser = json.decode(response.body);
        print(dataverifikasiuser);
      }
      return verifikasi_controller.verifikasistatus(dataverifikasiuser);
    } catch (e) {
      return verifikasi_controller(
        statusverifikasi: "",
      );
    }
  }
}

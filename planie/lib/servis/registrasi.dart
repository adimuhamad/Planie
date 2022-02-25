import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

var datauser;

class register_controller {
  String status = "";
  register_controller({
    required this.status,
  });
  factory register_controller.registerstatus(object) {
    return register_controller(
      status: object,
    );
  }
  static Future<register_controller> register(
      String nama_lengkap_user,
      String username,
      String gmail_user,
      String password_user,
      String jenis_kelamin,
      String tanggal_lahir,
      String no_handphone,
      String jenis_user) async {
    try {
      if (nama_lengkap_user == "" ||
          username == "" ||
          gmail_user == "" ||
          password_user == "" ||
          jenis_kelamin == "" ||
          tanggal_lahir == "" ||
          no_handphone == "" ||
          jenis_user == "") {
        Fluttertoast.showToast(
            msg: "Silahkan lengkapi data",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0);
      } else {
        String apiURL = "https://planie.xyz/planie/register.php";
        var response = await http.post(Uri.parse(apiURL), body: {
          "nama_lengkap_user": nama_lengkap_user,
          "username": username,
          "gmail_user": gmail_user,
          "password_user": password_user,
          "jenis_kelamin": jenis_kelamin,
          "tanggal_lahir": tanggal_lahir,
          "no_handphone": no_handphone,
          "jenis_user": jenis_user,
        });
        datauser = json.decode(response.body);
        print(datauser);
      }
      return register_controller.registerstatus(datauser);
    } catch (e) {
      return register_controller(
        status: "",
      );
    }
  }
}

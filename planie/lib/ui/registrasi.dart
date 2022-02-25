import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:planie/ui/awal.dart';
import 'package:planie/ui/login.dart';
import 'package:planie/ui/tour.dart';
import 'package:planie/servis/registrasi.dart';

class Registrasi extends StatelessWidget {
  TextEditingController nama_lengkap_user = TextEditingController(text: "");
  TextEditingController username = TextEditingController(text: "");
  TextEditingController gmail_user = TextEditingController(text: "");
  TextEditingController password_user = TextEditingController(text: "");
  TextEditingController ulang_password_user = TextEditingController(text: "");
  TextEditingController no_handphone = TextEditingController(text: "");
  TextEditingController Tahun = TextEditingController(text: "");
  TextEditingController Bulan = TextEditingController(text: "");
  TextEditingController Tanggal = TextEditingController(text: "");
  String jenis_pengguna = "";
  String jenis_kelamin = "";
  String password = "";

  @override
  Widget build(BuildContext context) {
    // Figma Flutter Generator LogoWidget - FRAME
    return Scaffold(
      backgroundColor: Color.fromRGBO(244, 243, 181, 1),
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(8),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  height: 25.h,
                ),
                Container(
                  child: Material(
                    borderRadius: BorderRadius.circular(28),
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    child: InkWell(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => Awal()));
                      },
                      child: Ink.image(
                        image:
                            AssetImage('assets/images/Mayabaruicononly1.png'),
                        height: 144.h,
                        width: 136.w,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 48.h,
                ),
                // Textfield Username
                Container(
                  height: 44.h,
                  width: 258.w,
                  child: TextFormField(
                    controller: nama_lengkap_user,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: "Masukkan Nama Lengkap",
                        labelText: "Nama",
                        labelStyle: TextStyle(color: Colors.black)),
                  ),
                ),
                SizedBox(
                  height: 17.h,
                ),

                Container(
                  height: 44.h,
                  width: 258.w,
                  child: TextFormField(
                    controller: username,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: "Masukkan User Name",
                        labelText: "Username",
                        labelStyle: TextStyle(color: Colors.black)),
                  ),
                ),
                SizedBox(
                  height: 17.h,
                ),
                // Textfield Masukkan E-mail
                Container(
                  height: 44.h,
                  width: 258.w,
                  child: TextFormField(
                    controller: gmail_user,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: "Masukkan E-mail",
                        labelText: "E-mail",
                        labelStyle: TextStyle(color: Colors.black)),
                  ),
                ),
                SizedBox(
                  height: 17.h,
                ),
                // Textfield Password
                Container(
                  height: 44.h,
                  width: 258.w,
                  child: TextFormField(
                    controller: password_user,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: "Masukkan Password",
                        labelText: "Password",
                        labelStyle: TextStyle(color: Colors.black)),
                  ),
                ),
                SizedBox(
                  height: 17.h,
                ),
                // Textfield Password
                Container(
                  height: 44.h,
                  width: 258.w,
                  child: TextFormField(
                    controller: ulang_password_user,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: "Masukkan Ulang Password",
                        labelText: "Password",
                        labelStyle: TextStyle(color: Colors.black)),
                  ),
                ),
                SizedBox(
                  height: 17.h,
                ),
                Container(
                  height: 32.h,
                  width: 350,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 44.w),
                    child: DropdownSearch<String>(
                        mode: Mode.MENU,
                        showSelectedItems: true,
                        items: ["Laki-Laki", "Perempuan"],
                        popupItemDisabled: (String s) => s.startsWith('I'),
                        onChanged: (value) {
                          jenis_kelamin = value.toString();
                        },
                        selectedItem: "Jenis Kelamin"),
                  ),
                ),
                SizedBox(
                  height: 17.h,
                ),
                Text("Tanggal Lahir : Tahun - Bulan - Tanggal"),
                Container(
                  height: 32.h,
                  width: 257.w,
                  child: Row(children: <Widget>[
                    Container(
                      height: 32.h,
                      width: 63.w,
                      child: TextFormField(
                        controller: Tahun,
                        keyboardType: TextInputType.number,
                        inputFormatters: <TextInputFormatter>[
                          FilteringTextInputFormatter.digitsOnly,
                          LengthLimitingTextInputFormatter(4),
                        ],
                        decoration: InputDecoration(
                            border:
                                OutlineInputBorder(borderSide: BorderSide()),
                            labelStyle: TextStyle(color: Colors.black)),
                      ),
                    ),
                    Text(
                      "-",
                      style: TextStyle(
                          fontSize: 40.sp,
                          letterSpacing: 0,
                          fontWeight: FontWeight.w400,
                          height: 1),
                    ),
                    Container(
                      height: 32.h,
                      width: 45.w,
                      child: TextFormField(
                        controller: Bulan,
                        keyboardType: TextInputType.number,
                        inputFormatters: <TextInputFormatter>[
                          FilteringTextInputFormatter.digitsOnly,
                          LengthLimitingTextInputFormatter(2),
                        ],
                        decoration: InputDecoration(
                            border:
                                OutlineInputBorder(borderSide: BorderSide()),
                            labelStyle: TextStyle(color: Colors.black)),
                      ),
                    ),
                    Text(
                      "-",
                      style: TextStyle(
                          fontSize: 40.sp,
                          letterSpacing: 0,
                          fontWeight: FontWeight.w400,
                          height: 1),
                    ),
                    Container(
                      height: 32.h,
                      width: 45.w,
                      child: TextFormField(
                        controller: Tanggal,
                        keyboardType: TextInputType.number,
                        inputFormatters: <TextInputFormatter>[
                          FilteringTextInputFormatter.digitsOnly,
                          LengthLimitingTextInputFormatter(2),
                        ],
                        decoration: InputDecoration(
                            border:
                                OutlineInputBorder(borderSide: BorderSide()),
                            labelStyle: TextStyle(color: Colors.black)),
                      ),
                    ),
                  ]),
                ),
                SizedBox(
                  height: 17.h,
                ),
                Container(
                  height: 44.h,
                  width: 258.w,
                  child: TextFormField(
                    controller: no_handphone,
                    keyboardType: TextInputType.number,
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.digitsOnly,
                      LengthLimitingTextInputFormatter(20),
                    ],
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: "Masukkan no HP",
                        labelText: "No HP",
                        labelStyle: TextStyle(color: Colors.black)),
                  ),
                ),
                SizedBox(
                  height: 17.h,
                ),
                // Jenis User
                Container(
                  height: 32.h,
                  width: 350,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 44.w),
                    child: DropdownSearch<String>(
                        mode: Mode.MENU,
                        showSelectedItems: true,
                        items: ["Petani Lokal", "Pengguna Reguler"],
                        popupItemDisabled: (String s) => s.startsWith('I'),
                        onChanged: (value) {
                          jenis_pengguna = value.toString();
                        },
                        selectedItem: "Pilih Jenis Pengguna"),
                  ),
                ),
                SizedBox(
                  height: 17.h,
                ),
                // Tombol masuk
                Card(
                  color: Color.fromRGBO(91, 118, 78, 1),
                  child: Container(
                    height: 32.h,
                    width: 257.w,
                    child: InkWell(
                      splashColor: Colors.white,
                      onTap: () {
                        String tanggal_lahir =
                            Tahun.text + "-" + Bulan.text + "-" + Tanggal.text;
                        if (password_user.text == ulang_password_user.text) {
                          register_controller
                              .register(
                                  nama_lengkap_user.text,
                                  username.text,
                                  gmail_user.text,
                                  password_user.text,
                                  jenis_kelamin,
                                  tanggal_lahir,
                                  no_handphone.text,
                                  jenis_pengguna)
                              .then((value) {
                            if (value.status == "success") {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Tour()));
                            } else if (value.status == "error") {
                              Fluttertoast.showToast(
                                  msg: "Gagal Registrasi",
                                  toastLength: Toast.LENGTH_SHORT,
                                  gravity: ToastGravity.CENTER,
                                  timeInSecForIosWeb: 1,
                                  backgroundColor: Colors.red,
                                  textColor: Colors.white,
                                  fontSize: 16.0);
                            } else if (value.status == "gagal") {
                              Fluttertoast.showToast(
                                  msg: "Data Sudah digunakan",
                                  toastLength: Toast.LENGTH_SHORT,
                                  gravity: ToastGravity.CENTER,
                                  timeInSecForIosWeb: 1,
                                  backgroundColor: Colors.red,
                                  textColor: Colors.white,
                                  fontSize: 16.0);
                            }
                          });
                        } else {
                          Fluttertoast.showToast(
                              msg: "Password Tidak sama",
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.CENTER,
                              timeInSecForIosWeb: 1,
                              backgroundColor: Colors.red,
                              textColor: Colors.white,
                              fontSize: 16.0);
                        }
                      },
                      child: Center(
                        child: Text(
                          "Masuk",
                          style:
                              TextStyle(fontSize: 16.sp, color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ),
                // Tombol Belum Punya Akun
                Container(
                  height: 35.h,
                  width: 180.w,
                  color: Color.fromRGBO(244, 243, 181, 1),
                  child: TextButton(
                    style: TextButton.styleFrom(
                      primary: Colors.black,
                    ),
                    child: Text(
                      'Sudah Punya Akun',
                      style: TextStyle(
                        fontFamily: 'Roboto',
                        fontSize: 13.sp,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Login()));
                    },
                  ),
                ),
                SizedBox(
                  height: 46.h,
                ),

                Container(
                  height: 38.h,
                  width: 71.w,
                  child: Text(
                    'Planie',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Color.fromRGBO(39, 78, 19, 1),
                        fontFamily: 'Chewy',
                        fontSize: 30.sp,
                        letterSpacing:
                            0 /*percentages not used in flutter. defaulting to zero*/,
                        fontWeight: FontWeight.w400,
                        height: 1),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:planie/ui/awal.dart';
import 'package:planie/ui/login.dart';
import 'package:planie/servis/verifikasi.dart';

class Verifikasi extends StatefulWidget {
  const Verifikasi({Key? key}) : super(key: key);

  @override
  _VerifikasiState createState() => _VerifikasiState();
}

class _VerifikasiState extends State<Verifikasi> {
  final TextEditingController gmail_user = TextEditingController();
  final TextEditingController username = TextEditingController();
  final TextEditingController password_user = TextEditingController();
  final TextEditingController ulang_password_user = TextEditingController();
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
                  height: 43.h,
                ),
                // Textfield E-mail verification lupa password
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
                  height: 18.h,
                ),
                // Textfield Username
                Container(
                  height: 44.h,
                  width: 258.w,
                  child: TextFormField(
                    controller: username,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: "Masukkan Username",
                        labelText: "Username",
                        labelStyle: TextStyle(color: Colors.black)),
                  ),
                ),
                SizedBox(
                  height: 18.h,
                ),
                // Textfield ubah password
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
                  height: 18.h,
                ),
                // Textfield ulang ubah password
                Container(
                  height: 44.h,
                  width: 258.w,
                  child: TextFormField(
                    controller: ulang_password_user,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: "Masukkan Password",
                        labelText: "Password",
                        labelStyle: TextStyle(color: Colors.black)),
                  ),
                ),
                SizedBox(
                  height: 18.h,
                ),
                // Tombol masuk
                Card(
                  color: Color.fromRGBO(91, 118, 78, 1),
                  elevation: 5,
                  child: SizedBox(
                    height: 32.h,
                    width: 257.w,
                    child: Container(
                      child: InkWell(
                        splashColor: Colors.white,
                        onTap: () {
                          if (password_user.text == ulang_password_user.text) {
                            verifikasi_controller
                                .verications(
                              gmail_user.text,
                              username.text,
                              password_user.text,
                            )
                                .then((value) {
                              if (value.statusverifikasi == "success") {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Login()));
                              } else if (value.statusverifikasi == "gmail") {
                                Fluttertoast.showToast(
                                    msg: "Gmail Tidak ditemukan",
                                    toastLength: Toast.LENGTH_SHORT,
                                    gravity: ToastGravity.CENTER,
                                    timeInSecForIosWeb: 1,
                                    backgroundColor: Colors.red,
                                    textColor: Colors.white,
                                    fontSize: 16.0);
                              } else if (value.statusverifikasi == "username") {
                                Fluttertoast.showToast(
                                    msg: "Username Tidak ditemukan",
                                    toastLength: Toast.LENGTH_SHORT,
                                    gravity: ToastGravity.CENTER,
                                    timeInSecForIosWeb: 1,
                                    backgroundColor: Colors.red,
                                    textColor: Colors.white,
                                    fontSize: 16.0);
                              } else if (value.statusverifikasi == "error") {
                                Fluttertoast.showToast(
                                    msg: "Username Tidak ditemukan",
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
                                msg: "Password Tidak Sama",
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
                ),

                // Tombol Lupa Akun

                SizedBox(
                  height: 190.h,
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

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:planie/ui/awal.dart';
import 'package:planie/ui/landing.dart';
import 'package:planie/ui/registrasi.dart';
import 'package:planie/ui/verifikasi.dart';
import 'package:planie/servis/authservis.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController username = TextEditingController(text: "");
  TextEditingController password_user = TextEditingController(text: "");
  late final AuthService authservices = new AuthService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(244, 243, 181, 1),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(8),
          child: Container(
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
                    controller: username,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: "Masukkan Username",
                        labelText: "Username",
                        labelStyle: TextStyle(color: Colors.black)),
                  ),
                ),
                SizedBox(
                  height: 14.h,
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
                    obscureText: true,
                  ),
                ),
                SizedBox(
                  height: 24.h,
                ),
                // Tombol masuk

                Container(
                  color: Color.fromRGBO(91, 118, 78, 1),
                  height: 32.h,
                  width: 257.w,
                  child: InkWell(
                    splashColor: Colors.white,
                    onTap: () {
                      if (username.text.isNotEmpty) {
                        AuthService.login(username.text, password_user.text)
                            .then((onValue) {
                          print(onValue.toString());
                          if (onValue.username == "" &&
                              onValue.password_user == "") {
                            Fluttertoast.showToast(
                                msg: "Password atau username Anda salah",
                                toastLength: Toast.LENGTH_SHORT,
                                gravity: ToastGravity.CENTER,
                                timeInSecForIosWeb: 1,
                                backgroundColor: Colors.red,
                                textColor: Colors.white,
                                fontSize: 16.0);
                          } else {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => BottomNavBar()));
                          }
                        });
                      } else {
                        ScaffoldMessenger.of(context)
                            .showSnackBar(const SnackBar(
                          content: Text("Harap isi username Anda"),
                        ));
                      }
                      // await sama future async
                    },
                    child: Center(
                      child: Text(
                        "Masuk",
                        style: TextStyle(fontSize: 16.sp, color: Colors.white),
                      ),
                    ),
                  ),
                ),

                Column(
                  children: <Widget>[
                    // Tombol Belum Punya Akun
                    TextButton(
                      style: TextButton.styleFrom(
                        primary: Colors.black,
                      ),
                      child: Text(
                        'Belum Punya Akun',
                        style: TextStyle(
                          fontFamily: 'Roboto',
                          fontSize: 13.sp,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Registrasi()));
                      },
                    ),
                    // Tombol Lupa Akun

                    TextButton(
                      style: TextButton.styleFrom(
                        primary: Colors.black,
                      ),
                      child: Text(
                        'Lupa Password',
                        style: TextStyle(
                          fontFamily: 'Roboto',
                          fontSize: 13.sp,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Verifikasi(),
                          ),
                        );
                      },
                    ),
                  ],
                ),
                SizedBox(
                  height: 100.h,
                ),

                Container(
                  height: 38.h,
                  width: 71.w,
                  child: Text(
                    'Planie',

                    textAlign: TextAlign.center,
                    // ini seharusnya bisa dipanggil jadi constants
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

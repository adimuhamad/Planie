import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:planie/model/user.dart';
import 'package:planie/servis/authservis.dart';
import 'package:planie/ui/login.dart';

String nama = '';

class Bio extends StatelessWidget {
  AuthService user = AuthService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: SingleChildScrollView(
        child: FutureBuilder(
          builder: (context, projectSnap) {
            if (projectSnap.connectionState == ConnectionState.none &&
                projectSnap.hasData == null) {
              //print('project snapshot data is: ${projectSnap.data}');
              return Container();
            }
            if (projectSnap.hasData) {
              User user = projectSnap.data as User;
              nama = user.nama_lengkap_user;
              return Container(
                child: Column(
                  children: <Widget>[
                    Container(
                      height: 140.h,
                      color: Color.fromRGBO(244, 243, 181, 1),
                      child: Container(
                        margin: EdgeInsets.fromLTRB(90, 50, 90, 10),
                        child: Column(
                          children: <Widget>[
                            Container(
                                child: Row(
                              children: <Widget>[
                                // avatar
                                Container(
                                  height: 38.h,
                                  width: 44.w,
                                  child: Material(
                                    color: Color.fromRGBO(244, 243, 181, 1),
                                    borderRadius: BorderRadius.circular(20),
                                    clipBehavior: Clip.antiAliasWithSaveLayer,
                                    child: InkWell(
                                      onTap: () {},
                                      child: CircleAvatar(
                                        backgroundImage: AssetImage(
                                            'assets/images/provil.jpg'),
                                        minRadius: 12,
                                        maxRadius: 12,
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(width: 18.w),
                                // nama dan jenis pengguna
                                Container(
                                    child: Column(
                                  children: <Widget>[
                                    // nama
                                    Text(
                                      user.nama_lengkap_user,
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontFamily: 'Roboto',
                                          fontSize: 14.sp,
                                          letterSpacing:
                                              0 /*percentages not used in flutter. defaulting to zero*/,
                                          fontWeight: FontWeight.w400,
                                          height: 1),
                                    ),
                                    SizedBox(height: 7.h),
                                    // jenis Pengguna
                                    Container(
                                      color: Color.fromRGBO(239, 150, 111, 1),
                                      height: 15.h,
                                      width: 114.w,
                                      child: Center(
                                        child: Text(
                                          user.jenis_user,
                                          textAlign: TextAlign.left,
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontFamily: 'Roboto',
                                              fontSize: 12.sp,
                                              letterSpacing:
                                                  0 /*percentages not used in flutter. defaulting to zero*/,
                                              fontWeight: FontWeight.w400,
                                              height: 1),
                                        ),
                                      ),
                                    ),
                                  ],
                                )),
                              ],
                            )),
                            SizedBox(height: 10.h),
                            // tombol ubah jenis pengguna
                            Card(
                              color: Color.fromRGBO(19, 110, 177, 1),
                              child: Container(
                                height: 22.h,
                                child: InkWell(
                                  splashColor: Colors.white,
                                  onTap: () {},
                                  child: Center(
                                    child: Text(
                                      "Ajukan Sebagai Petani Lokal",
                                      style: TextStyle(
                                          fontSize: 12.sp, color: Colors.white),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.fromLTRB(20, 27, 20, 0),
                      child: Column(
                        children: <Widget>[
                          Center(
                            child: Container(
                              child: Row(children: <Widget>[
                                Container(
                                    width: 270.w,
                                    child: Column(
                                      children: <Widget>[
                                        Container(
                                          height: 20.h,
                                          width: 316.w,
                                          child: Text(
                                            "Nama Lengkap",
                                            textAlign: TextAlign.left,
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontFamily: 'Roboto',
                                                fontSize: 20.sp,
                                                letterSpacing:
                                                    0 /*percentages not used in flutter. defaulting to zero*/,
                                                fontWeight: FontWeight.w400,
                                                height: 1),
                                          ),
                                        ),
                                        Container(
                                          height: 15.h,
                                          width: 316.w,
                                          child: Text(
                                            user.nama_lengkap_user,
                                            textAlign: TextAlign.left,
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontFamily: 'Roboto',
                                                fontSize: 12.sp,
                                                letterSpacing:
                                                    0 /*percentages not used in flutter. defaulting to zero*/,
                                                fontWeight: FontWeight.w400,
                                                height: 1),
                                          ),
                                        ),
                                      ],
                                    )),
                                IconButton(
                                    onPressed: () {},
                                    icon: const Icon(Icons.create),
                                    color: Colors.black),
                              ]),
                            ),
                          ),
                          SizedBox(height: 18.h),
                          Container(
                            child: Row(children: <Widget>[
                              Container(
                                  width: 270.w,
                                  child: Column(
                                    children: <Widget>[
                                      Container(
                                        height: 20.h,
                                        width: 316.w,
                                        child: Text(
                                          "Username",
                                          textAlign: TextAlign.left,
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontFamily: 'Roboto',
                                              fontSize: 20.sp,
                                              letterSpacing:
                                                  0 /*percentages not used in flutter. defaulting to zero*/,
                                              fontWeight: FontWeight.w400,
                                              height: 1),
                                        ),
                                      ),
                                      Container(
                                        height: 15.h,
                                        width: 316.w,
                                        child: Text(
                                          user.username,
                                          textAlign: TextAlign.left,
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontFamily: 'Roboto',
                                              fontSize: 12.sp,
                                              letterSpacing:
                                                  0 /*percentages not used in flutter. defaulting to zero*/,
                                              fontWeight: FontWeight.w400,
                                              height: 1),
                                        ),
                                      ),
                                    ],
                                  )),
                              IconButton(
                                  onPressed: () {},
                                  icon: const Icon(Icons.create),
                                  color: Colors.black),
                            ]),
                          ),
                          SizedBox(height: 18.h),
                          Container(
                            child: Row(children: <Widget>[
                              Container(
                                  width: 270.w,
                                  child: Column(
                                    children: <Widget>[
                                      Container(
                                        height: 20.h,
                                        width: 316.w,
                                        child: Text(
                                          "NO Handphone",
                                          textAlign: TextAlign.left,
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontFamily: 'Roboto',
                                              fontSize: 20.sp,
                                              letterSpacing:
                                                  0 /*percentages not used in flutter. defaulting to zero*/,
                                              fontWeight: FontWeight.w400,
                                              height: 1),
                                        ),
                                      ),
                                      Container(
                                        height: 15.h,
                                        width: 316.w,
                                        child: Text(
                                          user.no_handphone,
                                          textAlign: TextAlign.left,
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontFamily: 'Roboto',
                                              fontSize: 12.sp,
                                              letterSpacing:
                                                  0 /*percentages not used in flutter. defaulting to zero*/,
                                              fontWeight: FontWeight.w400,
                                              height: 1),
                                        ),
                                      ),
                                    ],
                                  )),
                              IconButton(
                                  onPressed: () {},
                                  icon: const Icon(Icons.create),
                                  color: Colors.black),
                            ]),
                          ),
                          SizedBox(height: 18.h),
                          Container(
                            child: Row(children: <Widget>[
                              Container(
                                  width: 270.w,
                                  child: Column(
                                    children: <Widget>[
                                      Container(
                                        height: 20.h,
                                        width: 316.w,
                                        child: Text(
                                          "Alamat Email",
                                          textAlign: TextAlign.left,
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontFamily: 'Roboto',
                                              fontSize: 20.sp,
                                              letterSpacing:
                                                  0 /*percentages not used in flutter. defaulting to zero*/,
                                              fontWeight: FontWeight.w400,
                                              height: 1),
                                        ),
                                      ),
                                      Container(
                                        height: 15.h,
                                        width: 316.w,
                                        child: Text(
                                          user.gmail_user,
                                          textAlign: TextAlign.left,
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontFamily: 'Roboto',
                                              fontSize: 12.sp,
                                              letterSpacing:
                                                  0 /*percentages not used in flutter. defaulting to zero*/,
                                              fontWeight: FontWeight.w400,
                                              height: 1),
                                        ),
                                      ),
                                    ],
                                  )),
                              IconButton(
                                  onPressed: () {},
                                  icon: const Icon(Icons.create),
                                  color: Colors.black),
                            ]),
                          ),
                          SizedBox(height: 18.h),
                          TextButton(
                            style: TextButton.styleFrom(
                              primary: Colors.black,
                            ),
                            child: Text(
                              'LOG OUT',
                              style: TextStyle(
                                fontFamily: 'Roboto',
                                fontSize: 30.sp,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => Login(),
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            }
            return Container();
          },
          future: user.loadUser(),
        ),
      ),
    ));
  }

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    throw UnimplementedError();
  }
}

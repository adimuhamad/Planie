import 'package:flutter/material.dart';
import 'package:planie/model/user.dart';
import 'package:planie/servis/authservis.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:planie/ui/bio.dart';

String nama = '';

class Profil extends StatelessWidget {
  AuthService user = AuthService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromRGBO(137, 179, 117, 1),
          automaticallyImplyLeading: false,
          title: Text(nama),
        ),
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
                  return Container();
                }
                return Container(
                    child: Column(
                  children: [Text("user")],
                ));
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

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:planie/model/user.dart';
import 'package:planie/servis/authservis.dart';
import 'package:planie/ui/landing.dart';
import 'package:planie/ui/login.dart';

class Awal extends StatelessWidget {
  AuthService user = AuthService();
  @override
  Widget build(BuildContext context) {
    // Figma Flutter Generator LogoWidget - FRAME
    return Scaffold(
      backgroundColor: Color.fromRGBO(244, 243, 181, 1),
      body: SingleChildScrollView(
          child: Center(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 144.h,
            ),
            Container(
              child: Material(
                borderRadius: BorderRadius.circular(28),
                clipBehavior: Clip.antiAliasWithSaveLayer,
                child: InkWell(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Login()));
                  },
                  child: Ink.image(
                    image: AssetImage('assets/images/Mayabaruicononly1.png'),
                    height: 215.h,
                    width: 212.w,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 50,
            ),
            Container(
                child: Text(
              'P L A N I E',
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Color.fromRGBO(39, 78, 19, 1),
                  fontFamily: 'Chewy',
                  fontSize: 60.sp,
                  letterSpacing:
                      0 /*percentages not used in flutter. defaulting to zero*/,
                  fontWeight: FontWeight.normal,
                  height: 1),
            )),
            Container(
                child: Text(
              '-Your Plant Bestie-,',
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Color.fromRGBO(39, 78, 19, 1),
                  fontFamily: 'Chewy',
                  fontSize: 25.sp,
                  letterSpacing:
                      0 /*percentages not used in flutter. defaulting to zero*/,
                  fontWeight: FontWeight.normal,
                  height: 1),
            ))
          ],
        ),
      )),
    );
  }
}

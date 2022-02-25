import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:planie/ui/landing.dart';
import 'package:planie/ui/perkenalan1.dart';

class Tour extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Figma Flutter Generator LogoWidget - FRAME
    return Scaffold(
      backgroundColor: Color.fromRGBO(244, 243, 181, 1),
      body: Center(
        child: Container(
          height: 212.h,
          width: 296.w,
          color: Colors.white,
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 25.h,
              ),
              Container(
                  height: 57.h,
                  width: 257.w,
                  child: Text(
                    "Selamat datang di PLANIE, ikuti tour untuk mendapatkan pengalaman sebelum melakukan aplikasi.",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontFamily: 'Roboto',
                        fontSize: 16.sp,
                        letterSpacing:
                            0 /*percentages not used in flutter. defaulting to zero*/,
                        fontWeight: FontWeight.w400,
                        height: 1),
                  )),
              SizedBox(
                height: 26.h,
              ),
              Text(
                "Ikut Tour Aplikasi?",
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontFamily: 'Roboto',
                    fontSize: 18.sp,
                    letterSpacing:
                        0 /*percentages not used in flutter. defaulting to zero*/,
                    fontWeight: FontWeight.w400,
                    height: 1),
              ),
              SizedBox(
                height: 35.h,
              ),
              Row(
                children: <Widget>[
                  Spacer(flex: 2),
                  TextButton(
                    style: TextButton.styleFrom(
                      primary: Colors.black,
                    ),
                    child: Text(
                      'Setuju',
                      style: TextStyle(
                        fontFamily: 'Roboto',
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => perkenalan1()));
                    },
                  ),
                  Spacer(flex: 1),
                  TextButton(
                    style: TextButton.styleFrom(
                      primary: Colors.black,
                    ),
                    child: Text(
                      'Lewati',
                      style: TextStyle(
                        color: Color.fromRGBO(19, 110, 177, 1),
                        fontFamily: 'Roboto',
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => BottomNavBar()));
                    },
                  ),
                  Spacer(flex: 2),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:planie/ui/landing.dart';
import 'package:planie/ui/perkenalan3.dart';

class perkenalan2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Figma Flutter Generator LogoWidget - FRAME
    return Scaffold(
      backgroundColor: Color.fromRGBO(244, 243, 181, 1),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: <Widget>[
              SizedBox(height: 64.h),
              Container(
                child: Material(
                  color: Color.fromRGBO(244, 243, 181, 1),
                  borderRadius: BorderRadius.circular(28),
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  child: Ink.image(
                    image: AssetImage('assets/images/Image4.png'),
                    height: 192.h,
                    width: 379.w,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              SizedBox(height: 10.h),
              Column(
                children: <Widget>[
                  Container(
                      height: 27.h,
                      width: 293.w,
                      child: Text(
                        'Rawat Tanamanmu',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            color: Color.fromRGBO(91, 118, 78, 1),
                            fontFamily: 'Roboto',
                            fontSize: 25.sp,
                            letterSpacing:
                                0 /*percentages not used in flutter. defaulting to zero*/,
                            fontWeight: FontWeight.normal,
                            height: 1),
                      )),
                  SizedBox(height: 10.h),
                  Container(
                      height: 37.h,
                      width: 298.w,
                      child: Text(
                        'Tersedia info dan tips & trick untuk memelihara berbagai jenis tanaman hias',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            fontFamily: 'Roboto',
                            fontSize: 16.sp,
                            letterSpacing:
                                0 /*percentages not used in flutter. defaulting to zero*/,
                            fontWeight: FontWeight.normal,
                            height: 1),
                      )),
                ],
              ),
              SizedBox(height: 257.h),
              Row(
                children: <Widget>[
                  Spacer(flex: 2),
                  ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => BottomNavBar()));
                      },
                      child: Text('Lewati'),
                      style: ElevatedButton.styleFrom(
                          primary: Color.fromRGBO(239, 150, 111, 1),
                          shape: StadiumBorder())),
                  Spacer(flex: 2),
                  Container(
                      width: 33,
                      height: 7,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(15),
                          topRight: Radius.circular(15),
                          bottomLeft: Radius.circular(15),
                          bottomRight: Radius.circular(15),
                        ),
                        color: Color.fromRGBO(255, 255, 255, 1),
                      )),
                  Spacer(
                    flex: 1,
                  ),
                  Container(
                      width: 33,
                      height: 7,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(15),
                          topRight: Radius.circular(15),
                          bottomLeft: Radius.circular(15),
                          bottomRight: Radius.circular(15),
                        ),
                        color: Color.fromRGBO(39, 78, 19, 1),
                      )),
                  Spacer(flex: 1),
                  Container(
                      width: 33,
                      height: 7,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(15),
                          topRight: Radius.circular(15),
                          bottomLeft: Radius.circular(15),
                          bottomRight: Radius.circular(15),
                        ),
                        color: Color.fromRGBO(255, 255, 255, 1),
                      )),
                  Spacer(flex: 1),
                  Container(
                      width: 33,
                      height: 7,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(15),
                          topRight: Radius.circular(15),
                          bottomLeft: Radius.circular(15),
                          bottomRight: Radius.circular(15),
                        ),
                        color: Color.fromRGBO(255, 255, 255, 1),
                      )),
                  Spacer(flex: 2),
                  ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => perkenalan3()));
                      },
                      child: Text('Lanjut'),
                      style: ElevatedButton.styleFrom(
                          primary: Color.fromRGBO(39, 78, 19, 1),
                          shape: StadiumBorder())),
                  Spacer(flex: 2),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

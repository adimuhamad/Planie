import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:planie/model/tanaman.dart';
import 'package:planie/model/teknik.dart';
import 'package:planie/servis/plantbook.dart';
import 'package:planie/servis/teknik.dart';
import 'package:planie/ui/hasil_search.dart';
import 'package:planie/ui/profil.dart';

class Teknik_Plant_Book extends StatefulWidget {
  @override
  teknik_plant_book createState() => teknik_plant_book();
}

class teknik_plant_book extends State<Teknik_Plant_Book> {
  TeknikPlantBook tekniktanaman = TeknikPlantBook();
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(137, 179, 117, 1),
        automaticallyImplyLeading: false,
        title: Text("PLANTBOOK"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.account_circle),
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => expand()));
            },
          )
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 32.h,
                ),

                //logo planie

                FutureBuilder(
                  builder: (context, projectSnap) {
                    if (projectSnap.connectionState == ConnectionState.none &&
                        projectSnap.hasData == null) {
                      //print('project snapshot data is: ${projectSnap.data}');
                      return Container();
                    }
                    if (projectSnap.hasData) {
                      teknik_tanaman_plant_book tekniktanaman =
                          projectSnap.data as teknik_tanaman_plant_book;

                      return Container(
                          padding: EdgeInsets.all(10),
                          decoration: new BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: Color.fromRGBO(244, 243, 181, 1),
                          ),
                          child: Column(children: <Widget>[
                            //gambar

                            SizedBox(
                              height: 10.h,
                            ),

                            Container(
                              child: Text(
                                tekniktanaman.cara_teknik,
                                textAlign: TextAlign.center,
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
                          ]));
                    }
                    return Container(
                        child: Column(
                      children: [Text("user")],
                    ));
                  },
                  future: tekniktanaman.loadteknik(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

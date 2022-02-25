import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:planie/model/tanaman.dart';
import 'package:planie/servis/plantbook.dart';
import 'package:planie/ui/hasil_search.dart';
import 'package:planie/ui/profil.dart';

class Deskripsi_Plant_Book extends StatefulWidget {
  @override
  deskripsi_plant_book createState() => deskripsi_plant_book();
}

class deskripsi_plant_book extends State<Deskripsi_Plant_Book> {
  TextEditingController nama_tanaman = TextEditingController(text: "");
  PlantBook tanaman = PlantBook();

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
      body: Center(
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
                      Plantbook tanaman = projectSnap.data as Plantbook;

                      return Container(
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: Color.fromRGBO(244, 243, 181, 1),
                          ),
                          child: Column(children: <Widget>[
                            //gambar
                            Container(
                              child: Image.network(
                                tanaman.gambar,
                                height: 192.h,
                                width: 342.w,
                                fit: BoxFit.cover,
                              ),
                            ),
                            SizedBox(
                              height: 10.h,
                            ),
                            Container(
                              height: 20.h,
                              width: 116.w,
                              child: Text(
                                tanaman.nama_tanaman,
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
                            SizedBox(
                              height: 10.h,
                            ),
                            Container(
                              child: Text(
                                tanaman.keterangan,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Colors.black,
                                    fontFamily: 'Roboto',
                                    fontSize: 15.sp,
                                    letterSpacing:
                                        0 /*percentages not used in flutter. defaulting to zero*/,
                                    fontWeight: FontWeight.w400,
                                    height: 1),
                              ),
                            ),
                          ]));
                    }
                    return Container();
                  },
                  future: tanaman.loadtanaman(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

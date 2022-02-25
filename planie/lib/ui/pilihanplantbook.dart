import 'package:expandable/expandable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:planie/model/tanaman.dart';
import 'package:planie/servis/plantbook.dart';
import 'package:planie/servis/teknik.dart';
import 'package:planie/ui/bio.dart';
import 'package:planie/ui/hasil_search.dart';
import 'package:planie/ui/keteranganplantbook.dart';
import 'package:planie/ui/teknikplantbook.dart';

class Pilihan_Plant_Book extends StatefulWidget {
  @override
  pilihan_plant_book createState() => new pilihan_plant_book();
}

class pilihan_plant_book extends State<Pilihan_Plant_Book> {
  PlantBook tanaman = PlantBook();
  TeknikPlantBook penyiraman = TeknikPlantBook();

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
                  context, MaterialPageRoute(builder: (context) => Bio()));
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
                      Plantbook tanaman = projectSnap.data as Plantbook;

                      return Container(
                          padding: EdgeInsets.all(10),
                          decoration: new BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: Color.fromRGBO(244, 243, 181, 1),
                          ),
                          child: Column(children: <Widget>[
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
                            TextButton(
                              style: TextButton.styleFrom(
                                primary: Colors.black,
                              ),
                              child: Text(
                                'Deskripsi',
                                style: TextStyle(
                                  fontFamily: 'Roboto',
                                  fontSize: 21.sp,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            Deskripsi_Plant_Book()));
                              },
                            ),
                            TextButton(
                              style: TextButton.styleFrom(
                                primary: Colors.black,
                              ),
                              child: Text(
                                'Penyiraman',
                                style: TextStyle(
                                  fontFamily: 'Roboto',
                                  fontSize: 21.sp,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              onPressed: () {
                                TeknikPlantBook.teknik(
                                        tanaman.id_tanaman, "Penyiraman")
                                    .then((value) {
                                  print(value.cara_teknik);
                                  if (TeknikPlantBook != null) {
                                    if (value.cara_teknik == "") {
                                      Fluttertoast.showToast(
                                          msg: "Tidak Ditemukan",
                                          toastLength: Toast.LENGTH_SHORT,
                                          gravity: ToastGravity.CENTER,
                                          timeInSecForIosWeb: 1,
                                          backgroundColor: Colors.red,
                                          textColor: Colors.white,
                                          fontSize: 16.0);
                                    } else {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  Teknik_Plant_Book()));
                                    }
                                  }
                                });
                              },
                            ),
                            TextButton(
                              style: TextButton.styleFrom(
                                primary: Colors.black,
                              ),
                              child: Text(
                                'Pemupukan',
                                style: TextStyle(
                                  fontFamily: 'Roboto',
                                  fontSize: 21.sp,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              onPressed: () {
                                TeknikPlantBook.teknik(
                                        tanaman.id_tanaman, "Pemupukan")
                                    .then((value) {
                                  if (TeknikPlantBook != null) {
                                    if (value.cara_teknik == "") {
                                      Fluttertoast.showToast(
                                          msg: "Tidak Ditemukan",
                                          toastLength: Toast.LENGTH_SHORT,
                                          gravity: ToastGravity.CENTER,
                                          timeInSecForIosWeb: 1,
                                          backgroundColor: Colors.red,
                                          textColor: Colors.white,
                                          fontSize: 16.0);
                                    } else {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  Teknik_Plant_Book()));
                                    }
                                  }
                                });
                              },
                            ),
                            TextButton(
                              style: TextButton.styleFrom(
                                primary: Colors.black,
                              ),
                              child: Text(
                                'Pencahayaan',
                                style: TextStyle(
                                  fontFamily: 'Roboto',
                                  fontSize: 21.sp,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              onPressed: () {
                                TeknikPlantBook.teknik(
                                        tanaman.id_tanaman, "Pencahayaan")
                                    .then((value) {
                                  if (TeknikPlantBook != null) {
                                    if (value.cara_teknik == "") {
                                      Fluttertoast.showToast(
                                          msg: "Tidak Ditemukan",
                                          toastLength: Toast.LENGTH_SHORT,
                                          gravity: ToastGravity.CENTER,
                                          timeInSecForIosWeb: 1,
                                          backgroundColor: Colors.red,
                                          textColor: Colors.white,
                                          fontSize: 16.0);
                                    } else {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  Teknik_Plant_Book()));
                                    }
                                  }
                                });
                              },
                            ),
                            TextButton(
                              style: TextButton.styleFrom(
                                primary: Colors.black,
                              ),
                              child: Text(
                                'Media Tanam',
                                style: TextStyle(
                                  fontFamily: 'Roboto',
                                  fontSize: 21.sp,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              onPressed: () {
                                TeknikPlantBook.teknik(
                                        tanaman.id_tanaman, "Media Tanam")
                                    .then((value) {
                                  if (TeknikPlantBook != null) {
                                    if (value.cara_teknik == "") {
                                      Fluttertoast.showToast(
                                          msg: "Tidak Ditemukan",
                                          toastLength: Toast.LENGTH_SHORT,
                                          gravity: ToastGravity.CENTER,
                                          timeInSecForIosWeb: 1,
                                          backgroundColor: Colors.red,
                                          textColor: Colors.white,
                                          fontSize: 16.0);
                                    } else {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  Teknik_Plant_Book()));
                                    }
                                  }
                                });
                              },
                            ),
                            TextButton(
                              style: TextButton.styleFrom(
                                primary: Colors.black,
                              ),
                              child: Text(
                                'Teknik Budidaya',
                                style: TextStyle(
                                  fontFamily: 'Roboto',
                                  fontSize: 21.sp,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              onPressed: () {
                                TeknikPlantBook.teknik(
                                        tanaman.id_tanaman, "Teknik Budidaya")
                                    .then((value) {
                                  if (TeknikPlantBook != null) {
                                    if (value.cara_teknik == "") {
                                      Fluttertoast.showToast(
                                          msg: "Tidak Ditemukan",
                                          toastLength: Toast.LENGTH_SHORT,
                                          gravity: ToastGravity.CENTER,
                                          timeInSecForIosWeb: 1,
                                          backgroundColor: Colors.red,
                                          textColor: Colors.white,
                                          fontSize: 16.0);
                                    } else {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  Teknik_Plant_Book()));
                                    }
                                  }
                                });
                              },
                            ),
                          ]));
                    }
                    return Container(
                        child: Column(
                      children: [Text("user")],
                    ));
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

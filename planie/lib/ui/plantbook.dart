import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:planie/model/tanaman.dart';
import 'package:planie/servis/plantbook.dart';
import 'package:planie/ui/hasil_search.dart';
import 'package:planie/ui/pilihanplantbook.dart';

class Plant_Book extends StatefulWidget {
  @override
  plant_book createState() => new plant_book();
}

class plant_book extends State<Plant_Book> {
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
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 42.h,
                ),
                //logo planie
                Container(
                    child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      child: Material(
                        borderRadius: BorderRadius.circular(10),
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        child: Ink.image(
                          image:
                              AssetImage('assets/images/Mayabaruicononly1.png'),
                          height: 42.h,
                          width: 45.w,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 11.w,
                    ),
                    Text(
                      'P L A N I E',

                      textAlign: TextAlign.center,
                      // ini seharusnya bisa dipanggil jadi constants
                      style: TextStyle(
                          color: Color.fromRGBO(39, 78, 19, 1),
                          fontFamily: 'Chewy',
                          fontSize: 25.sp,
                          letterSpacing:
                              0 /*percentages not used in flutter. defaulting to zero*/,
                          fontWeight: FontWeight.w400,
                          height: 1),
                    ),
                  ],
                )),
                SizedBox(
                  height: 20.h,
                ),
                // Textfield pencarian
                Container(
                  height: 43.h,
                  width: 309.w,
                  child: TextFormField(
                    controller: nama_tanaman,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: "Cari Tanaman Disini...",
                      labelStyle: TextStyle(color: Colors.black),
                      suffixIcon: IconButton(
                        onPressed: () {
                          if (nama_tanaman.text.isNotEmpty) {
                            PlantBook.cari(nama_tanaman.text).then((value) {
                              setState(() {});
                              if (PlantBook != null) {
                                if (value.nama_tanaman == "") {
                                  Fluttertoast.showToast(
                                      msg: "Tidak Ditemukan",
                                      toastLength: Toast.LENGTH_SHORT,
                                      gravity: ToastGravity.CENTER,
                                      timeInSecForIosWeb: 1,
                                      backgroundColor: Colors.red,
                                      textColor: Colors.white,
                                      fontSize: 16.0);
                                }
                              }
                            });
                          } else {
                            ScaffoldMessenger.of(context)
                                .showSnackBar(const SnackBar(
                              content: Text("masukkan jenis tanaman"),
                            ));
                          }
                        },
                        icon: Icon(Icons.search),
                      ),
                    ),
                  ),
                ),
                //hasil pencarian
                SizedBox(
                  height: 30.h,
                ),

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
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                            Container(
                                height: 72.h,
                                width: 300.w,
                                decoration: new BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  color: Color.fromRGBO(244, 243, 181, 1),
                                ),
                                child: InkWell(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              Pilihan_Plant_Book(),
                                        ),
                                      );
                                    },
                                    child: Row(children: <Widget>[
                                      SizedBox(
                                        width: 10.h,
                                      ),
                                      //gambar
                                      Container(
                                        child: Image.network(
                                          tanaman.gambar,
                                          height: 49.h,
                                          width: 53.w,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                      SizedBox(
                                        width: 10.h,
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
                                    ])))
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

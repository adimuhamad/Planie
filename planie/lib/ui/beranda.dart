import 'package:flutter/material.dart';
import 'package:planie/ui/profil.dart';

class Beranda extends StatefulWidget {
  @override
  _BerandaState createState() => new _BerandaState();
}

class _BerandaState extends State<Beranda> {
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
          title: Text("BERANDA"),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.account_circle),
              onPressed: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => Profil()));
              },
            )
          ],
        ),
        body: SafeArea(
          child: Container(
              color: Colors.white,
              child: Center(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text('Beranda'),
                    ]),
              )),
        ));
  }
}

import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:planie/ui/bio.dart';
import 'package:planie/ui/plantbook.dart';
import 'package:planie/ui/reminder.dart';

class BottomNavBar extends StatefulWidget {
  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int _page = 0;
  List<Widget> _container = [Reminder(), Plant_Book(), Bio()];
  GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
        key: _bottomNavigationKey,
        index: 0,
        height: 60.0,
        items: <Widget>[
          Icon(
            Icons.access_time,
            size: 30,
            color: Colors.white,
          ),
          Icon(
            Icons.book,
            size: 30,
            color: Colors.white,
          ),
          Icon(
            Icons.account_circle,
            size: 30,
            color: Colors.white,
          ),
        ],
        color: Color.fromRGBO(114, 156, 75, 1),
        buttonBackgroundColor: Color.fromRGBO(137, 179, 117, 1),
        backgroundColor: Colors.transparent,
        animationCurve: Curves.easeInOut,
        animationDuration: Duration(milliseconds: 100),
        onTap: (index) {
          setState(() {
            _page = index;
          });
        },
        letIndexChange: (index) => true,
      ),
      body: _container[_page],
    );
  }
}

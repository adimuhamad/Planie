import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:planie/model/user.dart';
import 'package:planie/servis/authservis.dart';
import 'package:planie/ui/bio.dart';
import 'package:planie/ui/profil.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:intl/intl.dart';

class Reminder extends StatefulWidget {
  @override
  reminder_user createState() => new reminder_user();
}

class reminder_user extends State<Reminder> {
  CalendarFormat format = CalendarFormat.month;
  DateTime selectedDay = DateTime.now();
  DateTime focusedDay = DateTime.now();
  AuthService user = AuthService();
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
                  Container(
                    child: FutureBuilder(
                      builder: (context, projectSnap) {
                        if (projectSnap.connectionState ==
                                ConnectionState.none &&
                            projectSnap.hasData == null) {
                          //print('project snapshot data is: ${projectSnap.data}');
                          return Container();
                        }
                        if (projectSnap.hasData) {
                          User user = projectSnap.data as User;
                          return Container(
                              child: Column(children: <Widget>[
                            TableCalendar(
                              firstDay: DateTime.utc(1990),
                              lastDay: DateTime.utc(2100),
                              focusedDay: selectedDay,
                              calendarFormat: format,
                              onFormatChanged: (CalendarFormat _format) {
                                setState(() {
                                  format = _format;
                                });
                              },
                              onDaySelected:
                                  (DateTime selectDay, DateTime focusDay) {
                                setState(() {
                                  selectedDay = selectDay;
                                  focusedDay = focusDay;
                                });
                                print(focusedDay);
                              },
                              selectedDayPredicate: (DateTime date) {
                                return isSameDay(selectedDay, date);
                              },
                              calendarStyle: CalendarStyle(
                                isTodayHighlighted: true,
                                selectedDecoration: BoxDecoration(
                                  color: Color.fromRGBO(137, 179, 117, 1),
                                  shape: BoxShape.circle,
                                ),
                                selectedTextStyle:
                                    TextStyle(color: Colors.white),
                              ),
                            ),
                            Text(DateFormat('yyyy-MM-dd').format(selectedDay)),
                            Text(user.nama_lengkap_user),
                            Text("COMING SOON"),
                          ]));
                        }
                        return Container();
                      },
                      future: user.loadUser(),
                    ),
                  ),
                  // isi
                  Container(
                    width: 323.w,
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
